//
//  CustomCell.swift
//  TableViewExample
//
//  Created by Saulo Garcia on 9/11/20.
//

import Foundation
import UIKit

//Our custom cell will have a big image background plus a title label in the center of the view with a custom sized system font.
class CustomCell: UITableViewCell {

    weak var coverView: UIImageView!
    weak var titleLabel: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.initialize()
    }

    func initialize() {
        let coverView = UIImageView(frame: .zero)
        coverView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(coverView)
        self.coverView = coverView

        let titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(titleLabel)
        self.titleLabel = titleLabel

        NSLayoutConstraint.activate([
            self.contentView.topAnchor.constraint(equalTo: self.coverView.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.coverView.bottomAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: self.coverView.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.coverView.trailingAnchor),

            self.contentView.centerXAnchor.constraint(equalTo: self.titleLabel.centerXAnchor),
            self.contentView.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
        ])

        self.titleLabel.font = UIFont.systemFont(ofSize: 64)
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        self.coverView.image = nil
    }
}
