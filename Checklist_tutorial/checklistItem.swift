//
//  checklistItem.swift
//  Checklist_tutorial
//
//  Created by MikeyT on 9/28/18.
//  Copyright © 2018 MikeyT. All rights reserved.
//

import Foundation

class ChecklistItem{
    var text = ""
    var checked = false
    
    func toggleChecked(){
        checked = !checked
    }
    
}
