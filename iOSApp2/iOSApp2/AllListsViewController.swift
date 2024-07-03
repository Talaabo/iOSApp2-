//
//  AllListsViewController.swift
//  iOSApp2
//
//  Created by Owner on 2024-06-26.
//

import UIKit

class AllListsViewController: UITableViewController, ListDetailViewControllerDelegate, UINavigationControllerDelegate {
    
    let cellIdentifier = "MenuCell"
    var dataModel: DataModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.lists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let checklist = dataModel.lists[indexPath.row]
        cell.textLabel?.text = checklist.name
        cell.accessoryType = .detailDisclosureButton
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(
           indexPath.row,
           forKey: "iOSApp2Index")
        let checklist = dataModel.lists[indexPath.row]
        performSegue(withIdentifier: "ShowiOSApp2", sender: checklist)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataModel.lists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            saveiOSApp2() // Save data after deletion
        }
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let controller = storyboard!.instantiateViewController(withIdentifier: "ListDetailViewController") as! ListDetailViewController
        controller.delegate = self
        controller.iOSApp2ToEdit = dataModel.lists[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: - ListDetailViewControllerDelegate
    
    func listDetailViewControllerDidCancel(_ controller: ListDetailViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func listDetailViewController(_ controller: ListDetailViewController, didFinishAdding checklist: iOSApp2) {
        let newRowIndex = dataModel.lists.count
        dataModel.lists.append(checklist)
        tableView.insertRows(at: [IndexPath(row: newRowIndex, section: 0)], with: .automatic)
        saveiOSApp2() // Save data after addition
        navigationController?.popViewController(animated: true)
    }
    
    func listDetailViewController(_ controller: ListDetailViewController, didFinishEditing checklist: iOSApp2) {
        if let index = dataModel.lists.firstIndex(of: checklist) {
            if let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) {
                cell.textLabel?.text = checklist.name
            }
        }
        saveiOSApp2() // Save data after editing
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowiOSApp2" {
            let controller = segue.destination as! iOSApp2ViewController
            controller.iOSApp2 = sender as? iOSApp2
        } else if segue.identifier == "AddiOSApp2" {
            let controller = segue.destination as! ListDetailViewController
            controller.delegate = self
        }
    }
    
    // MARK: - Helper Methods
    
    func saveiOSApp2() {
        // Implement your save logic here
        // For example, save data to UserDefaults or CoreData
        // Placeholder implementation:
       
    }
    // MARK: - Navigation Controller Delegates
    func navigationController(
      _ navigationController: UINavigationController,
      willShow viewController: UIViewController,
      animated: Bool
    ) {
      // Was the back button tapped?
      if viewController === self {
        UserDefaults.standard.set(-1, forKey: "ChecklistIndex")
      }
    }

}
