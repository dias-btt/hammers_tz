//
//  FeedPresenter.swift
//  Hammers_TZ
//
//  Created by Диас Сайынов on 12.01.2024.
//

import UIKit

final class FeedPresenter: FeedPresenterProtocol {
    
    private var categories: [Category] = []
    private var bannerItems: [String] = []
    private var menuItems: [MenuItem] = []
    
    weak var view: FeedViewProtocol?
    var interactor: FeedInteractorProtocol?
    var router: FeedWireframeProtocol?

    init(view: FeedViewProtocol, interactor: FeedInteractorProtocol, router: FeedWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        
        bannerItems = interactor?.getBanners() ?? []
        categories = interactor?.getCategories() ?? []
        menuItems = interactor?.getMenu() ?? []
        
        view?.displayCityName("Москва")
        view?.categories = categories
        view?.currentCategory = categories[0].name
        view?.menuItems = getMenuItems()
        
        view?.reloadData()
    }
    
    func getBannerItems() -> [String]{
        return bannerItems
    }
    
    func getCategoryItems() -> [Category]{
        return categories
    }
    
    func didSelectCategory(_ category: String) {
        view?.currentCategory = category
    }
    
    func getMenuItems() -> [MenuItem] {
        return menuItems
    }

}
