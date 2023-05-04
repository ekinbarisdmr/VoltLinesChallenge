//
//  MainSpinner.swift
//  VoltLinesChallenge
//
//  Created by Ekin Demir on 1.05.2023.
//

import UIKit

open class MainSpinner {
    internal static var progressContainerView: UIView?
    
    public static var backgroundColor: UIColor = UIColor.black.withAlphaComponent(0.6)
    
    internal static var touchHandler: (() -> Void)?
    
    public static func spin(_ backgroundColor: UIColor = backgroundColor, touchHandler: (() -> Void)? = nil) {
        if let window = WindowHelper.getWindow() {
            if let pView = progressContainerView {
                window.addSubview(pView)
            }else {
                let progressBackgroundView = UIView(frame: UIScreen.main.bounds)
                progressBackgroundView.backgroundColor = backgroundColor
                
                let loaderView: LoaderView = LoaderView.fromNib()
                loaderView.backgroundColor = UIColor.clear
                loaderView.backVIew.backgroundColor = UIColor.clear
                loaderView.loaderImageView.backgroundColor = UIColor.clear
                loaderView.center = progressBackgroundView.center
                
                progressBackgroundView.addSubview(loaderView)
                window.addSubview(progressBackgroundView)
                            
                self.progressContainerView = progressBackgroundView
            }
        }
        
        if touchHandler != nil {
            self.touchHandler = touchHandler
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(runTouchHandler))
            progressContainerView!.addGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    @objc internal static func runTouchHandler() {
        if touchHandler != nil {
            touchHandler!()
        }
    }
    
    public static func stop() {
        if let view = progressContainerView {
            view.removeFromSuperview()
            progressContainerView = nil
        }
    }
}
