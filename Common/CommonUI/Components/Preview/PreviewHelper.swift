//
//  PreviewHelper.swift
//  CommonUI
//
//  Created by Fauzi Arda on 27/07/23.
//
import Foundation
#if DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct ViewControllerPreview: UIViewControllerRepresentable {
    let viewControllerBuilder: () -> UIViewController
    
    init(_ viewControllerBuilder: @escaping () -> UIViewController) {
        self.viewControllerBuilder = viewControllerBuilder
    }
    
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> some UIViewController {
        return viewControllerBuilder()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // Not needed
    }
}

@available(iOS 13.0.0, *)
public struct UIViewPreviewWrapper: UIViewRepresentable {
    public let viewBuilder: () -> UIView

    public init(_ viewBuilder: @escaping () -> UIView) {
        self.viewBuilder = viewBuilder
    }

    public func makeUIView(context: Context) -> some UIView {
        viewBuilder()
    }

    public func updateUIView(_ uiView: UIViewType, context: Context) {
        // Not needed
    }
}

#endif
