//
//  FeedViewController.swift
//  Nasastromy
//
//  Created by Asep Hikmat Fatahillah on 13/05/24.
//

import UIKit

protocol FeedViewable {
    func reloadTableView()
}

final class FeedViewController: UIViewController, FeedViewable {
    private lazy var tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dataSource = self
        $0.delegate = self
        $0.register(FeedCell.self, forCellReuseIdentifier: NasaCellType.astroPod.rawValue)
        $0.separatorStyle = .none
        return $0
    }(UITableView())
    
    private let presenter: FeedPresentable
    
    init(presenter: FeedPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubview()
        loadData()
    }
    
    private func setupSubview() {
        title = "Nasastromy"
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func loadData() {
        Task {
            let _ = await presenter.fetchAstroPod(startDate: Date.sevenDaysAgo, endDate: Date.today)
            reloadTableView()
        }
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.astroPods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = presenter.nasaCellModel(at: indexPath.row)
        let identifier = model.type.rawValue
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? NasaCell else { return UITableViewCell() }
        
        cell.configure(with: model)
        (cell as! UITableViewCell).selectionStyle = .none
        return cell as! UITableViewCell
    }
}

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath.row)
    }
}
