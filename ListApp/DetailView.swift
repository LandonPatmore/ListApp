//
//  DetailView.swift
//  ListApp
//
//  Created by Landon Patmore on 1/18/18.
//  Copyright © 2018 Landon Patmore. All rights reserved.
//

import UIKit
import CoreData

class DetailView: UITableViewController, UITextFieldDelegate {
  
  var name: String?
  var tintColor: UIColor?
  var items: [String] = []
  
  @IBOutlet var table: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = name
    
    setupTable()
    resetNavs()
    
  }
  
  func setupTable() -> Void {
    table.delegate = self
    table.dataSource = self
    
    let rightButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.plain, target: self, action: #selector(showEditing))
    self.navigationItem.rightBarButtonItem = rightButton
  }
  
  func resetNavs() -> Void {
    self.navigationController?.navigationBar.tintColor = tintColor
    self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: tintColor!]
    self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: tintColor!]
  }
    
  @objc func showEditing(){
    if(self.tableView.isEditing == true){
        self.setEditing(false, animated: true)
        self.navigationItem.rightBarButtonItem?.title = "Edit"
    } else {
        self.setEditing(true, animated: true)
        self.navigationItem.rightBarButtonItem?.title = "Done"
    }
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    addItemToList(item: textField.text!)
    textField.text = nil
    return true
  }
  
  func addItemToList(item: String) -> Void {
    items.append(item)
    table.reloadData()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count + 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if(indexPath.row == 0){
        let cell = table.dequeueReusableCell(withIdentifier: "textFieldCell", for: indexPath) as! CustomTextFieldCell
        cell.addItem.delegate = self
        cell.addItem.textColor = tintColor
        return cell
    }
  
    let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    let index = indexPath.row - 1
    cell.textLabel?.text = items[index]
    cell.textLabel?.textColor = tintColor
    return cell
  }
  
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return indexPath.row == 0 ? false : true
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        self.items.remove(at: indexPath.row - 1)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
  }
}
