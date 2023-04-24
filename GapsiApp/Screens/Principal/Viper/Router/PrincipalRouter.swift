//
//  PrincipalRouter.swift
//  GapsiApp
//
//  Created by Ricardo Alonso Diaz Alvarado on 23/04/23.
//

import UIKit

class PrincipalRouter: PresenterToRouterDashboardProtocol {

    static func createModuleToDashboard() -> UIViewController? {
        let viewController = PrincipalViewController()
        let navigation = UINavigationController(rootViewController: viewController)
        let presenter = PrincipalPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = PrincipalRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = PrincipalInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        return navigation
    }
    
    static func createModuleOfLogin() -> UIViewController? {
        let viewController = PrincipalViewController()
        let presenter = PrincipalPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = PrincipalRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = PrincipalInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        return viewController
    }
    
//    func pushToMoviewDetail(on view: PresenterToViewDashboardProtocol?, with movie: dataMotionResultModel) {
//        //si se requiere router
//    }
//    
//    func pushToProfile(on view: PresenterToViewDashboardProtocol?, with profileData: dataAccountModel) {
//        //si se requiere router
//    }


}

