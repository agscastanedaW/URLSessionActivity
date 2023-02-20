//
//  ViewController.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 14/02/23.
//

import UIKit
import Foundation

final class CatsViewController: UITableViewController {
    
    private let catsService: CatsService
    private let simpleAlertFactory: SimpleAlertFactory
    private var cats: [CatViewData] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    init(catsService: CatsService,
         simpleAlertFactory: SimpleAlertFactory = SimpleAlertFactoryImp()) {
        self.catsService = catsService
        self.simpleAlertFactory = simpleAlertFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: SubtitleTableViewCell.reuseIdentifier)
        callFetcher()
    }
    
    private func callFetcher() {
        catsService.getCats() { [weak self] (result: Result<[CatViewData], Error>) in
            switch result {
            case let .success(cats):
                self?.cats = cats
            case let .failure(error):
                self?.cats = []
                self?.show(error)
            }
        }
    }
    
    private func show(_ error: Error) {
        let alert = simpleAlertFactory.make(with: "Ha ocurrido un error!",
                                            message: error.localizedDescription,
                                            buttonTitle: "OK")
        navigationController?.present(alert, animated: true)
    }
    
    func addFavoriteCat(at index: Int) {
        guard cats.count > index else { return }
        cats[index].didSelect()
    }
}

// MARK: - UITableViewDataSourceMethod

extension CatsViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SubtitleTableViewCell.reuseIdentifier, for: indexPath)
        cell.textLabel?.text = cats[indexPath.row].breed
        cell.detailTextLabel?.text = cats[indexPath.row].size
        return cell
    }
}

// MARK: - UITableViewDelegate

extension CatsViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        addFavoriteCat(at: indexPath.row)
    }
}

class SubtitleTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: SubtitleTableViewCell.self)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        detailTextLabel?.numberOfLines = 0
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
