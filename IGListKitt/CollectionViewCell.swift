//
//  CollectionViewCell.swift
//  IGListKitt
//
//  Created by Saadet Şimşek on 18/08/2024.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let label: UILabel = {
          let label = UILabel()
          label.translatesAutoresizingMaskIntoConstraints = false
          label.textAlignment = .center
          return label
    }()
      
    override init(frame: CGRect) {
          super.init(frame: frame)
          
          contentView.backgroundColor = .systemBlue
          contentView.addSubview(label)
          addConstraints()
          
    }
      
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
      
    private func addConstraints(){
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
          
    }
      
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
      
    func configure(with text: String?){
        label.text = text
    }
}
