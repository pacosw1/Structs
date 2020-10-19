//
//  FlashcardViewController.swift
//  Structs
//
//  Created by paco williams on 10/19/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit

class FlashcardViewController: UIViewController {
    
    
    var Flashcards: [Flashcard]!
    var TopicName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        title = TopicName
        setupPageControls()
        // Do any additional setup after loading the view.
    }
    
    
    
    func setupPageControls() {
        
        let PrevSection = UIView()
        PrevSection.backgroundColor = .red
        
        
        let NextSection = UIView()
        NextSection.backgroundColor = .green

        let IndicatorSection = UIView()
        IndicatorSection.backgroundColor = .blue

        
        let controlStackView = UIStackView(arrangedSubviews: [PrevSection, IndicatorSection, NextSection])
        
        
        controlStackView.axis = .horizontal
        controlStackView.distribution = .fillEqually
        
        //enable auto layout
        controlStackView.translatesAutoresizingMaskIntoConstraints = false
        //add stack view
        view.addSubview(controlStackView)
        
        
        //position on bottom safe area
        NSLayoutConstraint.activate([
            controlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            controlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            controlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            controlStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
