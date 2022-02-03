//
//  StoreCell.swift
//  KNU_Hackerton
//
//  Created by doyun on 2022/01/16.
//

import Foundation
import SnapKit
import Then

private let reuseIdentifier = "StoreCell"
class StoreCell : UITableViewCell {

    //MARK: - Properties
    
    private lazy var storeImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.snp.makeConstraints { make in
            make.size.height.width.equalTo(40)
        }
        $0.layer.cornerRadius = 40/2
        $0.backgroundColor = .red
    }

    private let storenameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Username"
        return label
    }()

    private let ratingLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "4.5/5.0"
        return label
    }()

    //MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(storeImageView)
        storeImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
        }

        let stack = UIStackView(arrangedSubviews: [storenameLabel,ratingLabel])
        stack.axis = .vertical
        stack.spacing = 2

        addSubview(stack)
        
        stack.snp.makeConstraints { make in
            make.left.equalTo(storeImageView.snp.right).offset(12)
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
