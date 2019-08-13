//
//  TodoItemTableViewCell.swift
//  Practice-first
//
//  Created by pathomphong charoenwichianchay on 11/8/2562 BE.
//  Copyright © 2562 pathomphong charoenwichianchay. All rights reserved.
//

import UIKit
protocol TodoItemTableViewCellDelegate: class{
    func didCheckTodoItem(cell: TodoItemTableViewCell)
}

class TodoItemTableViewCell: UITableViewCell {
    @IBOutlet weak var todoItemImageView: UIImageView!
    @IBOutlet weak var todoItemTitle: UILabel!

    var tapGestureRegcognizer: UITapGestureRecognizer!
    var delegate: TodoItemTableViewCellDelegate?
    var todoItem: TodoItem!

    func setupUI(todoItem: TodoItem){
        self.todoItem = todoItem
        todoItemTitle.text = todoItem.title
        if todoItem.isChecked {
            todoItemImageView.image = #imageLiteral(resourceName: "check.png")
        } else {
            todoItemImageView.image = #imageLiteral(resourceName: "uncheck.png")
        }
        tapGestureRegcognizer = UITapGestureRecognizer(target: self, action: #selector(todoImageViewTapped(sender:)))
        todoItemImageView.gestureRecognizers = [tapGestureRegcognizer]
    }
    
    
    @objc func todoImageViewTapped(sender: Any){
        print("Image view is tapped")
        delegate?.didCheckTodoItem(cell:self)
}
    
    

}
