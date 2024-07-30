
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
    }
    
    func updateContent(with mission: LaunchesUIModel) {
        
        missionNameLabel.text = mission.name
        dateLabel.text = "Date: \(convertUnixToDate(TimeInterval(mission.dateUnix)))"
        descriptionLabel.text = mission.details ?? "No details available"
        
        if let wikipediaURL = mission.wikipediaURL {
            self.wikipediaURL = URL(string: mission.wikipediaURL ?? "")
            wikipediaButton.isHidden = false
            wikipediaButton.addTarget(self, action: #selector(openWikipedia), for: .touchUpInside)
        } else {
            wikipediaButton.isHidden = true
        }
        
        setupImages(urls: mission.imageURLs ?? [])
        
        pageControl.numberOfPages = mission.imageURLs?.count ?? 0
        pageControl.currentPage = 0
    }
    
    private func setupImages(urls: [URL]) {
        self.imageUrls = urls
        pageControl.isHidden = urls.count <= 1
        imageCollectionView.isScrollEnabled = urls.count > 1
        imageCollectionView.reloadData()
    }
    
    // MARK: - Actions
    
    @objc private func openWikipedia() {
        guard let url = wikipediaURL else { return }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: { success in
                if !success {
                    print("Failed to open Wikipedia Address: \(url)")
                }
            })
        } else {
            let success = UIApplication.shared.openURL(url)
            if !success {
                print("Failed to open Wikipedia Address: \(url)")
            }
        }
    }
    
    @objc func setBookMark() {
        //handle saving in hashMAp
    }
}
