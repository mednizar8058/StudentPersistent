//
//  AddStudentViewController.swift
//  StudentPersistent
//
//  Created by MNizar on 5/31/21.
//  Copyright © 2021 MNizar. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController {
    
    
    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var lname: UITextField!
    
    
    
    @IBAction func addStudent(_ sender: UIButton) {
        students.append(Student(fname: fname.text!,lname: lname.text!))
        
        fname.text = ""
        lname.text = ""
        print(students)
        
        let encodedList = try? PropertyListEncoder().encode(students)
        UserDefaults.standard.set(encodedList, forKey: "students")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
            
        }

        // Do any additional setup after loading the view.
    
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ViewController
        
        destination.students.append((fname.text!,lname.text!))
    }
 */
    
    

    

}
