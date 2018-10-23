//
//  ViewController.swift
//  Checklist_tutorial
//
//  Created by MikeyT on 9/25/18.
//  Copyright © 2018 MikeyT. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    //create items array
    var items: [ChecklistItem]
    
    //add button logic
    @IBAction func addItem(_ sender: Any) {
        print("added item")
        
        let newRowIndex = items.count
        let item  = ChecklistItem()
        //item.text = "I am a new row"
        
        var titles = ["butt", "blue skidoo", "empty", "randomempty"]
        let randomNumber = arc4random_uniform(UInt32(titles.count))
        let title = titles[Int(randomNumber)]
        item.text = title
        item.checked = true
        
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section:0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
    }
    //create model
    

    

    //initializor
    
    required init?(coder aDecoder: NSCoder) {
        
        //populate and add to array
        items = [ChecklistItem]()
        
        let row0Item = ChecklistItem()
        row0Item.text = "Walk the dog"
        row0Item.checked = false
        items.append(row0Item)
        
        let row1Item = ChecklistItem()
        row1Item.text = "Wash my clothes"
        row1Item.checked = false
        items.append(row1Item)
        
        let row2Item = ChecklistItem()
        row2Item.text = "Learn IOS"
        row2Item.checked = false
        items.append(row2Item)
        
        let row3Item = ChecklistItem()
        row3Item.text = "Soccor practice"
        row3Item.checked = false
        items.append(row3Item)
        
        let row4Item = ChecklistItem()
        row4Item.text = "Eat ice cream"
        row4Item.checked = false
        items.append(row4Item)
        
        super.init(coder: aDecoder)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //if on ios11 or higher, change title on navigation controller to large
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //enable swipe to delete with override
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        //delete with animation
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        //delete without animation
        //tableView.reloadData()
    }
    
    //how many rows to display in tableview
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    //action taken when user taps on cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            
            let item = items[indexPath.row]
            item.toggleChecked()
            

            configureCheckmark(for: cell, with: item)

            tableView.deselectRow(at: indexPath, animated: true)
        }

    }
    //creates a ChecklistItem cell
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let item = items[indexPath.row]
        
        
        
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        
        return cell
    }
    
    //sets ChecklistItem text label
    func configureText(for cell: UITableViewCell, with item: ChecklistItem){
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text

    }
    
    //sets ChecklistItem checkmark accessory
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem){
        
        if (item.checked){
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
    }

}

