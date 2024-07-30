
//
//  missionsListScene.swift
//  SpaceX
//
//  Created by Bahar on 2024-07-26.
//  Copyright © 2024 SpaceX. All rights reserved.
//
import UIKit
import Foundation


class MissionsListSceneRoot: ViewController.Base.Root {
    
    var viewModel: MissionsListSceneViewModelProtocol
   
    //MARK: - init
    init(viewModel: MissionsListSceneViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        table.sectionHeaderHeight = 0
        table.sectionFooterHeight = 0
        table.alwaysBounceVertical = false
        table.showsVerticalScrollIndicator = false
        if #available(iOS 15.0, *) {
            table.sectionHeaderTopPadding = 0
        }
        table.register(MissionsListSceneCell.self, forCellReuseIdentifier: "missionsListSceneCell")
        table.separatorStyle = .none
        table.layer.cornerRadius = 8
        table.clipsToBounds = true
        
        return table
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadInitialItems {[weak self] didLoad, error in
            if let error = error {
                self?.presentAlert(for: error)
                return
            }
            self?.tableView.reloadData()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    deinit {
        debugPrint("Page Got Deinited")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        tableView.backgroundColor = Colors.backgroundColor
        setupUI()
    }
    
    
}
