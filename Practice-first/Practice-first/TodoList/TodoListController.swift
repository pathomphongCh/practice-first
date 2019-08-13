//
//  TodoListController.swift
//  Practice-first
//
//  Created by pathomphong charoenwichianchay on 11/8/2562 BE.
//  Copyright © 2562 pathomphong charoenwichianchay. All rights reserved.
//



import UIKit

class TodoListController: UIViewController {
   
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var todoList: [TodoItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addItemButtonPressed(_ sender: Any) {
        if let newTodoListItemTitle = todoTextField.text,
            !newTodoListItemTitle.isEmpty {
            let newTodoItem: TodoItem = TodoItem(title: newTodoListItemTitle, isChecked: false)
            todoList.append(newTodoItem)
            todoTextField.text = nil
            print(todoList)
            tableView.reloadData()
        }
    }
//--------------------------------------Swipe to delete todoListItem-------------------------------------
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            todoList.remove(at: indexPath.row)
            tableView.deleteRows(at:[indexPath] , with: .automatic)
        }
    }
}

extension TodoListController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return todoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard todoList.indices.contains(indexPath.row),
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListCell", for: indexPath)
                as? TodoItemTableViewCell else {
                    return UITableViewCell()
        }

        let todoItem = todoList[indexPath.row]
        cell.setupUI(todoItem: todoItem)
        cell.delegate = self
        return cell
    }

}
//---------------------Set initial title and status-----------------------------
extension TodoListController: TodoItemTableViewCellDelegate {
    func didCheckTodoItem(cell: TodoItemTableViewCell) {
        if let index = tableView.indexPath(for: cell){
            let todoItem = todoList.remove(at: index.row)
            let newTodoItem = TodoItem(title: todoItem.title, isChecked: !todoItem.isChecked)
            todoList.insert(newTodoItem, at: index.row)
            tableView.reloadData()
        }
    }
}


//------------------------Tap list to view detail------------------------------
extension TodoListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DetailView", bundle: nil)
        guard let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewControllerId") as? DetailViewController else{
            return
        }
        let item = todoList[indexPath.item].title
        detailViewController.item = item
        self.present(detailViewController, animated: true, completion: nil)
    }
}


