//
//  DetailViewController.swift
//  Sample
//
//  Created by Balaji K S on 01/05/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var viewModel: ProductViewModel?
    var userIdLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var idLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var bodyLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        setTitle()
        setupDetailView()
    }
    
    private func setTitle() {
        self.title = AppDelegate.appTitle
    }
    
    private func setupDetailView() {
        self.view.addSubview(userIdLabel)
        self.view.addSubview(idLabel)
        self.view.addSubview(titleLabel)
        self.view.addSubview(bodyLabel)

        NSLayoutConstraint.activate([
            userIdLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120),
            userIdLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 8.0),
            userIdLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -8.0),
            userIdLabel.bottomAnchor.constraint(equalTo: idLabel.topAnchor, constant: -16.0),
            userIdLabel.heightAnchor.constraint(equalToConstant: 18),
            
            idLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 8.0),
            idLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -8.0),
            idLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -16.0),
            idLabel.heightAnchor.constraint(equalToConstant: 18),
            
            titleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 8.0),
            titleLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -8.0),
            titleLabel.bottomAnchor.constraint(equalTo: bodyLabel.topAnchor, constant: -16.0),
            
            bodyLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 8.0),
            bodyLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -8.0),
            bodyLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.view.bottomAnchor, constant: -16.0)
        ])
        
        userIdLabel.text = viewModel?.getuserId()
        idLabel.text = viewModel?.getProductId()
        titleLabel.text = viewModel?.getProductTitle()
        bodyLabel.text = viewModel?.getProductBody()
    }
}
