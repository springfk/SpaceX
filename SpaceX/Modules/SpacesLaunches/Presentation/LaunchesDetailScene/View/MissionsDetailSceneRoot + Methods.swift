
//
//  missionsDetailScene.swift
//  SpaceX
//
//  Created by Bahar on 2024-07-26.
//  Copyright © 2024 SpaceX. All rights reserved.
//
import UIKit
import Foundation

extension MissionsDetailSceneRoot {
    
    //MARK: - UI Setup
    func addUIElementToDetailView() {
        
        view.addSubview(imageCollectionView)
        view.addSubview(pageControl)
        view.addSubview(stackView)
        view.addSubview(bookmarkButton)

        NSLayoutConstraint.activate([
            imageCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            imageCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            imageCollectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3),
            
            pageControl.topAnchor.constraint(equalTo: imageCollectionView.bottomAnchor, constant: 15),
            pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            bookmarkButton.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 16),
            bookmarkButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
    }
    
    
    func setupPageNavigation() {
        self.pageTitle = "Mession's Detail"
    }
    
    func setupUI() {
        setupPageNavigation()
        addUIElementToDetailView()
        wikipediaButton.addTarget(self,
                                  action: #selector(openWikipedia),
                                  for: .touchUpInside)
    }
    
    func updateContent() {
        
        missionNameLabel.text = viewModel.name
        dateLabel.text = viewModel.date
        descriptionLabel.text = viewModel.description ?? "No details available"
        wikipediaButton.isHidden = !viewModel.hasWikipedia
       
        
        setupImages()
        
        pageControl.numberOfPages = viewModel.imagesCount
        pageControl.currentPage = 0
    }
    
    private func setupImages() {
        let count = viewModel.imagesCount
        pageControl.isHidden = count <= 1
        imageCollectionView.isScrollEnabled = count > 1
        imageCollectionView.reloadData()
    }
    
    // MARK: - Actions
    
    @objc private func openWikipedia() {
    
        viewModel.openWikipedia()
    }
    
    @objc func setBookMark() {
        //handle saving in hashMAp
        var isBookmarked = viewModel.isBookmarked
        isBookmarked.toggle()
        viewModel.bookmark(isBookmarked)
//        updateBoookmarkButton()
    }
}

