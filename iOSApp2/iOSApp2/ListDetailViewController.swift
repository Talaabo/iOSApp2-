//
//  ListDetailViewController.swift
//  iOSApp2
//
//  Created by Owner on 2024-06-29.
//

import UIKit

protocol ListDetailViewControllerDelegate: AnyObject {
  func listDetailViewControllerDidCancel(
    _ controller: ListDetailViewController)

  func listDetailViewController(
    _ controller: ListDetailViewController,
    didFinishAdding iOSApp2: iOSApp2
  )

  func listDetailViewController(
    _ controller: ListDetailViewController,
    didFinishEditing iOSApp2: iOSApp2
  )
}

class ListDetailViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet var textField: UITextField!
    @IBOutlet var doneBarButton: UIBarButtonItem!
    weak var delegate: ListDetailViewControllerDelegate?
    var iOSApp2ToEdit: iOSApp2?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let checklist = iOSApp2ToEdit {
            title = "Edit iOSApp2"
            textField.text = checklist.name
            doneBarButton.isEnabled = true
        }
    }
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      textField.becomeFirstResponder()
    }
    // MARK: - Actions
    @IBAction func cancel() {
      delegate?.listDetailViewControllerDidCancel(self)
       
    }

    @IBAction func done() {
      if let iOSApp2 = iOSApp2ToEdit {
        iOSApp2.name = textField.text!
        delegate?.listDetailViewController(
          self,
          didFinishEditing: iOSApp2)
      } else {
        let iOSApp2 = iOSApp2(name: textField.text!)
        delegate?.listDetailViewController(
          self,
          didFinishAdding: iOSApp2)
      }
    }
    // MARK: - Table View Delegates
    override func tableView(
      _ tableView: UITableView,
      willSelectRowAt indexPath: IndexPath
    ) -> IndexPath? {
      return nil
    }
    // MARK: - Text Field Delegates
    func textField(
      _ textField: UITextField,
      shouldChangeCharactersIn range: NSRange,
      replacementString string: String
    ) -> Bool {
      let oldText = textField.text!
      let stringRange = Range(range, in: oldText)!
      let newText = oldText.replacingCharacters(
        in: stringRange,
        with: string)
      doneBarButton.isEnabled = !newText.isEmpty
      return true
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
      doneBarButton.isEnabled = false
      return true
    }

}

