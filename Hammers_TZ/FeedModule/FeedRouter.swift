//
//  FeedRouter.swift
//  Hammers_TZ
//
//  Created by Диас Сайынов on 12.01.2024.
//

import UIKit

public class FeedRouter: FeedWireframeProtocol {
    weak var viewController: UIViewController?

    public static func createModule() -> UIViewController {
        let view = FeedViewController()
        let interactor = FeedInteractor()
        let router = FeedRouter()
        let presenter = FeedPresenter(
            view: view,
            interactor: interactor,
            router: router
        )

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
