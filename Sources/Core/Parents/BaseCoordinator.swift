//
//  BaseCoordinator.swift
//  KinopoiskApp
//
//  Created by Nikita Yazikov on 08.02.2020.
//  Copyright © 2020 Nikita Yazikov. All rights reserved.
//

import Foundation
import RxSwift

open class BaseCoordinator: Coordinatable {
    open var childCoordinators: [Coordinatable] = []
    
    // MARK: - Coordinatable
    
    open var finishFlow: Action?
    open func start() {}

    /// Utility `DisposeBag` used by the subclasses.
    public let disposeBag = DisposeBag()
    
    public init() {
        
    }

    deinit {
        print("\(NSStringFromClass(type(of: self)).components(separatedBy: ".").last!) deinit")
    }
    
    // add only unique object
    open func addDependency(_ coordinator: Coordinatable) {
        for element in childCoordinators where element === coordinator {
             return
        }
        childCoordinators.append(coordinator)
    }

    open func removeDependency(_ coordinator: Coordinatable?) {
        guard
            childCoordinators.isEmpty == false,
            let coordinator = coordinator
            else { return }

        for (index, element) in childCoordinators.enumerated() where element === coordinator {
                childCoordinators.remove(at: index)
                break
        }
    }
}
