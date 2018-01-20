//
//  ViewController.swift
//  ListApp
//
//  Created by Landon Patmore on 1/17/18.
//  Copyright © 2018 Landon Patmore. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

  @IBOutlet var table: UITableView!
  
  let lists = ["Groceries", "Games", "Reminders"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  func setUp() -> Void {
    let time = UInt32(NSDate().timeIntervalSinceReferenceDate)
    srand48(Int(time))
    
    table.delegate = self
    table.dataSource = self
  }
  
  override func viewDidAppear(_ animated: Bool) {
    self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
    self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func generateRandomColor() -> UIColor {
    return UIColor(red: randColor(), green: randColor(), blue: randColor(), alpha: 1.0)
  }
  
  func randColor() -> CGFloat {
    return CGFloat(drand48())
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return lists.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = lists[indexPath.row]
    cell.textLabel?.textColor = generateRandomColor()
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ShowDetails", let destinationVC = segue.destination as? DetailView,
        let index = table.indexPathForSelectedRow?.row {
        destinationVC.name = lists[index]
        destinationVC.tintColor = table.cellForRow(at: table.indexPathForSelectedRow!)?.textLabel?.textColor
    }
  }

}

