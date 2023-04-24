//
//  File.swift
//  GapsiApp
//
//  Created by Ricardo Alonso Diaz Alvarado on 23/04/23.
//

import Foundation

class PrincipalInteractor: PresenterToInteractorDashboardProtocol {
    
    var presenter: InteractorToPresenterDashboardProtocol?
    
    func getAccountData(query: String, page: String) async {
        do {
            let data = try await NetworkingService.request(endPoint: NetworkConstants.endPoint.query(query: query, nextPage: page).url, model: JsonModel.self, method: .GET)
            presenter?.fetchAccountDataSuccess(data: data)
        } catch {
            presenter?.fetchAccountDataFailure(error: error.localizedDescription)
        }
    }
    
}
