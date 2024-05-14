//
//  FeedCell.swift
//  Nasastromy
//
//  Created by Asep Hikmat Fatahillah on 13/05/24.
//

import UIKit

enum NasaCellType: String {
    case astroPod
}

protocol NasaCellModel {
    var type: NasaCellType { get }
}

protocol NasaCell {
    func configure(with model: NasaCellModel)
}

struct FeedCellModel: NasaCellModel {
    var type: NasaCellType { return .astroPod }
    
    let title: String
    let imageUrl: String
    let date: String
}

final class FeedCell: UITableViewCell, NasaCell {
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
    
    private let dateLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 1
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 10, weight: .light)
        return $0
    }(UILabel())
    
    private let divider: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .gray
        return $0
    }(UIView())
    
    override func prepareForReuse() {
        super.prepareForReuse()
        astroImageView.image = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubview() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(astroImageView)
        contentView.addSubview(dateLabel)
        contentView.addSubview(divider)
        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(contentsOf: [
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        constraints.append(contentsOf: [
            astroImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            astroImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            astroImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            astroImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            astroImageView.heightAnchor.constraint(equalTo: astroImageView.widthAnchor)
        ])
        
        constraints.append(contentsOf: [
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dateLabel.topAnchor.constraint(equalTo: astroImageView.bottomAnchor, constant: 8),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
        
        constraints.append(contentsOf: [
            divider.heightAnchor.constraint(equalToConstant: 1),
            divider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            divider.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 16),
            divider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            divider.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func configure(with model: NasaCellModel) {
        guard let model = model as? FeedCellModel else { return }
        titleLabel.text = model.title
        astroImageView.load(from: model.imageUrl)
        dateLabel.text = model.date
    }
}
