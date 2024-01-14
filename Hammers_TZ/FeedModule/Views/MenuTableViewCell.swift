//
//  MenuTableViewCell.swift
//  Hammers_TZ
//
//  Created by Диас Сайынов on 12.01.2024.
//

import UIKit

class MenuItemTableViewCell: UITableViewCell {
    static let reuseIdentifier = "MenuItemCell"

    // UI components for the cell
    let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let priceView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 87, height: 32)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1).cgColor
        view.layer.cornerRadius = 6
        return view
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFUIDisplay-Regular", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        contentView.addSubview(itemImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceView)
        priceView.addSubview(priceLabel)

        NSLayoutConstraint.activate([
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            itemImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            itemImageView.widthAnchor.constraint(equalToConstant: 132),
            itemImageView.heightAnchor.constraint(equalToConstant: 132),

            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 32),

            descriptionLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 32),
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -8),
            descriptionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            priceView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            priceView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            priceView.widthAnchor.constraint(equalToConstant: 87),
            priceView.heightAnchor.constraint(equalToConstant: 32),
            
            priceLabel.centerXAnchor.constraint(equalTo: priceView.centerXAnchor),
            priceLabel.centerYAnchor.constraint(equalTo: priceView.centerYAnchor)
        ])
    }

    func configure(with menuItem: MenuItem) {
        itemImageView.image = UIImage(named: menuItem.image)
        nameLabel.text = menuItem.name
        descriptionLabel.text = menuItem.description
        priceLabel.text = "$\(menuItem.price)"
    }
}
