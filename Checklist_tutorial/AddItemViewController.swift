//
//  AddItemViewController.swift
//  Checklist_tutorial
//
//  Created by MikeyT on 10/22/18.
//  Copyright © 2018 MikeyT. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .never
        } else {
            // Fallback on earlier versions
        }
        //textField.delegate = self
        
        //allows to hide keyboard based on user action relative to viewController stack
//        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//            textField.resignFirstResponder()
//            return false
//        }
        
    }
    override func viewWillAppear(_ animated: Bool){
        textField.becomeFirstResponder()
    }
    
    @IBAction func cancel(){
        navigationController?.popViewController(animated: true)
    }
    @IBAction func done(){
        navigationController?.popViewController(animated: true)
        print("Contents of text field: \(textField.text)")
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
 
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in:oldText)
        let newText = oldText.replacingCharacters(in: stringRange!, with: string)
        if newText.isEmpty{
            doneBarButton.isEnabled = false
        }else{
            doneBarButton.isEnabled = true
        }
        return true
    }
}
