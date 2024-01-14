//
//  FeedViewController.swift
//  Hammers_TZ
//
//  Created by Диас Сайынов on 12.01.2024.
//

import UIKit

class FeedViewController: UIViewController, FeedViewProtocol, CategoryViewDelegate {
    var presenter: FeedPresenterProtocol?
    var selectedCategoryButton: UIButton?
    
    var categories: [Category] = []
    var currentCategory: String = ""
    var menuItems: [MenuItem] = []
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bannerView: BannerView = {
        let view = BannerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let categoryView: CategoryView = {
        let view = CategoryView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.953, green: 0.961, blue: 0.976, alpha: 1)

        presenter?.viewDidLoad()
        setupViews()
        setupConstraints()
        categoryView.delegate = self
        currentCategory = categories[0].name
    }
    
    func reloadData(){
        let imageNames = presenter?.getBannerItems()
        bannerView.addImagesToStackView(imageNames: imageNames ?? [])
        
        let categoryNames = presenter?.getCategoryItems()
        categoryView.addCategoryButtons(categories: categoryNames ?? [])
    }
    
    func setupViews(){
        view.addSubview(cityLabel)
        view.addSubview(bannerView)
        view.addSubview(categoryView)
        setupTableView()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cityLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            
        ])
        
        NSLayoutConstraint.activate([
            bannerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bannerView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            categoryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryView.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 16),
        ])
    }

    func displayCityName(_ cityName: String) {
        cityLabel.text = cityName
    }
    
    func setupTableView() {
        view.addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(MenuItemTableViewCell.self, forCellReuseIdentifier: MenuItemTableViewCell.reuseIdentifier)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: categoryView.bottomAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
        ])
    }
    
    func didSelectCategory(_ category: String) {
        currentCategory = category
        tableView.reloadData()
        if let selectedCategory = categories.first(where: { $0.name == currentCategory }) {
            if let firstItemIndex = menuItems.firstIndex(where: { $0.name == selectedCategory.items[0].name}) {
                let indexPath = IndexPath(row: firstItemIndex, section: 0)
                tableView.scrollToRow(at: indexPath, at: .top, animated: true)
            }
        }
    }

}

extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuItemTableViewCell.reuseIdentifier, for: indexPath) as! MenuItemTableViewCell

        let menuItem = menuItems[indexPath.row]
        cell.configure(with: menuItem)
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
