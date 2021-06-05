//
//  ViewController.swift
//  StudentPersistent
//
//  Created by MNizar on 5/31/21.
//  Copyright © 2021 MNizar. All rights reserved.
//

import UIKit

struct Student:Codable{
    // now Student supports encoding and decoding
    var fname:String
    var lname:String
}

var students = [Student]()

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = students[indexPath.row].fname
        cell.detailTextLabel?.text = students[indexPath.row].lname
        
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        studentTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            students.remove(at: indexPath.row)
            UserDefaults.standard.set(try? PropertyListEncoder().encode(students), forKey: "students")
            print("deleting")
            studentTable.reloadData()
        }
    }
    
    
    

    @IBOutlet weak var studentTable: UITableView!
    override func viewDidLoad(){
        
        super.viewDidLoad()
        if let loadedData = UserDefaults.standard.object(forKey: "students"){
        
            students = try! PropertyListDecoder().decode([Student].self, from: loadedData as! Data)
        
            studentTable.reloadData()
    }


}

}
