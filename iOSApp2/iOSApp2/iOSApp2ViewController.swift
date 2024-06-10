//
//  ViewController.swift
//  iOSApp2
//
//  Created by Owner on 2024-06-09.
//

import UIKit

class iOSApp2ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // MARK: - Table View Data Source
    override func tableView(
      _ tableView: UITableView,
      numberOfRowsInSection section: Int
    ) -> Int {
      return 42
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

        if indexPath.row == 0 {
           label.text = "Double Double Coffee"
         } else if indexPath.row == 1 {
           label.text = "Timbits"
         } else if indexPath.row == 2 {
           label.text = "Iced Capp"
         } else if indexPath.row == 3 {
           label.text = "Bagel with Cream Cheese"
         } else if indexPath.row == 4 {
           label.text = "Breakfast Sandwich"
         } else if indexPath.row == 5 {
           label.text = "Chili"
         } else if indexPath.row == 6 {
           label.text = "Donut"
         } else if indexPath.row == 7 {
           label.text = "Muffin"
         } else if indexPath.row == 8 {
           label.text = "Soup"
         } else if indexPath.row == 9 {
           label.text = "Smoothie"
         } else if indexPath.row == 10 {
           label.text = "Tim Hortons Tea"
         } else if indexPath.row == 11 {
           label.text = "Hot Chocolate"
         } else if indexPath.row == 12 {
           label.text = "Frozen Lemonade"
         } else if indexPath.row == 13 {
           label.text = "Steeped Tea"
         } else if indexPath.row == 14 {
           label.text = "Latte"
         } else if indexPath.row == 15 {
           label.text = "Cappuccino"
         } else if indexPath.row == 16 {
           label.text = "Mocha"
         } else if indexPath.row == 17 {
           label.text = "Espresso"
         } else if indexPath.row == 18 {
           label.text = "Café Mocha"
         } else if indexPath.row == 19 {
           label.text = "Hot Apple Cider"
         } else if indexPath.row == 20 {
           label.text = "Grilled Cheese"
         } else if indexPath.row == 21 {
           label.text = "Turkey Bacon Club"
         } else if indexPath.row == 22 {
           label.text = "BLT Sandwich"
         } else if indexPath.row == 23 {
           label.text = "Ham & Cheese Sandwich"
         } else if indexPath.row == 24 {
           label.text = "Chicken Salad Wrap"
         } else if indexPath.row == 25 {
           label.text = "Garden Salad"
         } else if indexPath.row == 26 {
           label.text = "Caesar Salad"
         } else if indexPath.row == 27 {
           label.text = "Chicken Noodle Soup"
         } else if indexPath.row == 28 {
           label.text = "Cream of Broccoli Soup"
         } else if indexPath.row == 29 {
           label.text = "Beef Stew"
         } else if indexPath.row == 30 {
           label.text = "Mac & Cheese"
         } else if indexPath.row == 31 {
           label.text = "Potato Wedges"
         } else if indexPath.row == 32 {
           label.text = "Hash Brown"
         } else if indexPath.row == 33 {
           label.text = "Croissant"
         } else if indexPath.row == 34 {
           label.text = "Strawberry Cheesecake Donut"
         } else if indexPath.row == 35 {
           label.text = "Boston Cream Donut"
         } else if indexPath.row == 36 {
           label.text = "Apple Fritter"
         } else if indexPath.row == 37 {
           label.text = "Chocolate Chip Cookie"
         } else if indexPath.row == 38 {
           label.text = "Oatmeal Raisin Cookie"
         } else if indexPath.row == 39 {
           label.text = "Iced Coffee"
         }

         return cell
       }
    // MARK: - Table View Delegate
    override func tableView(
      _ tableView: UITableView,
      didSelectRowAt indexPath: IndexPath
    ) {
      if let cell = tableView.cellForRow(at: indexPath) {
        if cell.accessoryType == .none {
          cell.accessoryType = .checkmark
        } else {
          cell.accessoryType = .none
        }
      }

      tableView.deselectRow(at: indexPath, animated: true)
    }
}

