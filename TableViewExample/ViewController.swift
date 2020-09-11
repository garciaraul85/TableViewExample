//
//  ViewController.swift
//  TableViewExample
//
//  Created by Saulo Garcia on 9/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    weak var tableView: UITableView!

    var placeholderView = UIView(frame: .zero)
    var isPullingDown = false

    enum Style {
        case `default`
        case subtitle
        case custom
    }

    var style = Style.default

    var items: [String: [String]] = [
        "Originals": ["👽", "🐱", "🐔", "🐶", "🦊", "🐵", "🐼", "🐷", "💩", "🐰","🤖", "🦄"],
        "iOS 11.3": ["🐻", "🐲", "🦁", "💀"],
        "iOS 12": ["🐨", "🐯", "👻", "🦖"],
    ]
    
    override func loadView() {
        super.loadView()

        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: tableView.topAnchor),
            self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
            self.view.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
        ])
        self.tableView = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()

    }
    
    func loadData() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        
        // Bind cells
        self.tableView.register(DetailCell.self, forCellReuseIdentifier: "DetailCell")
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        self.tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: "HeaderView")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .singleLine
        self.tableView.separatorColor = .lightGray
        self.tableView.separatorInset = .zero
        self.navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .refresh, target: self, action: #selector(self.toggleCells))
    }
    
    @objc func toggleCells() {
        switch self.style {
            case .default:
                self.style = .subtitle
            case .subtitle:
                self.style = .custom
            case .custom:
                self.style = .default
        }

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - helpers

    func key(for section: Int) -> String {
        let keys = Array(self.items.keys).sorted { first, last -> Bool in
            if first == "Originals" {
                return true
            }
            return first < last
        }
        let key = keys[section]
        return key
    }

    func items(in section: Int) -> [String] {
        let key = self.key(for: section)
        return self.items[key]!
    }

    func item(at indexPath: IndexPath) -> String {
        let items = self.items(in: indexPath.section)
        return items[indexPath.item]
    }

}

// Adapter
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.items.keys.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items(in: section).count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.item(at: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.titleLabel.text = item
        cell.coverView.image = UIImage(named: "Swift")
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.key(for: section)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let item = self.item(at: indexPath)
        let alertController = UIAlertController(title: item, message: "is in da house!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as! HeaderView
        view.titleLabel.text = self.key(for: section)
        return view
    }
}
