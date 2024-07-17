//
//  MainViewController.swift
//  WeatherAnimation
//
//  Created by Danil Antonov on 16.07.2024.
//

import UIKit

final class MainViewController: UIViewController {
    private let dataManager = DataManager()
    private var mainView: MainView { self.view as! MainView }
    private var weathersData: [WeatherItem] = []
    private var collectionViewDataSource: WeatherItemsCollectionViewDataSource?
    private var collectionViewDelegate: WeatherItemsCollectionViewDelegate?
    private var currentIndex: Int!
    
    override func loadView() {
        view = MainView()
        
        weathersData = dataManager.getWeathersData()
        currentIndex = Int.random(in: 0..<weathersData.count)
        
        collectionViewDataSource = WeatherItemsCollectionViewDataSource(collectionView: mainView.weatherItemsCollectionVIew, currentItem: currentIndex)
        collectionViewDelegate = WeatherItemsCollectionViewDelegate()
    
        mainView.weatherItemsCollectionVIew.dataSource = collectionViewDataSource
        mainView.weatherItemsCollectionVIew.delegate = collectionViewDelegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewDelegate?.didTapOnCell = { [self] index in
            guard let dataSource = self.collectionViewDataSource else {
                return
            }
            
            self.currentIndex = index
            self.collectionViewDataSource?.setCurrentItem(currentItem: self.currentIndex)
            
            self.mainView.imageWeatherIconView.tintColor = UIColor(hexString: dataSource.weatherItems[index].weatherIconColor)
            
            UIView.transition(with: self.mainView.imageBackground, duration: 1, options: [.transitionCrossDissolve], animations: {
                self.mainView.imageBackground.image = UIImage(named: dataSource.weatherItems[index].weatherBackgroundImageName)!
                    })
            UIView.transition(with: self.mainView.imageWeatherIconView, duration: 1, options: [.transitionCrossDissolve], animations: {
                self.mainView.imageWeatherIconView.image = UIImage(systemName: dataSource.weatherItems[index].weatherImageName)
                    })
        }
        collectionViewDataSource?.set(weatherItems: weathersData)
        collectionViewDelegate?.didTapOnCell!(currentIndex)
        
        let indexPath = IndexPath(item: currentIndex, section: 0)
        self.mainView.imageWeatherIconView.image = UIImage(systemName: weathersData[indexPath.item].weatherImageName)
        self.mainView.imageBackground.image = UIImage(named: weathersData[indexPath.item].weatherBackgroundImageName)!
        
        DispatchQueue.main.async { [self] in
            self.mainView.weatherItemsCollectionVIew.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
            UIView.animate(withDuration: 5, delay: 0, options: [.repeat, .autoreverse] , animations: {
                let nx = self.mainView.bounds.minX + 40
                let ny = self.mainView.bounds.minY + 40
                let nw = self.mainView.bounds.width - 40
                let nh = self.mainView.bounds.height - 40
                self.mainView.imageBackground.frame = CGRect(x: nx, y: ny, width: nw, height: nh);
                })
            UIView.animate(withDuration: 1.0, delay: 0.0, options: [.repeat, .autoreverse], animations: {
                self.mainView.imageWeatherIconView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                    })
        }
    }
}
