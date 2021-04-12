//
//  DisplayLogTwoViewController.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 10/04/21.
//

import UIKit

class DisplayLogTwoViewController: UIViewController {

    var selectedCategory: Category?{
        didSet{
            //loadItems() -> melakukan load data yg disimpan dari core data (nb: entitynya beda)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
