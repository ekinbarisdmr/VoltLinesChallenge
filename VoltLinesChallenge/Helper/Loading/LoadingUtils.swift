//
//  LoadingUtils.swift
//  VoltLinesChallenge
//
//  Created by Ekin Demir on 1.05.2023.
//

import UIKit

class LoadingUtils {
    static let shared = LoadingUtils()
    func visible(_ show: Bool = true, bgColor: UIColor = UIColor.black.withAlphaComponent(0.6)) {
        if show {
            DispatchQueue.main.async {
                MainSpinner.spin(bgColor)
            }
        }else {
            DispatchQueue.main.async {
                MainSpinner.stop()
            }
        }
    }
}
