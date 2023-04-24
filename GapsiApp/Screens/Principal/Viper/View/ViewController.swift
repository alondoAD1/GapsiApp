//
//  ViewController.swift
//  GapsiApp
//
//  Created by Ricardo Alonso Diaz Alvarado on 23/04/23.
//

import UIKit

class PrincipalViewController: UIViewController {
    
    var presenter: (ViewToPresenterDashboardProtocol & InteractorToPresenterDashboardProtocol)?
    let uiVC = UIPrincipal()
    var loader: UIAlertController = UIAlertController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader = self.loader(message: "Loading")
        self.present(self.loader, animated: true, completion: nil)
        setUpUI()
        uiVC.search.addTarget(self, action: #selector(tapSearch(_:)), for: .touchUpInside)
        uiVC.btnSearch.addTarget(self, action: #selector(searchNewData(_:)), for: .touchUpInside)
        Task { [weak self] in
            await self?.presenter?.viewDidLoad()
            self?.pausarLoader(loader: self?.loader ?? UIAlertController())
        }
    }
    
    func setUpUI() {
        title = "Store"
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        uiVC.tableViewWords.delegate = self
        uiVC.tableViewWords.dataSource = self
        uiVC.tableView.delegate = self
        uiVC.tableView.dataSource = self
        uiVC.setLayoutConstraint(view: view)
    }
    
    @objc func tapSearch(_ sender: UIButton) {
        presenter?.arrWords = UserDefaults.standard.stringArray(forKey: "WordsArr") ?? [String]()
        DispatchQueue.main.async {
            self.uiVC.tableViewWords.reloadData()
        }
    }
    
    @objc func searchNewData(_ sender: UIButton) {
        loader = self.loader(message: "Searching")
        self.present(self.loader, animated: true, completion: nil)
        if let value = uiVC.search.text {
            presenter?.arrWords.append(value)
            Task { [weak self] in
                await self?.presenter?.refresh(query: value.capitalized, page: "1")
                self?.pausarLoader(loader: self?.loader ?? UIAlertController())
                UserDefaults.standard.set(presenter?.arrWords, forKey: "WordsArr")
                UserDefaults.standard.synchronize()
            }
        } else {
            self.pausarLoader(loader: self.loader)
        }
    }

}

extension PrincipalViewController: PresenterToViewDashboardProtocol {
    func onFetchMoviesSuccess() {
        DispatchQueue.main.async {
            self.uiVC.tableView.reloadData()
            self.uiVC.tableViewWords.reloadData()
        }
    }
    
    func onFetchMoviewsFailure(error: String) {
        //
    }
    
    func showActivity() {
        //
    }
    
    func hideActivity() {
        //
    }
    
    func getNavigation() -> UINavigationController {
        return self.navigationController ?? UINavigationController()
    }
    
    func getUI() -> UIPrincipal {
        return uiVC
    }
    
}

extension PrincipalViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == uiVC.tableViewWords {
            return 40
        }
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter?.setCell(tableView: tableView, forRowAt: indexPath) ?? UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection(tableView: tableView, seciont: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == uiVC.tableViewWords {
            let data = presenter?.arrWords[indexPath.row]
            loader = self.loader(message: "Searching")
            self.present(self.loader, animated: true, completion: nil)
            Task { [weak self] in
                await self?.presenter?.refresh(query: data ?? "", page: "1")
                self?.pausarLoader(loader: self?.loader ?? UIAlertController())
            }
        }
    }

}
