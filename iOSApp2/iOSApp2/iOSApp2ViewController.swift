//
//  ViewController.swift
//  iOSApp2
//
//  Created by Owner on 2024-06-09.
//

import UIKit

class iOSApp2ViewController: UITableViewController {
    // MARK: - Actions
       @IBAction func addItem() {
           let newRowIndex = items.count

           let item = MenuItem(text: "I am a new row", checked: false)
           items.append(item)

           let indexPath = IndexPath(row: newRowIndex, section: 0)
           let indexPaths = [indexPath]
           tableView.insertRows(at: indexPaths, with: .automatic)
       }
    // MARK: - Actions
    @IBAction func cancel() {
      navigationController?.popViewController(animated: true)
    }

    @IBAction func done() {
      navigationController?.popViewController(animated: true)
    }

    override func tableView(
      _ tableView: UITableView,
      commit editingStyle: UITableViewCell.EditingStyle,
      forRowAt indexPath: IndexPath
    ) {
      // 1
      items.remove(at: indexPath.row)

      // 2
      let indexPaths = [indexPath]
      tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    var items = [
        MenuItem(text: "Double Double Coffee", checked: false),
        MenuItem(text: "Timbits", checked: false),
        MenuItem(text: "Iced Capp", checked: false),
        MenuItem(text: "Bagel with Cream Cheese", checked: false),
        MenuItem(text: "Breakfast Sandwich", checked: false),
        MenuItem(text: "Chili", checked: false),
        MenuItem(text: "Donut", checked: false),
        MenuItem(text: "Muffin", checked: false),
        MenuItem(text: "Soup", checked: false),
        MenuItem(text: "Smoothie", checked: false),
        MenuItem(text: "Tim Hortons Tea", checked: false),
        MenuItem(text: "Hot Chocolate", checked: false),
        MenuItem(text: "Frozen Lemonade", checked: false),
        MenuItem(text: "Steeped Tea", checked: false),
        MenuItem(text: "Latte", checked: false),
        MenuItem(text: "Cappuccino", checked: false),
        MenuItem(text: "Mocha", checked: false),
        MenuItem(text: "Espresso", checked: false),
        MenuItem(text: "Café Mocha", checked: false),
        MenuItem(text: "Hot Apple Cider", checked: false),
        MenuItem(text: "Grilled Cheese", checked: false),
        MenuItem(text: "Turkey Bacon Club", checked: false),
        MenuItem(text: "BLT Sandwich", checked: false),
        MenuItem(text: "Ham & Cheese Sandwich", checked: false),
        MenuItem(text: "Chicken Salad Wrap", checked: false),
        MenuItem(text: "Garden Salad", checked: false),
        MenuItem(text: "Caesar Salad", checked: false),
        MenuItem(text: "Chicken Noodle Soup", checked: false),
        MenuItem(text: "Cream of Broccoli Soup", checked: false),
        MenuItem(text: "Beef Stew", checked: false),
        MenuItem(text: "Mac & Cheese", checked: false),
        MenuItem(text: "Potato Wedges", checked: false),
        MenuItem(text: "Hash Brown", checked: false),
        MenuItem(text: "Croissant", checked: false),
        MenuItem(text: "Strawberry Cheesecake Donut", checked: false),
        MenuItem(text: "Boston Cream Donut", checked: false),
        MenuItem(text: "Apple Fritter", checked: false),
        MenuItem(text: "Chocolate Chip Cookie", checked: false),
        MenuItem(text: "Oatmeal Raisin Cookie", checked: false),
        MenuItem(text: "Iced Coffee", checked: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Do any additional setup after loading the view.
    }
    // MARK: - Table View Data Source
    override func tableView(
      _ tableView: UITableView,
      numberOfRowsInSection section: Int
    ) -> Int {
      return items.count
    }

    override func tableView(
      _ tableView: UITableView,
      cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(
        withIdentifier: "IOSApp2Item",
        for: indexPath)

      // Add the following code
      let label = cell.viewWithTag(1000) as! UILabel
      label.text = items[indexPath.row].text

      return cell
    }
    // MARK: - Table View Delegate
    override func tableView(
      _ tableView: UITableView,
      didSelectRowAt indexPath: IndexPath
    ) {
      if let cell = tableView.cellForRow(at: indexPath) {
           let item = items[indexPath.row]
           item.checked.toggle()
           configureCheckmark(for: cell, at: indexPath)
       }
       tableView.deselectRow(at: indexPath, animated: true)
   }

   func configureCheckmark(
       for cell: UITableViewCell,
       at indexPath: IndexPath
   ) {
       let item = items[indexPath.row]
       cell.accessoryType = item.checked ? .checkmark : .none
   }

}

class MenuItem {
    var text: String
    var checked: Bool
    
    init(text: String, checked: Bool) {
        self.text = text
        self.checked = checked
    }
}
