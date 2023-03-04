//
//  ViewController.swift
//  SparrowMatathonTask2
//
//  Created by Dmitriy Shrayber on 04.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let button1 = AnimatedButton(title: "First Button", action: nil, image: "1.circle.fill")
    let button2 = AnimatedButton(title: "Second Medium Button", action: nil, image: "2.circle.fill")
    let button3 = AnimatedButton(title: "Third", action: #selector(showModalView), image: "3.circle.fill")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureConstraints()
    }
    
    private func setupViews() {
        
        self.view.addSubview(button1)
        self.view.addSubview(button2)
        self.view.addSubview(button3)
        
        self.view.backgroundColor = .white
    }
    
    private func configureConstraints() {
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 12),
            button1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            button2.topAnchor.constraint(equalTo: self.button1.bottomAnchor, constant: 8),
            button2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            button3.topAnchor.constraint(equalTo: self.button2.bottomAnchor, constant: 8),
            button3.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)

        ])
    }
    
    @objc func showModalView() {
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .pageSheet
        nc.modalTransitionStyle = .coverVertical
        self.present(nc, animated: true, completion: nil)
    }

}

