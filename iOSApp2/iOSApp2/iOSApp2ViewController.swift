//
//  ViewController.swift
//  iOSApp2
//
//  Created by Owner on 2024-06-09.
//

import UIKit

class iOSApp2ViewController: UITableViewController, AddItemViewControllerDelegate {
    var itemToEdit: MenuItem?
    var iOSApp2:iOSApp2!
    
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
    
    //func documentsDirectory() -> URL {
        //let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        //return paths[0]
    //}
    
//    func dataFilePath() -> URL {
//        return documentsDirectory().appendingPathComponent("MenuItem.plist")
//    }
    
    
//    func saveMenuItems() {
//        let encoder = PropertyListEncoder()
//        do {
//            let data = try encoder.encode(items)
//            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
//        } catch {
//            print("Error encoding item array: \(error.localizedDescription)")
//        }
//    }
//    func loadMenuItems() {
//        // 1
//        let path = dataFilePath()
//        // 2
//        if let data = try? Data(contentsOf: path) {
//            // 3
//            let decoder = PropertyListDecoder()
//            do {
//                // 4
//                iOSApp2.items = try decoder.decode(
//                    [MenuItem].self,
//                    from: data)
//            } catch {
//                print("Error decoding item array: \(error.localizedDescription)")
//            }
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Disable large titles for this view controller
        navigationItem.largeTitleDisplayMode = .never
        // Load items
        title = iOSApp2.name
    }
    
    
    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  iOSApp2.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IOSApp2Item", for: indexPath)
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = iOSApp2.items[indexPath.row].text
        return cell
    }
    
    // MARK: - Actions
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        iOSApp2.items.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
       
    }
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item =  iOSApp2.items[indexPath.row]
            item.checked.toggle()
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
       
    }
    
    
    func configureCheckmark(for cell: UITableViewCell, with item: MenuItem) {
        let label = cell.viewWithTag(1001) as! UILabel
        label.text = item.checked ? "√" : ""
    }
    
    // MARK: - Add Item ViewController Delegates
    func addItemViewControllerDidCancel(_ controller: AddItemViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: MenuItem) {
        let newRowIndex =  iOSApp2.items.count
        iOSApp2.items.append(item)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        navigationController?.popViewController(animated: true)
      
    }
    
    func addItemViewController(_ controller: AddItemViewController, didFinishEditing item: MenuItem) {
        if let index =  iOSApp2.items.firstIndex(of: item) {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) {
                configureText(for: cell, with: item)
            }
        }
        navigationController?.popViewController(animated: true)
      
    }
    
    func configureText(for cell: UITableViewCell, with item: MenuItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text =  item.text
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem" {
            let controller = segue.destination as! AddItemViewController
            controller.delegate = self
        } else if segue.identifier == "EditItem" {
            let controller = segue.destination as! AddItemViewController
            controller.delegate = self
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                controller.itemToEdit =  iOSApp2.items[indexPath.row]
            }
        }
    }
}
