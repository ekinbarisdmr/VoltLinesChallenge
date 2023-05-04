//
//  WindowHelper.swift
//  VoltLinesChallenge
//
//  Created by Ekin Demir on 1.05.2023.
//

import UIKit

public class WindowHelper {

    public static func getWindow() -> UIWindow? {

        if #available(iOS 13.0, *) {
            let keyWindow = UIApplication.shared.connectedScenes
                .filter({ $0.activationState == .foregroundActive })
                .map({ $0 as? UIWindowScene })
                .compactMap({ $0 })
                .first?.windows
                .filter({ $0.isKeyWindow }).first
            return keyWindow
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
