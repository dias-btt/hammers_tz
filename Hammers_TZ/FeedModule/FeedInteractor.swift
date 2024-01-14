//
//  FeedInteractor.swift
//  Hammers_TZ
//
//  Created by Диас Сайынов on 12.01.2024.
//

import Foundation

final class FeedInteractor {
    weak var presenter: FeedPresenterProtocol?

    init(presenter: FeedPresenterProtocol? = nil) {
        self.presenter = presenter
    }
}

extension FeedInteractor: FeedInteractorProtocol{
    // создал кастомный json файл
    func getBanners() -> [String]{
        return ["banner1", "banner1","banner1","banner1","banner1"]
    }
    
    func getCategories() -> [Category] {
            guard let url = Bundle.main.url(forResource: "Menu", withExtension: "json")
            else {
                return []
            }

            do {
                let data = try Data(contentsOf: url)
                let menuData = try JSONDecoder().decode(MenuData.self, from: data)
                return menuData.categories
            } catch {
                print("Error decoding categories: \(error)")
                return []
            }
        }
    
    func getMenu() -> [MenuItem] {
        guard let url = Bundle.main.url(forResource: "Menu", withExtension: "json")
        else {
            return []
        }

        do {
            let data = try Data(contentsOf: url)
            let menuData = try JSONDecoder().decode(MenuData.self, from: data)
            return menuData.categories.flatMap { $0.items }
        } catch {
            print("Error decoding menu items: \(error)")
            return []
        }
    }
}
