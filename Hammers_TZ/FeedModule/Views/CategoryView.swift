//
//  CategoryView.swift
//  Hammers_TZ
//
//  Created by Диас Сайынов on 13.01.2024.
//

import UIKit

protocol CategoryViewDelegate: AnyObject {
    func didSelectCategory(_ category: String)
}

class CategoryView: UIView {

    weak var delegate: CategoryViewDelegate?
    
    let scrollButtonsView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

    let categoryButtonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()

    var selectedCategoryButton: UIButton?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        addSubview(scrollButtonsView)

        NSLayoutConstraint.activate([
            scrollButtonsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            scrollButtonsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollButtonsView.topAnchor.constraint(equalTo: topAnchor),
            scrollButtonsView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollButtonsView.heightAnchor.constraint(equalToConstant: 40)
        ])

        scrollButtonsView.addSubview(categoryButtonsStackView)

        NSLayoutConstraint.activate([
            categoryButtonsStackView.leadingAnchor.constraint(equalTo: scrollButtonsView.leadingAnchor, constant: 8),
            categoryButtonsStackView.trailingAnchor.constraint(equalTo: scrollButtonsView.trailingAnchor),
            categoryButtonsStackView.topAnchor.constraint(equalTo: scrollButtonsView.topAnchor),
            categoryButtonsStackView.bottomAnchor.constraint(equalTo: scrollButtonsView.bottomAnchor)
        ])
    }

    func addCategoryButtons(categories: [Category]) {

        for category in categories {
            let button = UIButton(type: .custom)
            button.setTitle(category.name, for: .normal)
            button.addTarget(self, action: #selector(categoryButtonTapped(_:)), for: .touchUpInside)
            button.layer.cornerRadius = 16
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4).cgColor
            button.setTitleColor(UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4), for: .normal)

            button.setTitleColor(UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1.0), for: .selected)
            button.layer.borderColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1.0).cgColor
            button.titleLabel?.font = .systemFont(ofSize: 13)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.text = category.name
            
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: 88),
                button.heightAnchor.constraint(equalToConstant: 32)
            ])

            categoryButtonsStackView.addArrangedSubview(button)
        }
    }

    @objc private func categoryButtonTapped(_ sender: UIButton) {
        selectedCategoryButton?.isSelected = false
        selectedCategoryButton?.backgroundColor = .clear
        selectedCategoryButton?.setTitleColor(UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4), for: .normal)
        selectedCategoryButton?.layer.borderWidth = 1

        sender.isSelected.toggle()
        if sender.isSelected {
            sender.backgroundColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.2)
            sender.setTitleColor(UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1.0), for: .normal)
            sender.layer.borderWidth = 0
            sender.titleLabel?.font = .boldSystemFont(ofSize: 13)
            selectedCategoryButton = sender
        } else {
            sender.backgroundColor = .clear
            sender.setTitleColor(UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4), for: .normal)
            sender.layer.borderWidth = 1
            selectedCategoryButton = nil
        }
        
        let category = sender.currentTitle ?? ""
        delegate?.didSelectCategory(category)
    }
}
