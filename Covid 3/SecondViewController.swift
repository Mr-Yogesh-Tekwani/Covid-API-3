//
//  SecondViewController.swift
//  Covid 3
//
//  Created by Yogesh Tekwani on 6/1/23.
//

import UIKit

class SecondViewController: UIViewController {

    var l1text : String = ""
    var l2text : String = ""
    var l3text : String = ""
    
    let stack: UIStackView = {
       let sv = UIStackView()
        sv.distribution = .fillEqually
        sv.alignment = .center
        sv.axis = .vertical
        sv.backgroundColor = .white
        return sv
    }()
    
    let l1 : UILabel = {
       let l = UILabel()
        l.textColor = .blue
        return l
    }()
    
    let l2 : UILabel = {
       let l = UILabel()
        l.textColor = .blue
        return l
    }()
    
    let l3 : UILabel = {
       let l = UILabel()
        l.textColor = .blue
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Details"
        
        stack.addArrangedSubview(l1)
        stack.addArrangedSubview(l2)
        stack.addArrangedSubview(l3)
        
        l1.text = l1text
        l2.text = l2text
        l3.text = l3text
        
        self.view.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: safeArea.topAnchor),
            stack.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            stack.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            stack.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor)
        ])
    }
}
