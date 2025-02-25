//
//  HomeCell.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import UIKit

// MARK: - Custom TableViewCell

class HomeCell: UITableViewCell {
    static let identifier = "HomeCell"
    
    private lazy var adImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private lazy var urgentImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .black
        label.lineBreakMode = .byTruncatingTail
        
        return label
    }()
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textColor = .gray
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(adImageView)
        contentView.addSubview(urgentImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            adImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            adImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            adImageView.widthAnchor.constraint(equalToConstant: 60),
            adImageView.heightAnchor.constraint(equalToConstant: 60),
            
            urgentImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            urgentImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            urgentImageView.widthAnchor.constraint(equalToConstant: 56),
            urgentImageView.heightAnchor.constraint(equalToConstant: 56),
            
            titleLabel.leadingAnchor.constraint(equalTo: adImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            categoryLabel.leadingAnchor.constraint(equalTo: adImageView.trailingAnchor, constant: 10),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            categoryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 5),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func configure(with ad: ClassifiedAdDto) {
        titleLabel.text = ad.title
        categoryLabel.text = ad.category
        priceLabel.text = "\(ad.price) €"
        
        urgentImageView.image = ad.isUrgent ? UIImage(named: "urgent") : nil
        
        if let urlString = ad.imagesUrl.thumb, let url = URL(string: urlString) {
            adImageView.download(from: url, contentMode: .scaleAspectFit)
        }
    }
}
