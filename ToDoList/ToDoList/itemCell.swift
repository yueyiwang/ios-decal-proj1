//
//  ItemCellViewController.swift
//  ToDoList
//
//  Created by Yueyi (Annie) Wang on 10/21/16.
//  Copyright © 2016 Yueyi (Annie) Wang. All rights reserved.
//

import UIKit

class itemCell: UITableViewCell, UITableViewDataSource {
    @IBOutlet weak var detailsField: UILabel!
    @IBOutlet weak var titleField:UILabel!
    @IBOutlet weak var tasksList: UITableView!
    
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
        let cell = self.tasksList.dequeueReusableCell(withIdentifier: "itemCell")! as! itemCell
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
