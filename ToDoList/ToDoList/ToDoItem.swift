//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Yueyi (Annie) Wang on 10/20/16.
//  Copyright © 2016 Yueyi (Annie) Wang. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    var title: String
    var details: String
    //var date: Date
    
    init (title: String, details: String) {//, date: Date) {
        self.title = title
        self.details = details
        //self.date = date
    }

}
