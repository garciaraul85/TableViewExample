//
//  MyCell.swift
//  TableViewExample
//
//  Created by Saulo Garcia on 9/11/20.
//

import Foundation
import UIKit

//UITableViewCell can provide some basic elements to display data (title, detail, image in different styles), but usually you'll need custom designed cells. Here is a basic template of a custom cell subclass
class MyCell: UITableViewCell {
    
    // The init(style:reuseIdentifier) method is a great place to override the cell style property
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initialize()
    }

    // You'll also have to implement init(coder:), so you should create a common initialize() function where you'll be able to add your custom views ot the view hierarchy, like we did in the loadView method above. If you are using xib files & IB, you can use the awakeFromNib method to add extra style to your views through the standard @IBOutlet properties (or add extra views to the hierarchy as well).
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }

    func initialize() {
    }
    
    // if you want to reset some properties, like the background of a cell, you can do it here. This method will be called before the cell is going to be reused.
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
