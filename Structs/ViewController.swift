//
//  ViewController.swift
//  Structs
//
//  Created by paco williams on 10/17/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    let host = UIHostingController(rootView: CourseList())


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addChild(host)
        print("test")
        view.addSubview(host.view)
        host.didMove(toParent: self)
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        
        host.view.translatesAutoresizingMaskIntoConstraints = false
        
        host.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        host.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        host.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        host.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }


}

