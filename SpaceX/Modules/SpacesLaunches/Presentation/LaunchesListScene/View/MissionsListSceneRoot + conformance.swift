
//
//  missionsListScene.swift
//  SpaceX
//
//  Created by Bahar on 2024-07-26.
//  Copyright © 2024 SpaceX. All rights reserved.
//
import UIKit
import Foundation

extension MissionsListSceneRoot: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        launches.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "missionsListSceneCell", for: indexPath) as! MissionsListSceneCell
         let launch = launches[indexPath.row]
        print(launch)
        cell.updateContent(indexPath: indexPath, mession: launch)
        cell.backgroundColor = Colors.backgroundColor
        cell.selectionStyle = .none
        let margin = cell.layoutMargins.left
        cell.separatorInset = .init(top: 0, left: margin + 64, bottom: 0, right: 0)
         return cell
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let navigationcontroller = self.navigationController else { return }
        let coordinator = MissionsDetailSceneCoordinator(navigationController: navigationcontroller)
        print("\(launches[indexPath.row])")
        coordinator.start(with: launches[indexPath.row])
    }
    
    
  
    
}
