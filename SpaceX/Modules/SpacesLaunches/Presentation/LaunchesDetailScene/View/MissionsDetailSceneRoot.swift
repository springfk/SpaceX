
//
//  missionsDetailScene.swift
//  SpaceX
//
//  Created by Bahar on 2024-07-26.
//  Copyright © 2024 SpaceX. All rights reserved.
//
import UIKit
import Foundation


class MissionsDetailSceneRoot: ViewController.Base.Root {
    
    var viewModel: MissionsDetailSceneViewModelProtocol!
    var wikipediaURL: URL?
    var imageUrls: [URL] = []
    
    //MARK: - init
    init(viewModel: MissionsDetailSceneViewModelProtocol!) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        debugPrint("Page Got Deinited")
    }
    
    // MARK: - UI Components
    
    lazy var imageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.layer.shadowColor = UIColor.black.cgColor
        collectionView.layer.shadowOpacity = 0.5
        collectionView.layer.shadowOffset = CGSize(width: 10, height: 10)
        collectionView.layer.shadowRadius = 5
        collectionView.layer.masksToBounds = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    lazy var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.currentPage = 0
        control.currentPageIndicatorTintColor = Colors.actionColor
        control.pageIndicatorTintColor = Colors.pageControllerColor
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    lazy var missionNameLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.robotoBlack(size: 20).font
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.robotoLight(size: 18).font
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.robotoLight(size: 15).font
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textAlignment = .justified
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var wikipediaButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Wikipedia", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "link"), for: .normal)
        button.tintColor = .blue
        button.semanticContentAttribute = .forceLeftToRight
        return button
    }()
    
    lazy var bookmarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .gray
        button.addTarget(self, action: #selector(setBookMark), for: .touchUpInside)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [missionNameLabel, dateLabel, descriptionLabel, wikipediaButton])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        setupUI()
        updateContent(with: viewModel.messionInfo)
        
    }
}
