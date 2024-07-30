//
//  MessionListScene + Cell.swift
//  SpaceX
//
//  Created by Bahar on 5/5/1403 AP.
//

import Foundation
import UIKit


class MissionsListSceneCell : UITableViewCell {
    var indexPath: IndexPath?
    
    var viewModel: MissionListItemViewModel?
    
    deinit {
        viewModel = nil
    }
    
    lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var backView: RoundRectView = {
        let view = RoundRectView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.cornerRadius = 8
        view.backgroundColor = Colors.surfaceColor
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.heightAnchor.constraint(equalToConstant: 80).isActive = true
        image.widthAnchor.constraint(equalToConstant: 80).isActive = true
        image.layer.cornerRadius = 40
        return image
    }()
    
    
    lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.textColor
        label.font = Fonts.robotoBold(size: 18).font
        label.textAlignment = .left
        return label
    }()
    
    
    lazy var flightNumberLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.textColor
        label.font = Fonts.robotoBold(size: 18).font
        label.textAlignment = .left
        return label
    }()
    
    
    lazy var successLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.textColor
        label.font = Fonts.robotoLight(size: 15).font
        label.textAlignment = .left
        return label
    }()
    
    
    lazy var dateLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.textColor
        label.font = Fonts.robotoLight(size: 15).font
        label.textAlignment = .left
        return label
    }()
    
    
    lazy var detailsLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.textColor
        label.font = Fonts.robotoLightItalic(size: 15).font
        label.textAlignment = .left
        return label
    }()
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(flightNumberLabel)
        stackView.addArrangedSubview(successLabel)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(detailsLabel)
        
         backView.addSubview(iconImageView)
         backView.addSubview(stackView)
         contentView.addSubview(backView)
        
        NSLayoutConstraint.activate([
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            iconImageView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10),
//            iconImageView.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            iconImageView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
        
            
            stackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = UIImage(resource: ImageResource.placeholder)
        nameLabel.text = ""
        successLabel.text = ""
        flightNumberLabel.text = ""
        detailsLabel.text = ""
        dateLabel.text = ""
    }
    
    func bind(viewModel vm: MissionListItemViewModel) {
        viewModel = nil
        viewModel = vm
        nameLabel.text = vm.name
        successLabel.text = vm.sucessStatus
        detailsLabel.text = vm.details
        dateLabel.text = vm.date
        flightNumberLabel.text = vm.flightNumber
        viewModel?.getIconImage(completion: {[weak self] image in
            self?.iconImageView.image = image ?? UIImage(resource: ImageResource.placeholder)
        })
    }
    
}
