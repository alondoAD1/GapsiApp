//
//  UIViewController.swift
//  GapsiApp
//
//  Created by Ricardo Alonso Diaz Alvarado on 23/04/23.
//

import UIKit

class UIPrincipal {
    
    lazy var search: UITextField = {
        let item = UITextField()
        item.borderStyle = .roundedRect
        item.placeholder = "Search"
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()
    
    lazy var btnSearch: UIButton = {
        let item = UIButton()
        item.setTitle("Search", for: .normal)
        item.backgroundColor = .red
        item.layer.cornerRadius = 5
        item.layer.masksToBounds = true
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()
    
    lazy var tableViewWords: UITableView = {
        let item = UITableView()
        item.register(PrincipalWordsCell.self, forCellReuseIdentifier: PrincipalWordsCell.indentifier)
        item.backgroundColor = .clear
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()
    
    lazy var tableView: UITableView = {
        let item = UITableView()
        item.register(UIPrincipalCell.self, forCellReuseIdentifier: UIPrincipalCell.indentifier)
        item.backgroundColor = .clear
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()
    
    func setLayoutConstraint(view: UIView) {
        view.addSubview(search)
        view.addSubview(btnSearch)
        view.addSubview(tableViewWords)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            search.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            search.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            search.rightAnchor.constraint(equalTo: btnSearch.leftAnchor, constant: -10),
            search.heightAnchor.constraint(equalToConstant: 40),
            
            btnSearch.topAnchor.constraint(equalTo: search.topAnchor),
            btnSearch.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            btnSearch.heightAnchor.constraint(equalToConstant: 40),
            btnSearch.widthAnchor.constraint(equalToConstant: 100),
            
            tableViewWords.topAnchor.constraint(equalTo: search.bottomAnchor, constant: 25),
            tableViewWords.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableViewWords.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableViewWords.heightAnchor.constraint(equalToConstant: 80),

            tableView.topAnchor.constraint(equalTo: tableViewWords.bottomAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
}
