
//
//  missionsDetailScene.swift
//  SpaceX
//
//  Created by Bahar on 2024-07-26.
//  Copyright © 2024 SpaceX. All rights reserved.
//
import UIKit
import Foundation

extension MissionsDetailSceneRoot: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as! ImageCollectionViewCell
        let url = imageUrls[indexPath.item]
        cell.configure(with: url)
        return cell
    }
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          let width = collectionView.frame.width - 10
          let height = collectionView.frame.height
          return CGSize(width: width, height: height)
      }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}

