//
//  CatsServiceImp.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 14/02/23.
//

final class CatsServiceImp: CatsService {
    
    private let fetcher: Fetcher
    private let saver: Saver
    
    init(fetcher: Fetcher, saver: Saver) {
        self.fetcher = fetcher
        self.saver = saver
    }
    
    func getCats(completion: @escaping (Result<[CatViewData], Error>) -> Void) {
        fetcher.fetchData() { [weak self] (result: Result<[Cat], Error>) in
            switch result {
            case let .success(cats):
                completion(.success(self?.mapToViewData(cats) ?? []))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    func mapToViewData(_ cats: [Cat]) -> [CatViewData] {
        cats.map { cat in
            CatViewData(breed: cat.breed, size: cat.size.description, selection: { [weak self] in
                self?.saveFavorite(cat)
            })
        }
    }
    
    private func saveFavorite(_ cat: Cat) {
        saver.saveData(data: cat, key: "favorite-cats-\(cat.identifier)") { result in
            switch result {
            case let .success(cat):
                print("Saved cat with identifier:", cat.identifier)
            case let .failure(error):
                print("Oops! An \(error) occured while saving:", cat)
            }
        }
    }
}
