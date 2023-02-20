//
//  ShowErrorController.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 19/02/23.
//

import UIKit

protocol SimpleAlertFactory {
    func make(with title: String, message: String, buttonTitle: String) -> UIAlertController
}

final class SimpleAlertFactoryImp: SimpleAlertFactory {
    func make(with title: String, message: String, buttonTitle: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        return alert
    }
}
