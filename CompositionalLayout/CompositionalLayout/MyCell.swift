//
//  Cell.swift
//  CompositionalLayout
//
//  Created by Eugene Berezin on 7/24/20.
//  Copyright © 2020 Eugene Berezin. All rights reserved.
//

import UIKit

class MyCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    let textfiled = UITextField()
    let inputtext: UITextView = {
        let input = UITextView()
        input.text = """
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                    heightDimension: .fractionalHeight(1.0))
               let item = NSCollectionLayoutItem(layoutSize: itemSize)

               let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                     heightDimension: .absolute(44))
               let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
               let spacing = CGFloat(10)
               group.interItemSpacing = .fixed(spacing)

               let section = NSCollectionLayoutSection(group: group)
               section.interGroupSpacing = spacing
               section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)

               let layout = UICollectionViewCompositionalLayout(section: section)
               return layout
"""
        return input
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.image = UIImage(systemName: "flag")
        textfiled.placeholder = "Test"
        addSubview(imageView)
        addSubview(textfiled)
        addSubview(inputtext)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            textfiled.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            textfiled.trailingAnchor.constraint(equalTo: trailingAnchor),
            textfiled.leadingAnchor.constraint(equalTo: leadingAnchor),
            inputtext.topAnchor.constraint(equalTo: textfiled.bottomAnchor),
            inputtext.trailingAnchor.constraint(equalTo: trailingAnchor),
            inputtext.leadingAnchor.constraint(equalTo: leadingAnchor),
            inputtext.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
