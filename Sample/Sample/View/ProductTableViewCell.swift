//
//  ProductTableViewCell.swift
//  Sample
//
//  Created by Balaji K S on 01/05/24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    var userIdLabel: UILabel = {
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func resetView() {
        userIdLabel.text = ""
        titleLabel.text = ""
    }
    
    private func setUpContentView() {
        preservesSuperviewLayoutMargins = true
        contentView.addSubview(userIdLabel)
        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            userIdLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0),
            userIdLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8.0),
            userIdLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8.0),
            
            titleLabel.topAnchor.constraint(equalTo: userIdLabel.bottomAnchor, constant: 4.0),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8.0),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8.0),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8.0),
        ])
    }

}
