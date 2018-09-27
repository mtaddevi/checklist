//
//  ViewController.swift
//  Checklist_tutorial
//
//  Created by MikeyT on 9/25/18.
//  Copyright © 2018 MikeyT. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    //create model
    
    let row0Text = "Run a marathon"
    let row1Text = "Wash my clothes"
    let row2Text = "Learn IOS"
    let row3Text = "Soccor practice"
    let row4Text = "Eat ice cream"
    
    
    var row0Checked = false
    var row1Checked = false
    var row2Checked = false
    var row3Checked = false
    var row4Checked = false
    



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //how many rows to display in tableview
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //action taken when user taps on cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            
            var isChecked = false
            
            
            if (indexPath.row==0){
                row0Checked = !row0Checked
                isChecked = row0Checked
                }
            
            if (indexPath.row==1){
                row1Checked = !row1Checked
                isChecked = row1Checked
            }
            if (indexPath.row==2){
                row2Checked = !row2Checked
                isChecked = row2Checked
            }
            if (indexPath.row==3){
                row3Checked = !row3Checked
                isChecked = row3Checked
            }
            if (indexPath.row==4){
                row4Checked = !row4Checked
                isChecked = row4Checked
            }
        if(isChecked){
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }

            tableView.deselectRow(at: indexPath, animated: true)
        }

    }
    //creates a ChecklistItem cell
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let label = cell.viewWithTag(1000) as! UILabel
        
        
        if (indexPath.row%5==0) {
            label.text = row0Text
        }else if (indexPath.row%5==1 ){
            label.text = row1Text
        }else if (indexPath.row%5==2 ){
            label.text = row2Text
        }else if (indexPath.row%5==3 ){
            label.text = row3Text
        }else if (indexPath.row%5==4 ){
            label.text = row4Text
        }else{
            label.text = "Unset item"
        }

        
        return cell
    }

}

