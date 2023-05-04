//
//  LinesListViewController.swift
//  VoltLinesChallenge
//
//  Created by Ekin Demir on 1.05.2023.
//

protocol LinesListViewControllerDelegate: AnyObject {
    func didBookedTrip(_ id: Int)
}

import UIKit

class LinesListViewController: VoltLinesViewController {
    
    var presenter: LinesListPresenter = { () in
            .init()
    }()
    
    let tvList: UITableView = {
        let tbl = UITableView()
        tbl.backgroundColor = .white
        tbl.separatorStyle = .none
        tbl.showsVerticalScrollIndicator = true
        return tbl
    }()
    
    var routeId = Int()
    var line = StationMapModel()
    weak var delegate: LinesListViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        initPresenter()
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(tvList)
        setTitle()
        
        tvList.delegate = self
        tvList.dataSource = self
        tvList.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tvList.registerCellWithoutNib(LineItemCell.self)
        tvList.registerCellWithoutNib(ListLineCell.self)
        tvList.registerCellWithoutNib(LinesListSpacingCell.self)
    }
    
    private func setTitle() {
        let titleItem = UIBarButtonItem(title: Constants.kRoutes, style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = titleItem
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20),
            .foregroundColor: UIColor.mainBottomColor
        ]
        navigationController?.navigationBar.titleTextAttributes = attributes
    }
    
    func initPresenter() {
        presenter.selectedTrips = line
        presenter.generateTripList()
        
        presenter.didListUpdated = {
            DispatchQueue.main.async {
                self.tvList.reloadData()
            }
        }
        
        presenter.didBookedTrip = { id in
            self.delegate?.didBookedTrip(id)
            self.dismiss(animated: true)
        }
        
        presenter.didFailedBookTrip = {
            GenericAlertDialogUtils.shared.showAlert()
        }
    }
}

extension LinesListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.presenter.sectionListSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.rowCount(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = self.presenter.sectionListSource[indexPath.section]
        switch data.type {
        case .line:
            return ListLineCell.createCell(data, tableView: tableView, indexPath: indexPath)
        case .spacing:
            return LinesListSpacingCell.createCell(data, tableView: tableView, indexPath: indexPath)
        case .route:
            return LineItemCell.createCell(data, tableView: tableView, indexPath: indexPath, delegate: self)
        }
    }
}

extension LinesListViewController: LineItemCellDelegate {
    func didTappedLineBook(_ id: Int) {
        self.presenter.bookSelectedTrip(id)
    }
}

