//
//  LineItemCell.swift
//  VoltLinesChallenge
//
//  Created by Ekin Demir on 1.05.2023.
//

protocol LineItemCellDelegate: AnyObject {
    func didTappedLineBook(_ id: Int)
}

import UIKit

class LineItemCell: VoltLinesTableViewCell {
    
    lazy var lblLineName = createLabel(color: .mainBottomColor, font: UIFont(name: "Helvetica Neue", size: 16.0) ?? UIFont(), textAlign: .left)
    lazy var lblLineTime = createLabel(color: .mainBottomColor, font: UIFont(name: "Helvetica Neue", size: 16.0) ?? UIFont(), textAlign: .left)
    
    let btnBook: UIButton = {
        let btn = UIButton()
        btn.setTitle("Book", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 12.0)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    var lineId: Int?
    weak var delegate: LineItemCellDelegate?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        backgroundColor = .white
        contentView.backgroundColor = .white
        contentView.addViews(views: [
            lblLineName,
            btnBook,
            lblLineTime
        ])
        
        btnBook.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(36)
            make.width.equalTo(72)
            make.top.bottom.equalToSuperview().inset(4)
        }
        
        lblLineName.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.centerY.equalTo(btnBook.snp.centerY)
        }
        
        lblLineTime.snp.makeConstraints { make in
            make.trailing.equalTo(btnBook.snp.leading).offset(-12)
            make.centerY.equalTo(btnBook.snp.centerY)
        }
        
        btnBook.addTarget(self, action: #selector(didTappedBtnBook), for: .touchUpInside)
    }
    
    @objc func didTappedBtnBook() {
        delegate?.didTappedLineBook(lineId ?? 0)
    }
    
    func setData(_ data: LineItemModel) {
        lineId = data.id
        lblLineName.text = data.lineName
        lblLineTime.text = data.lineTime
    }
}

extension LineItemCell {
    static func createCell(_ data: LinesListSection, tableView: UITableView, indexPath: IndexPath, delegate: LineItemCellDelegate) -> UITableViewCell {
        let cell = tableView.dequeue(indexPath, cell: LineItemCell.self)
        if let data = data.items?[indexPath.row] as? LineItemModel {
            cell.setData(data)
            cell.delegate = delegate
        }
        return cell
    }
}
