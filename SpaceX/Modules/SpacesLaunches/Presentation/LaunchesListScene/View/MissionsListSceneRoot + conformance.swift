
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
        viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "missionsListSceneCell", for: indexPath) as! MissionsListSceneCell
        let launchVM = viewModel.items[indexPath.row]
        cell.bind(viewModel: launchVM)
        cell.backgroundColor = Colors.backgroundColor
        cell.selectionStyle = .none
        let margin = cell.layoutMargins.left
        cell.separatorInset = .init(top: 0, left: margin + 64, bottom: 0, right: 0)
         return cell
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectItem(atIndex: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard indexPath.row + 1 == viewModel.items.count else {
            return
        }
        viewModel.loadMoreItemIfNeeded {[weak tableView, weak self] _ , error in
            guard error == nil else {
                self?.presentAlert(for:error!)
                return
            }
            tableView?.reloadSections(IndexSet(integer: indexPath.section),
                                      with: .automatic)
        }
    }
    
}
