//
//  PrincipalProtocols.swift
//  GapsiApp
//
//  Created by Ricardo Alonso Diaz Alvarado on 23/04/23.
//

import UIKit

//MARK: View Input (View -> Presenter)
protocol ViewToPresenterDashboardProtocol: AnyObject {
    var view: PresenterToViewDashboardProtocol? { get set }
    var interactor: PresenterToInteractorDashboardProtocol? { get set }
    var router: PresenterToRouterDashboardProtocol? { get set }
    var arrData: [ItemElement] { get set }
    var arrWords: [String] { get set }

    func viewDidAppear() async
    func viewDidLoad() async
    func refresh(query: String, page: String) async

    func numberOfRowsInSection(tableView: UITableView, seciont: Int) -> Int
    func didSelectRowAt(index: Int)
    func setCell(tableView: UITableView,
                 forRowAt indexPath: IndexPath) -> UITableViewCell
    
}

//MARK: View Output (Presenter -> View)
protocol PresenterToViewDashboardProtocol: AnyObject {
    func onFetchMoviesSuccess()
    func onFetchMoviewsFailure(error: String)
    func showActivity()
    func hideActivity()
    
    func getNavigation() -> UINavigationController
    func getUI() -> UIPrincipal

}

//MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorDashboardProtocol {
    var presenter: InteractorToPresenterDashboardProtocol? { get set }
    func getAccountData(query: String, page: String) async
}

//MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterDashboardProtocol: AnyObject {
    func fetchAccountDataSuccess(data: JsonModel)
    func fetchAccountDataFailure(error: String)

}

//MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterDashboardProtocol {
    static func createModuleToDashboard() -> UIViewController?
    static func createModuleOfLogin() -> UIViewController?
}
