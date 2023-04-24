//
//  PrincipalWordsCell.swift
//  GapsiApp
//
//  Created by Ricardo Alonso Diaz Alvarado on 23/04/23.
//

import UIKit

class PrincipalWordsCell: UITableViewCell {
    
    static let indentifier = String(describing: PrincipalWordsCell.self)
    
    lazy var lblTitle: UILabel = {
        let item = UILabel()
        item.text = "hola"
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        setLayoutConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setLayoutConstraint() {
        addSubview(lblTitle)
        
        NSLayoutConstraint.activate([
            lblTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            lblTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            lblTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            lblTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            lblTitle.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

}
