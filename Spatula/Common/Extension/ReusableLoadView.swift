//
//  ReusableLoadView.swift
//  Buzzni
//
//  Created by dasol lee on 2021/02/02.
//

import Foundation

protocol LoadNibView {
    static var identifier: String { get }
    static var nibName: String { get }
}

extension LoadNibView {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nibName: String {
        return String(describing: self)
    }
}
