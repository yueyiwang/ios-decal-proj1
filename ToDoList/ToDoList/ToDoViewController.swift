//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by Yueyi (Annie) Wang on 10/20/16.
//  Copyright © 2016 Yueyi (Annie) Wang. All rights reserved.
//
// Referenced Open Source ToDo iOS app

import UIKit

var itemsList: [ToDoItem] = []

class ToDoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate {
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
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }
    
    // Display the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Must use 'self' here because searchResultsTableView needs to reuse the same cell in self.tableView
        let cell = self.tasksList.dequeueReusableCell(withIdentifier: "itemCell") as! itemCell
        var item : ToDoItem
        //item = itemsList[indexPath]
        item = itemsList[(indexPath as NSIndexPath).row] as ToDoItem
        
        cell.titleField.text = item.title
        cell.detailsField.text = item.details
        
        return cell
        
    }
    
    // MARK - UITableViewDelegate
    // Delete the cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            itemsList.remove(at: (indexPath as NSIndexPath).row)
            tasksList.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
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
        print("reloadedDAta")
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
