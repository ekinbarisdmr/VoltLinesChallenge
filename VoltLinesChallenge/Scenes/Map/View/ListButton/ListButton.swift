//
//  ListButton.swift
//  VoltLinesChallenge
//
//  Created by Ekin Demir on 1.05.2023.
//

protocol ListButtonDelegate: AnyObject {
    func didTappedListButton()
}

import UIKit

class ListButton: UIView {
    
    let vwContainer: UIView = {
        let vw = UIView()
        vw.backgroundColor = .mainBottomColor
        vw.layer.cornerRadius = 8
        return vw
    }()
    
    lazy var lblList = createLabel(text: Constants.kListTrips, color: .white, font: UIFont(name: "Helvetica Neue", size: 16.0) ?? UIFont(), textAlign: .center, numberOfLines: 0)
    let btnList = UIButton(frame: .zero)
    weak var delegate:ListButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        backgroundColor = .clear
        layer.cornerRadius = 8
        addViews(views: [
            vwContainer
        ])
        
        vwContainer.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width - 40)
            make.height.equalTo(52)
        }
        
        vwContainer.addViews(views: [
            lblList,
            btnList
        ])
        
        lblList.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        btnList.backgroundColor = .clear
        btnList.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        btnList.addTarget(self, action: #selector(didTappedListButton), for: .touchUpInside)
    }
    
    @objc func didTappedListButton() {
        delegate?.didTappedListButton()
    }

    func showButton() {
        UIView.animate(withDuration: 1.5, animations: {
            self.vwContainer.alpha = 1
            self.vwContainer.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            self.vwContainer.layer.cornerRadius = 8
        })
    }
    
    func hideButton() {
        UIView.animate(withDuration: 0.5, animations: {
            self.vwContainer.alpha = 0
            self.vwContainer.transform = CGAffineTransform.identity
            self.vwContainer.layer.cornerRadius = self.vwContainer.bounds.height / 2
        })
    }
}
