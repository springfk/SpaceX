//
//  MissionsDetailImageCollectionView + cell.swift
//  SpaceX
//
//  Created by Bahar on 5/7/1403 AP.
//

import Foundation
import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    static let identifier = "ImageCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = UIImage(resource: ImageResource.placeholder)
    }
    
    func configure(viewModel: MissionDetailImageViewModelProtocol,
                   atIndex index: Int ) {
        viewModel.loadImage(atIndex: index) {[weak self] image in
            self?.imageView.image = image ?? UIImage(resource: ImageResource.placeholder)
        }
    }
}
