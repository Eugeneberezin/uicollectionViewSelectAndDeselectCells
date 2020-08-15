//
//  DemoCell.swift
//  CompositionalLayout
//
//  Created by Eugene Berezin on 8/15/20.
//  Copyright © 2020 Eugene Berezin. All rights reserved.
//

import UIKit

class DemoCell: UICollectionViewCell {
    static let reuseIdentifier = "list-cell-reuse-identifier"
    let selectedImage = "pin.circle.fill"
    let deselected = "pin.circle"
    let imageView = UIImageView()
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Not Selected"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureGradientLayer()
        configure()
        
    }
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    let gradientLayer = CAGradientLayer()
    
    var topColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
    var bottomColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
    func configureGradientLayer() {
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0, 1]
        contentView.layer.addSublayer(gradientLayer)
        gradientLayer.frame = contentView.bounds
    }
    
    func select() {
        topColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        bottomColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        imageView.image = UIImage(systemName: selectedImage)
        imageView.tintColor = #colorLiteral(red: 1, green: 0.8901485289, blue: 0, alpha: 1)
        label.text = "Selected!"
    }
    
    func deselect() {
        topColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        bottomColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0, 1]
        imageView.image = UIImage(systemName: deselected)
        imageView.tintColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        label.text = "Deselected!"
    }
    
    func configure() {
        imageView.image = UIImage(systemName: deselected)
        imageView.tintColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 20
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
        
    }
}

