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
        $0.register(FeedCell.self, forCellReuseIdentifier: FeedCell.description())
        $0.separatorStyle = .none
        return $0
    }(UITableView())
    
    var presenter: FeedPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubview()
        Task {
            await presenter?.fetchAstroPod()
        }
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
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.astroPods.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedCell.description(), for: indexPath) as? FeedCell, let model = presenter?.feedCellModel(at: indexPath.row) else { return UITableViewCell() }
        cell.configure(with: model)
        cell.selectionStyle = .none
        return cell
    }
}

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRow(at: indexPath.row)
    }
}
