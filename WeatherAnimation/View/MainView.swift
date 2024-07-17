//
//  MainView.swift
//  WeatherAnimation
//
//  Created by Danil Antonov on 16.07.2024.
//

import UIKit

class MainView: UIView {
    let weatherItemsCollectionVIew: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .zero
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let layoutWidth = (UIScreen.main.bounds.width - 10) / 3.5
        layout.itemSize = CGSize(width: layoutWidth, height: layoutWidth)
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(WeatherItemCellView.self, forCellWithReuseIdentifier: "WeatherItemCellView")
        let adjustForTabbarInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.contentInset = adjustForTabbarInsets
        collectionView.scrollIndicatorInsets = adjustForTabbarInsets
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        collectionView.layer.borderWidth = 1.0
        collectionView.layer.borderColor = UIColor.black.cgColor

        return collectionView
    }()
    
    let imageWeatherIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let imageBackground: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .systemBackground
        addSubview(imageBackground)
        addSubview(imageWeatherIconView)
        addSubview(weatherItemsCollectionVIew)
        
        NSLayoutConstraint.activate([
            imageBackground.topAnchor.constraint(equalTo: topAnchor),
            imageBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageWeatherIconView.topAnchor.constraint(equalTo: weatherItemsCollectionVIew.bottomAnchor),
            imageWeatherIconView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageWeatherIconView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageWeatherIconView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            weatherItemsCollectionVIew.leadingAnchor.constraint(equalTo: leadingAnchor),
            weatherItemsCollectionVIew.trailingAnchor.constraint(equalTo: trailingAnchor),
            weatherItemsCollectionVIew.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            weatherItemsCollectionVIew.heightAnchor.constraint(equalToConstant: 130),
        ])
    }
}
