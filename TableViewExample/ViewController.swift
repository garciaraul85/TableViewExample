//
//  ViewController.swift
//  TableViewExample
//
//  Created by Saulo Garcia on 9/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    weak var tableView: UITableView!
    var items: [String] = [
        "👽", "🐱", "🐔", "🐶", "🦊", "🐵", "🐼", "🐷", "💩", "🐰",
        "🤖", "🦄", "🐻", "🐲", "🦁", "💀", "🐨", "🐯", "👻", "🦖",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadTableViewAndAnchorIt()
        loadData()

    }

    // We'll use a weak property to hold a reference to our table view. Next, we override the loadView method & call super, in order to load the controller's self.view property with a view object (from a nib or a storyboard file if there is one for the controller). After that we assign our brand new view to a local property, turn off system provided layout stuff, and insert our table view into our view hierarchy. Finally we create some real constraints using anchors & save our pointer to our weak property. Easy!
    func loadTableViewAndAnchorIt() {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: tableView.topAnchor),
            self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
            self.view.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor)
        ])
        self.tableView = tableView
    }
    
    func loadData() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        self.tableView.dataSource = self
    }

}

// Adapter
//Ok, we have an empty table view, let's display some cells! In order to fill our table view with real data, we have to conform to the UITableViewDataSource protocol. Through a simple delegate pattern, we can provide various information for the UITableView class, so it'll to know how much sections and rows will be needed, what kind of cells should be displayed for each row, and many more little details.

//Another thing is that UITableView is a really efficient class. It'll reuse all the cells that are currently not displayed on the screen, so it'll consume way less memory than a UIScrollView, if you have to deal with hundreds or thousands of items. To support this behavior we have to register our cell class with a reuse identifier, so the underlying system will know what kind of cell is needed for a specific place. ⚙️
extension ViewController: UITableViewDataSource {
    // Returns number of items
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    // Binds each item
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let item = self.items[indexPath.item]
        cell.textLabel?.text = item
        return cell
    }
}
