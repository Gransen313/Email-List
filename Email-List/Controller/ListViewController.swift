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
    
    var emails: [EmailListModel.Email] = []
    
    let db = Firestore.firestore()

    @IBOutlet weak var listTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTableView.dataSource = self
        
        navigationItem.hidesBackButton = true
        
        fillEmailListIntoFirestore()
        
        listTableView.register(UINib(nibName: "EmailCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
        loadEmailList()
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    func fillEmailListIntoFirestore() {
        
        db.collection("emails").getDocuments { (querySnapshot, error) in
            
            if let e = error {
                
                print("There was a problem with getting data from Firestore: \(e)!")
                
            } else {
                
                if let numberOfDocs = querySnapshot?.count {
                    if numberOfDocs < 30 {
                        
                        print("There were less emails in list than needed, starting to add emails!!")
                        
                        for elementNumber in 0..<EmailListModel.emails.count {

                            self.db.collection("emails").addDocument(data: [

                                "avatarURL" : EmailListModel.emails[elementNumber].avatarURL,
                                "sender" : EmailListModel.emails[elementNumber].sender,
                                "subTitle" : EmailListModel.emails[elementNumber].subTitle,
                                "body" : EmailListModel.emails[elementNumber].body,
                                "date" : EmailListModel.emails[elementNumber].date

                            ]) { (error) in
                                if let e = error {
                                    print("There was a problem with saving data to Firestore: \(e)!!")
                                } else {
                                    print()
                                }
                            }
                        }
                        
                        self.loadEmailList()
                        
                    } else {
                        print("There are enough emails in Firebase list!!")
                    }
                }
            }
        }
    }
    
    func loadEmailList() {
        
        db.collection("emails")
            .order(by: "date")
            .order(by: "sender")
            .addSnapshotListener { (querySnapshot, error) in
            if let e = error {
                print("There was a problem with gettinf documents from Fisebase: \(e)!!")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        
                        let data = doc.data()
                        
                        if  let avatarURL = data["avatarURL"] as? String,
                            let sender = data["sender"] as? String,
                            let date = data["date"] as? Timestamp,
                            let subTitle = data["subTitle"] as? String,
                            let body = data["body"] as? String {
                            
                            let emailDate = date.dateValue()
                            
                            let newEmail = EmailListModel.Email(avatarURL: avatarURL, sender: sender, subTitle: subTitle, body: body, date: emailDate)
                            
                            self.emails.append(newEmail)
                            
                            DispatchQueue.main.async {
                                self.listTableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
}

//MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return emails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = listTableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! EmailCell

        let url = URL(string: emails[indexPath.row].avatarURL)

        cell.avatarImage.kf.setImage(with: url)
        cell.senderLabel.text = emails[indexPath.row].sender
        cell.dateLabel.text = emails[indexPath.row].date.toString(dateFormat: "dd MMM yyyy")
        cell.subtitleLabel.text = emails[indexPath.row].subTitle
        cell.emailBody.text = emails[indexPath.row].body
        
        return cell
    }
}

//MARK: - Get String from Date
extension Date {
    
    func toString(dateFormat format: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: self)
    }
}
