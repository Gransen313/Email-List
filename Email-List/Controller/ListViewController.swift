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
    
    let db = Firestore.firestore()

    @IBOutlet weak var listTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTableView.dataSource = self
        
        navigationItem.hidesBackButton = true
        
        fillMessageList()
        
        listTableView.register(UINib(nibName: "EmailCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
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
    
    func fillMessageList() {
        
        if db.collection("emails").accessibilityElementCount() == 0 {
            print("There aren't any elements in collection!!")
        } else {
            print("Collection has already been created!!")
        }
    }
}

//MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return EmailListModel.emails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = listTableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! EmailCell
        
        let url = URL(string: EmailListModel.emails[indexPath.row].avatarURL)
        
        cell.avatarImage.kf.setImage(with: url)
        cell.senderLabel.text = EmailListModel.emails[indexPath.row].sender
        cell.dateLabel.text = EmailListModel.emails[indexPath.row].date.toString(dateFormat: "dd MMM yyyy")
        cell.subtitleLabel.text = EmailListModel.emails[indexPath.row].subTitle
        cell.emailBody.text = EmailListModel.emails[indexPath.row].body
        
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

//let ref = Database.database().reference(fromURL: "DATABASE_PATH")
//ref.observe(.value, with: { (snapshot: DataSnapshot!) in
//    if(snapshot.childrenCount > 0){ // It has value already
//
//        print(" value")
//
//    }
//    else{ // Still Empty
//
//
//          print("No value")
//    }
//})
//
//var ref = Firebase(url: FIREBASE_URL)
//ref.observeEventType(.Value, withBlock: { (snapshot: FDataSnapshot!) in
//    if(snapshot.childrenCount > 0){ // It has value already
//
//   }
//  else{ // Still Empty
//
//    // Upload values to firebase
//
//   }
//})
