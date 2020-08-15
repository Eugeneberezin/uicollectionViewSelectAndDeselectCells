//
//  ViewController.swift
//  CompositionalLayout
//
//  Created by Eugene Berezin on 7/24/20.
//  Copyright © 2020 Eugene Berezin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dataSource: UICollectionViewDiffableDataSource<Int, Int>! = nil
    var collectionView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "List"
        configureHierarchy()
        configureDataSource()
        collectionView.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
    }
    
    private func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds , collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.register(DemoCell.self, forCellWithReuseIdentifier: DemoCell.reuseIdentifier)
        view.addSubview(collectionView)
    }
    
    // HelloWorld Compositional Layout
    var itemSize: NSCollectionLayoutSize!
    var item: NSCollectionLayoutItem!
    private func createLayout() -> UICollectionViewLayout {
        
        itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                          heightDimension: .fractionalWidth(0.45))
        item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets.top = 30
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(400),
                                               heightDimension: .estimated(400))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        
        return layout
    }
    
    
    
    private func configureDataSource() {
        
        // Create Diffable Data Source and connect to Collection View
        dataSource = UICollectionViewDiffableDataSource<Int, Int>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
            
            // A constructor that passes the collection view as input, and returns a cell as output
            
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: DemoCell.reuseIdentifier,
                for: indexPath) as? DemoCell else { fatalError("Cannot create new cell") }
            
            
            cell.backgroundColor = .cyan
            return cell
        }
        
        // initial data
        let itemsPerSection = 1
        let sections = Array(0...2)
        var snapshot = NSDiffableDataSourceSnapshot<Int, Int>()
        var itemOffset = 0
        sections.forEach {
            snapshot.appendSections([$0])
            snapshot.appendItems(Array(itemOffset..<itemOffset + itemsPerSection))
            itemOffset += itemsPerSection
        }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? DemoCell {
            cell.select()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? DemoCell {
            cell.deselect()
            
        }
    }
    
}


