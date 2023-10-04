//
//  ViewController.swift
//  LackTraining
//
//  Created by User on 25/09/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }


}

extension ViewController {
    func configureLayout(){
        self.view.backgroundColor = UIColor.systemBlue
    }
    
    static var hello = ["Hello"];
}

