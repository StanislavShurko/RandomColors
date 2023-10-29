//
//  ColorsDetailVC.swift
//  RandomColors
//
//  Created by Stanislav Shurko on 29.10.23.
//

import UIKit

class ColorsDetailVC: UIViewController {
    
    var color: UIColor?;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = color ?? .green
    }
    
}
