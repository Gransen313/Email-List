//
//  ListViewController.swift
//  Email-List
//
//  Created by Sergey Borisov on 15.04.2020.
//  Copyright © 2020 Sergey Borisov. All rights reserved.
//

import UIKit
import Firebase
import Kingfisher

class ListViewController: UIViewController {
    
    //Arrays of emails for filling listTableView.
    private var emails: [EmailListModel.Email] = []
    private var searchEmails: [EmailListModel.Email] = []
    
    //Variable that indicates searching process.
    private var searchBarIsUsing = false
    
    //Creation of database instance.
    let db = Firestore.firestore()

    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.dataSource = self
        listTableView.delegate = self
        searchBar.delegate = self
        searchBar.isHidden = true
        
        navigationItem.hidesBackButton = true
        
        fillEmailListIntoFirebase()
        
        //Set a custom cell for listTableView.
        listTableView.register(UINib(nibName: Const.cellNibName, bundle: nil), forCellReuseIdentifier: Const.cellID)
        
        loadEmailList()
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        let firebaseAuth = Auth.auth()
        //Try to log out from current user account.
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    //MARK:  Methods For Filling Firebase Collection
    //Fill Firebase database with reserve list of emails if database hasn't got enough emails.
    private func fillEmailListIntoFirebase() {
        //Try to get data of "emails" Firebase collection.
        db.collection(Const.FStore.collectionName).getDocuments { (querySnapshot, error) in
            if let e = error {
                print("There was a problem with getting data from Firestore: \(e)!")
            } else {
                //Check if number of emails is less than 30.
                if let numberOfDocs = querySnapshot?.count {
                    if numberOfDocs < 30 {
                        print("It's detected less emails in list than needed! Start to fill!")
                        //Delete all documents from emails collection in Firebase.
                        self.deleteDocumentsFromFirebaseCollection(querySnapshot)
                        //Add reserve email collection to Firestore database.
                        self.addDocumentsToFirebaseCollection()
                        self.loadEmailList()
                    }
                }
            }
        }
    }
    
    //Function for deleting documents from Firebase collection.
    private func deleteDocumentsFromFirebaseCollection(_ querySnapshot: QuerySnapshot?) {
        if let docs = querySnapshot?.documents {
            for doc in docs {
                db.collection(Const.FStore.collectionName).document(doc.documentID).delete() { err in
                    if let err = err {
                        print("Error removing document: \(err)")
                    } else {
                        print("Document successfully removed!")
                    }
                }
            }
        }
    }
    
    //Function for adding documents to firebase collection.
    private func addDocumentsToFirebaseCollection() {
        for elementNumber in 0 ..< EmailListModel.emails.count {
            self.db.collection(Const.FStore.collectionName).addDocument(data: [

                Const.FStore.avatarField : EmailListModel.emails[elementNumber].avatarURL,
                Const.FStore.senderField : EmailListModel.emails[elementNumber].sender,
                Const.FStore.subTitleField : EmailListModel.emails[elementNumber].subTitle,
                Const.FStore.bodyField : EmailListModel.emails[elementNumber].body,
                Const.FStore.dateField : EmailListModel.emails[elementNumber].date

            ]) { (error) in
                if let e = error {
                    print("Problem saving data to Firestore: \(e)!!")
                }
            }
        }
    }
    
    //MARK: Methods For Getting Firebase Collection
    //Get emails from Firebase.
    private func loadEmailList() {
        //Try to get data of "emails" Firebase collection ordered by "date" and "sender".
        db.collection(Const.FStore.collectionName)
            .order(by: Const.FStore.dateField)
            .order(by: Const.FStore.senderField)
            .getDocuments { (querySnapshot, error) in
            //Chek if "error" is not nil.
            if let e = error {
                print("There was a problem getting documents from Fisebase: \(e)!!")
            } else {
                //Check if "querySnapshot" is not nil.
                if let snapshotDocuments = querySnapshot?.documents {
                    self.fillEmailsArray(snapshotDocuments)
                }
            }
        }
    }
    
    //Fill array "emails" with data from Firebase.
    private func fillEmailsArray(_ snapshotDocuments: [QueryDocumentSnapshot]) {
        for doc in snapshotDocuments {
            
            let data = doc.data()
            if  let avatarURL = data[Const.FStore.avatarField] as? String,
                let sender = data[Const.FStore.senderField] as? String,
                let date = data[Const.FStore.dateField] as? Timestamp,
                let subTitle = data[Const.FStore.subTitleField] as? String,
                let body = data[Const.FStore.bodyField] as? String
            {
                let emailDate = date.dateValue()
                //Cteate new instanse of type EmailListModel.Email.
                let newEmail = EmailListModel.Email(avatarURL: avatarURL, sender: sender, subTitle: subTitle, body: body, date: emailDate)
                //Add new instance into array "emails".
                self.emails.append(newEmail)
                
                DispatchQueue.main.async {
                    self.listTableView.reloadData()
                }
            }
        }
    }
}

//MARK: - UITableViewDataSource

extension ListViewController: UITableViewDataSource {
    
    //Return number of emails in list.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchBarIsUsing {
            return searchEmails.count
        } else {
            return emails.count
        }
    }
    
    //Fill each cell from list.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Create cell custom "EmailCell" format.
        let cell = listTableView.dequeueReusableCell(withIdentifier: Const.cellID, for: indexPath) as! EmailCell
        //Fill current cell with properties.
        func fillCell(_ emails: [EmailListModel.Email]) {
            
            let url = URL(string: emails[indexPath.row].avatarURL)

            cell.avatarImage.kf.setImage(with: url)
            cell.senderLabel.text = emails[indexPath.row].sender
            cell.dateLabel.text = emails[indexPath.row].date.toString(dateFormat: Const.dateFormat)
            cell.subtitleLabel.text = emails[indexPath.row].subTitle
            cell.emailBody.text = emails[indexPath.row].body
        }
        //Check searching is activ or not.
        if searchBarIsUsing {
            fillCell(searchEmails)
        } else {
            fillCell(emails)
        }
        
        return cell
    }
}

//MARK: - Search Bar Methods

extension ListViewController: UISearchBarDelegate {
    
    //Keep track for changes in searchBar.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //Filter emails from "emails" array to "searchEmails" array.
        searchEmails = emails.filter({$0.sender.lowercased().prefix(searchText.count) == searchText.lowercased() || $0.subTitle.lowercased().prefix(searchText.count) == searchText.lowercased()})
        
        //If text for searching has been cleared, process of searching finishes.
        if searchText == "" {
            searchBarIsUsing = false
        } else {
            searchBarIsUsing = true
        }
        
        DispatchQueue.main.async {
            self.listTableView.reloadData()
        }
    }
    
    //What's happen when "Search" button is pressed.
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

//MARK: - ListViewController Delegate Methods
extension ListViewController: UITableViewDelegate, UIScrollViewDelegate {
    
    //Detect if user is scrolling up and down.
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let translation = scrollView.panGestureRecognizer.translation(in: scrollView.superview)
        //When scrolling down searchBar appears, up - dissappears.
        if translation.y > 0 {
            self.searchBar.isHidden = false
        } else if translation.y < 0 {
            if !searchBarIsUsing {
                self.searchBar.isHidden = true
                searchBar.resignFirstResponder()
            }
        }
    }
}

//MARK: - Get String from Date

extension Date {
    //Get String from Date with setted format.
    func toString(dateFormat format: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: self)
    }
}

