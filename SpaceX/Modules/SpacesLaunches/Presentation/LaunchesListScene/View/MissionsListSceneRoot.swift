
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
    
    // Root View implementation
    var viewModel: MissionsListSceneViewModelProtocol!
    var launches: [LaunchesUIModel] = []

    
    func loadMockData() {
        let mockJson: [[String: Any]] = [
            [
                "name": "SARah 1",
                "links": [
                    "patch": [
                        "small": "https://images2.imgbox.com/c4/49/D1B0f2cg_o.png"
                    ]
                ],
                "date_unix": 1655561940,
                "details": "Axiom Mission 1 (or Ax-1) is a planned SpaceX Crew Dragon mission to the International Space Station (ISS), operated by SpaceX on behalf of Axiom Space. The flight will launch no earlier than 31 March 2022 and send four people to the ISS for an eight-day stay",
                "flight_number": 168,
                "success": true,
                "wikipedia": "https://en.wikipedia.org/wiki/Starlink",
                "flickr": [
                    "original": [
                        "https://live.staticflickr.com/65535/51947052831_3b1599cd70_o.jpg",
                        "https://live.staticflickr.com/65535/51946071252_b51d6839e9_o.jpg"
                    ],
                ],
            ],
            [
                "name": "Starlink 4-19 (v1.5)",
                "links": [
                    "patch": [
                        "small": "https://images2.imgbox.com/ea/40/slQKbK6Y_o.png"
                    ]
                ],
                "date_unix": 1654103330,
                "details": NSNull(),
                "flight_number": 167,
                "success": true,
                "wikipedia": NSNull(),
                "flickr": [
                    "original": [
                        "https://live.staticflickr.com/65535/51947052831_3b1599cd70_o.jpg",
                        "https://live.staticflickr.com/65535/51946071252_b51d6839e9_o.jpg"
                    ],
                ],
            ],
            [
                "name": "Nilesat-301",
                "links": [
                    "patch": [
                        "small": "https://images2.imgbox.com/6d/f7/ZJKXRNzL_o.png"
                    ]
                ],
                "date_unix": 1654722240,
                "details": NSNull(),
                "flight_number": 166,
                "success": true,
                "wikipedia": "https://en.wikipedia.org/wiki/Starlink",
                "flickr": [
                    "original": [
                        "https://live.staticflickr.com/65535/51947052831_3b1599cd70_o.jpg",
                        "https://live.staticflickr.com/65535/51946071252_b51d6839e9_o.jpg"
                    ],
                ],
            ],
            [
                "name": "Transporter-5",
                "links": [
                    "patch": [
                        "small": "https://images2.imgbox.com/fc/73/QpGKqpvV_o.png"
                    ]
                ],
                "date_unix": 1653503220,
                "details": NSNull(),
                "flight_number": 165,
                "success": true,
                "wikipedia": "https://en.wikipedia.org/wiki/Starlink",
                "flickr": [
                    "original": [
                        "https://live.staticflickr.com/65535/51947052831_3b1599cd70_o.jpg",
                        "https://live.staticflickr.com/65535/51946071252_b51d6839e9_o.jpg"
                    ],
                ],
            ],
            [
                "name": "Starlink 4-18 (v1.5)",
                "links": [
                    "patch": [
                        "small": "https://images2.imgbox.com/b8/49/OVeV3xJg_o.png"
                    ]
                ],
                "date_unix": 1652870400,
                "details": NSNull(),
                "flight_number": 164,
                "success": true,
                "wikipedia": "https://en.wikipedia.org/wiki/Starlink",
                "flickr": [
                    "original": [
                        "https://live.staticflickr.com/65535/51947052831_3b1599cd70_o.jpg",
                        "https://live.staticflickr.com/65535/51946071252_b51d6839e9_o.jpg"
                    ],
                ],
            ],
            [
                "name": "Starlink 4-15 (v1.5)",
                "links": [
                    "patch": [
                        "small": "https://images2.imgbox.com/45/9f/Na8zs6V4_o.png"
                    ]
                ],
                "date_unix": 1652560800,
                "details": NSNull(),
                "flight_number": 163,
                "success": true,
                "wikipedia": NSNull(),
                "flickr": [
                    "original": [
                        "https://live.staticflickr.com/65535/51947052831_3b1599cd70_o.jpg",
                        "https://live.staticflickr.com/65535/51946071252_b51d6839e9_o.jpg"
                    ]
                ],
            ]
        ]
        
        for json in mockJson {
            if let name = json["name"] as? String,
               let dateUnix = json["date_unix"] as? Int,
               let flightNumber = json["flight_number"] as? Int,
               let success = json["success"] as? Bool,
               let links = json["links"] as? [String: Any],
               let patch = links["patch"] as? [String: Any],
               let small = patch["small"] as? String {
                let details = json["details"] as? String
                let iconURL = URL(string: small)
                let wikipedia = json["wikipedia"] as? String
                let flickr = json["flickr"] as? [String: Any]
                let original = flickr?["original"] as? [String]
                let imageURLs = original?.compactMap(URL.init) ?? []
                
                let launch = LaunchesUIModel(name: name, iconURL: iconURL, dateUnix: dateUnix, details: details, flightNumber: flightNumber, success: success, wikipediaURL: wikipedia, imageURLs: imageURLs)
                launches.append(launch)
            }
        }
        tableView.reloadData()
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
