//
//  DetailViewController.swift
//  Practice-first
//
//  Created by pathomphong charoenwichianchay on 12/8/2562 BE.
//  Copyright © 2562 pathomphong charoenwichianchay. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController:
UIViewController {
    
    @IBOutlet weak private var titleLabel: UILabel!
    var item: String = ""
    @IBAction func didTapButton(_ sender: Any) {
        //dismiss is close self
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //-------------day3 -afternoon---------
    
    func setTitle(title : String) {
        titleLabel.text = title
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTitle(title: item)
    }
    //-------------------------------------
    
    
}
