//
//  CatsUIComposer.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 16/02/23.
//

import UIKit

final class CatsUIComposer {
    
    static func compose() -> MenuTabController {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decoderResultsAdapter = JSONDecoderResultAdapter(decoder: decoder)
        // TODO: Replace local fetching to API fetching.
        let catsFetcher = LocalFileFetcher(fileName: "cats-v2", fileExtension: "json", decodableResultAdapter: decoderResultsAdapter)
        let favoriteCatsSaver = UserDefaultsSaver()
        let catsService = CatsServiceImp(fetcher: catsFetcher, saver: favoriteCatsSaver)
        let catsViewController = CatsViewController(catsService: catsService)
        return catsViewController
    }
}
