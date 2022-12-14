//
//  BaseViewController.swift
//  KinopoiskApp
//
//  Created by Nikita Yazikov on 08.02.2020.
//  Copyright © 2020 Nikita Yazikov. All rights reserved.
//

import UIKit
import RxSwift

open class BaseViewController: UIViewController {

    // MARK: - Properties

    // Utility `DisposeBag` used by the subclasses.

    public let disposeBag = DisposeBag()

    // MARK: - Life Cycle

    open override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    deinit {
        print("\(self.nameOfClass) deinit")
    }
    
    // MARK: - Internal methodes
    
    open func setupBindings() {
        
    }
    
    open func setupUI() {
        
    }
    
    // MARK: - showErrorAlert

    open func showErrorAlertWith(_ message: String) {
        let alert = UIAlertController(title: "Alert.Title.Error".localized, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Alert.Button.OK".localized, style: .default) { _ in })
        present(alert, animated: true, completion: nil)
    }
}
