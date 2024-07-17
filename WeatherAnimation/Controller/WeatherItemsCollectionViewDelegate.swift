//
//  WeatherItemsCollectionViewDelegate.swift
//  WeatherAnimation
//
//  Created by Danil Antonov on 16.07.2024.
//

import UIKit

class WeatherItemsCollectionViewDelegate: NSObject, UICollectionViewDelegate {
    var didTapOnCell: ((Int) -> Void)?
    var didDeselectTapOnCell: ((Int) -> Void)?
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else {
            return
        }
        UIView.transition(with: cell, duration: 0.5, options: [.transitionCrossDissolve], animations: {
            cell.backgroundColor = Colors.selectedItemColor
                }, completion: nil)
        
        didTapOnCell?(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else {
            return
        }
        UIView.transition(with: cell, duration: 0.5, options: [.transitionCrossDissolve], animations: {
            cell.backgroundColor = .clear
                }, completion: nil)
        
    }
}
