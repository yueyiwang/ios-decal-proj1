//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by Yueyi (Annie) Wang on 10/20/16.
//  Copyright © 2016 Yueyi (Annie) Wang. All rights reserved.
//

import UIKit

var itemsList: [ToDoItem] = []

class ToDoViewController: UIViewController, UITableViewDelegate, UISearchDisplayDelegate {
    //MARK: properties
    //@IBOutlet weak var titleField: UILabel!
    //@IBOutlet weak var detailsField: UILabel!
    //@IBOutlet weak var titleField:UILabel!
    @IBOutlet weak var tasksList: UITableView!
    
    //var item:ToDoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tasksList.reloadData()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK - Storyboard stuff
    // Unwind
    @IBAction func unwindToViewController(sender: UIStoryboardSegue)
    {
        if let src = sender.source as? AddViewController {
            // Pull any data from the view controller which initiated the unwind segue.
            self.tasksList.reloadData()
            print("unwind")
            let item = ToDoItem(title: src.t, details: src.d)
            print(src.t)
            print(src.d)
            itemsList.append(item)
            print("printing")
            for i in 0...itemsList.count-1{
                print(i)
                print(itemsList[i].title)
                //self.tableView(tableView: tasksList, cellForRowAt indexPath: i)
            }
            print("end printing")
        }
        //print(tasksList)
        tasksList.reloadData()
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
