//
//  DetailViewController.swift
//  Nasastromy
//
//  Created by Asep Hikmat Fatahillah on 14/05/24.
//

import UIKit

protocol DetailViewable {
    func update(with data: AstroPod)
}

final class DetailViewController: UIViewController, DetailViewable {
    private let titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return $0
    }(UILabel())
    
    private let astroImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private let descriptionText: UITextView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isEditable = false
        return $0
    }(UITextView())
    
    private let presenter: DetailPresentable
    
    init(presenter: DetailPresentable) {
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
        title = "Image Detail"
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(astroImageView)
        view.addSubview(descriptionText)
        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(contentsOf: [
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        constraints.append(contentsOf: [
            astroImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            astroImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            astroImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            astroImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            astroImageView.heightAnchor.constraint(equalTo: astroImageView.widthAnchor)
        ])
        
        constraints.append(contentsOf: [
            descriptionText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionText.topAnchor.constraint(equalTo: astroImageView.bottomAnchor, constant: 8),
            descriptionText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            descriptionText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func loadData() {
        let data = presenter.getDetailData()
        update(with: data)
    }
    
    func update(with data: AstroPod) {
        titleLabel.text = data.title
        astroImageView.load(from: data.url)
        descriptionText.text = data.explanation
    }
}
