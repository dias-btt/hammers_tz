//
//  FeedProtocols.swift
//  Hammers_TZ
//
//  Created by Диас Сайынов on 12.01.2024.
//

import Foundation

public protocol FeedWireframeProtocol: AnyObject {
}

protocol FeedViewProtocol: AnyObject {
    var presenter: FeedPresenterProtocol? { get set }
    var currentCategory: String { get set }
    var menuItems: [MenuItem] {get set}
    var categories: [Category] {get set}
    func displayCityName(_ cityName: String)
    func reloadData()
}

protocol FeedInteractorProtocol: AnyObject {
    var presenter: FeedPresenterProtocol? { get set }
    func getBanners() -> [String]
    func getCategories() -> [Category]
    func getMenu() -> [MenuItem]
}
protocol FeedPresenterProtocol: AnyObject {
    func viewDidLoad()
    func getBannerItems() -> [String]
    func getMenuItems() -> [MenuItem]
    func getCategoryItems() -> [Category]
    func didSelectCategory(_ category: String)
}
