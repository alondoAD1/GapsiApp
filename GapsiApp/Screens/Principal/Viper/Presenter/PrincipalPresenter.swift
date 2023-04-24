//
//  PrincipalPresenter.swift
//  GapsiApp
//
//  Created by Ricardo Alonso Diaz Alvarado on 23/04/23.
//
import UIKit

class PrincipalPresenter: ViewToPresenterDashboardProtocol {

    var view: PresenterToViewDashboardProtocol?
    var interactor: PresenterToInteractorDashboardProtocol?
    var router: PresenterToRouterDashboardProtocol?
    
    var arrData = [ItemElement]()
    var arrWords: [String] = []
    
    func viewDidAppear() async {
        //viewdidappear
    }
    
    @MainActor
    func viewDidLoad() async {
        view?.showActivity()
        do {
            if UserDefaults.standard.object(forKey: "WordsArr") != nil {
                arrWords = UserDefaults.standard.stringArray(forKey: "WordsArr") ?? [String]()
            }
            await interactor?.getAccountData(query: "computer", page: "1")
            
            view?.hideActivity()
            view?.onFetchMoviesSuccess()
        }
        
    }
    
    @MainActor
    func refresh(query: String, page: String) async {
        do {
            await interactor?.getAccountData(query: query, page: page)
            
            view?.hideActivity()
            view?.onFetchMoviesSuccess()
        }
    }
    
    func numberOfRowsInSection(tableView: UITableView, seciont: Int) -> Int {
        if tableView == view?.getUI().tableViewWords {
            return arrWords.count
        }
        return arrData.count
    }
    
    func didSelectRowAt(index: Int) {
        //did select
    }
    
    func didTapViewProfile() {
        //did extra
    }
    
    func setCell(tableView: UITableView, forRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == view?.getUI().tableViewWords {
            if let cell = tableView.dequeueReusableCell(withIdentifier: PrincipalWordsCell.indentifier, for: indexPath) as? PrincipalWordsCell {
                let data = arrWords[indexPath.row]
                cell.lblTitle.text = data
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: UIPrincipalCell.indentifier, for: indexPath) as? UIPrincipalCell {
                let data = arrData[indexPath.row]
                cell.setImageUrl(imagenURL: data.image ?? "")
                cell.lblTitle.text = data.name ?? ""
                cell.lblPrice.text = "$ " + String(data.price ?? 0)
                return cell
            }
        }
    
        return UITableViewCell()
    }
    
}

extension PrincipalPresenter: InteractorToPresenterDashboardProtocol {
    func fetchAccountDataSuccess(data: JsonModel) {
        for data in data.item?.props.pageProps.initialData.searchResult.itemStacks ?? [] {
            arrData = data.items
        }
    }
    
    func fetchAccountDataFailure(error: String) {
        view?.hideActivity()
        view?.onFetchMoviewsFailure(error: String(describing: error).appending(UIConstants.Dashboard.Errors.error))
    }
    
}
