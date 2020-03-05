//
//  UICollectionViewFlowLayout+config.swift
//  OpenWeatherApp
//
//  Created by niv ben-porath on 04/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

struct UIConfig {
    static func createFlowLayout(in view : UIView,numberOfColums : Int) -> UICollectionViewFlowLayout {
        
        let width = view.bounds.width
        let padding : CGFloat = UICollectionView.collectionViewPadding
        let minItemSpacing :CGFloat = UICollectionView.collectionViewMinItemSpacing
        
        let availableWidth = width - (padding * 2) - (minItemSpacing * 2)
        let itemWidth = availableWidth/CGFloat(numberOfColums)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + UICollectionView.collectionViewAdditionalItemHeight)
        
        return flowLayout
    }
}
