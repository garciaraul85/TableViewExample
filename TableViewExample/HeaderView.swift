//
//  HeaderView.swift
//  TableViewExample
//
//  Created by Saulo Garcia on 9/11/20.
//

import Foundation
import UIKit

class HeaderView: UITableViewHeaderFooterView {

    weak var titleLabel: UILabel!

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        self.initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.initialize()
    }

    func initialize() {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(titleLabel)
        self.titleLabel = titleLabel

        NSLayoutConstraint.activate([
            self.contentView.centerXAnchor.constraint(equalTo: self.titleLabel.centerXAnchor),
            self.contentView.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
        ])

        self.contentView.backgroundColor = .black
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        self.titleLabel.textAlignment = .center
        self.titleLabel.textColor = .white
    }
}
