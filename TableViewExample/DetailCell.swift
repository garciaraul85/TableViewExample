//
//  DetailCell.swift
//  TableViewExample
//
//  Created by Saulo Garcia on 9/11/20.
//

import Foundation
import UIKit

class DetailCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)

        self.initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.initialize()
    }

    func initialize() {
        // nothing to do here :)
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        self.textLabel?.text = nil
        self.detailTextLabel?.text = nil
        self.imageView?.image = nil
    }
}
