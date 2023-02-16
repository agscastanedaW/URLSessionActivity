//
//  DogsViewController.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 16/02/23.
//

import UIKit

final class DogsViewController: UITableViewController {
    
    private let dogsService: DogsService
    private var dogs: [DogViewData] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    init(dogsService: DogsService) {
        self.dogsService = dogsService
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
        Task.init {
            do {
                self.dogs = try await dogsService.getDogs()
            } catch {
                self.dogs = []
                show(error)
            }
        }
    }
    
    private func show(_ error: Error) {
        print(error.localizedDescription)
    }
}

// MARK: - UITableViewDataSourceMethod

extension DogsViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SubtitleTableViewCell.reuseIdentifier, for: indexPath)
        cell.textLabel?.text = dogs[indexPath.row].breed
        cell.detailTextLabel?.text = dogs[indexPath.row].description
        return cell
    }
}
