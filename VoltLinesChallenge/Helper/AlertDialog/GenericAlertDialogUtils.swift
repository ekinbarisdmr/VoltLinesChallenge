//
//  GenericAlertDialogUtils.swift
//  VoltLinesChallenge
//
//  Created by Ekin Demir on 2.05.2023.
//

import UIKit

class GenericAlertDialogUtils {
    
    static let shared = GenericAlertDialogUtils()
    let vwAlert = GenericAlertDialogView()
    
    func showAlert() {
        DispatchQueue.main.async {
            self.vwAlert.showAlert()
        }
    }
}
