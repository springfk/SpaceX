
//
//  missionsListScene.swift
//  SpaceX
//
//  Created by Bahar on 2024-07-26.
//  Copyright © 2024 SpaceX. All rights reserved.
//
import UIKit
import Foundation

extension MissionsListSceneRoot {
    // Additional methods for the Root View
    
    
//MARK: - UI Setup
    
    func addTableView() {
        view.addSubview(tableView)
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),

        ])
        
        loadMockData()
    }
    
    func setupPageNavigation() {
        self.pageTitle = "SpaceX missions"
    }
    func setupUI() {
        setupPageNavigation()
        addTableView()
    }
}
