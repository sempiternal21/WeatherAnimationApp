//
//  WeatherItemsCollectionViewDataSource.swift
//  WeatherAnimation
//
//  Created by Danil Antonov on 16.07.2024.
//

import UIKit

class WeatherItemsCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    private let collectionView: UICollectionView
    private var currentItem: Int
    
    private(set) var weatherItems: [WeatherItem] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    init(collectionView: UICollectionView, weatherItems: [WeatherItem] = [], currentItem: Int) {
        self.collectionView = collectionView
        self.weatherItems = weatherItems
        self.currentItem = currentItem
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherItemCellView", for: indexPath) as! WeatherItemCellView
        if indexPath.item == currentItem {
            UIView.transition(with: cell, duration: 0.5, options: [.transitionCrossDissolve], animations: {
                cell.backgroundColor = Colors.selectedItemColor
                    }, completion: nil)
        } else {
            UIView.transition(with: cell, duration: 0.5, options: [.transitionCrossDissolve], animations: {
                cell.backgroundColor = .clear
                    }, completion: nil)
            
        }
        let weatherItem = weatherItems[indexPath.item]
        cell.configure(weatherItem)
        
        return cell
    }
    
    func set(weatherItems: [WeatherItem]) {
        self.weatherItems = weatherItems
    }
    
    func setCurrentItem(currentItem: Int) {
        self.currentItem = currentItem
    }
}
