//
//  ViewController.swift
//  ToDoList
//
//  Created by Yueyi (Annie) Wang on 10/20/16.
//  Copyright © 2016 Yueyi (Annie) Wang. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    @IBOutlet weak var itemTitleField: UITextField!
    @IBOutlet weak var itemDetailsField: UITextField!
    @IBOutlet weak var Add: UIBarButtonItem!
    var t = ""
    var d = ""
    
    //func operatorPressed(_ sender: CustomButton)
    var item: ToDoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        itemTitleField.delegate = self
        itemDetailsField.delegate = self
    }
    
    @IBAction func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        print("prepare")
        t = itemTitleField.text!
        d = itemDetailsField.text!
        print(t)
        print(d)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITextFieldDelegat
    
    //MARK: Actions
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("should return")
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("end editing")
        t = textField.text!
        d = textField.text!
    }


}

