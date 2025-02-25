//
//  ClassifiedAdCell.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import UIKit

// MARK: - Custom TableViewCell

class ClassifiedAdCell: UITableViewCell {
    static let identifier = "ClassifiedAdCell"
    
    private let adImageView = UIImageView()
    private let titleLabel = UILabel()
    private let priceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        adImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(adImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            adImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            adImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            adImageView.widthAnchor.constraint(equalToConstant: 60),
            adImageView.heightAnchor.constraint(equalToConstant: 60),
            
            titleLabel.leadingAnchor.constraint(equalTo: adImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func configure(with ad: ClassifiedAd) {
        titleLabel.text = ad.title
        priceLabel.text = "\(ad.price) €"
        
        if let urlString = ad.imagesUrl.thumb, let url = URL(string: urlString) {
            adImageView.download(from: url, contentMode: .scaleAspectFit)
        }
    }
}
