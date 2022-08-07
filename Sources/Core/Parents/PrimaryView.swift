//
//  PrimaryView.swift
//  KinopoiskApp
//
//  Created by Nikita Yazikov on 08.02.2020.
//  Copyright © 2020 Nikita Yazikov. All rights reserved.
//

import UIKit

public protocol NibInitializable {
    var view: UIView! { get set }
}

extension NibInitializable where Self: PrimaryView {
    func nibSetup() {
        view = loadFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        addSubview(view)
    }
}

open class PrimaryView: UIView, NibInitializable {
    open var view: UIView! {
        didSet {
            configureUI()
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }

    open func configureUI() {
        
    }
}
