//
//  ViewControllerCell.swift
//  GapsiApp
//
//  Created by Ricardo Alonso Diaz Alvarado on 23/04/23.
//

import UIKit

class UIPrincipalCell: UITableViewCell {
    
    static let indentifier = String(describing: UIPrincipalCell.self)
    
    lazy var imgContent: UIImageView = {
        let item = UIImageView()
        item.layer.cornerRadius = 20
        item.layer.masksToBounds = true
        item.clipsToBounds = true
        item.contentMode = .scaleToFill
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()
    
    lazy var lblTitle: UILabel = {
        let item = UILabel()
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()
    
    lazy var lblPrice: UILabel = {
        let item = UILabel()
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
        addSubview(imgContent)
        addSubview(lblTitle)
        addSubview(lblPrice)
        
        NSLayoutConstraint.activate([
            imgContent.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            imgContent.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            imgContent.widthAnchor.constraint(equalToConstant: 100),
            imgContent.heightAnchor.constraint(equalToConstant: 250),
            imgContent.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            lblTitle.topAnchor.constraint(equalTo: imgContent.topAnchor),
            lblTitle.leftAnchor.constraint(equalTo: imgContent.rightAnchor, constant: 10),
            lblTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            
            lblPrice.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 15),
            lblPrice.leftAnchor.constraint(equalTo: imgContent.rightAnchor, constant: 10),
            lblPrice.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),

        ])
    }
    
    func setImageUrl(imagenURL: String?) {
        guard let url = imagenURL else {
            return
        }
        imgContent.loadimagenUsandoCacheConURLString(urlString: url)
    }

}
