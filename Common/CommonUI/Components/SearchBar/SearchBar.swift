//
//  SearchBar.swift
//  CommonUI
//
//  Created by Fauzi Arda on 27/07/23.
//

import Foundation
import UIKit

public class SearchBar: UIView {
    // MARK: Properties
    public var input: String = String()
    public var buttonSearchAction: () -> Void = {}
    public var onInputChangeAction: () -> Void = {}
    
    public convenience init(frame: CGRect = CGRect(x: 0, y: 0, width: 358, height: 57), buttonSearchAction: @escaping () -> Void = {}, onInputChangeAction: @escaping () -> Void = {}) {
        self.init(frame: frame)
        self.buttonSearchAction = buttonSearchAction
        self.onInputChangeAction = onInputChangeAction
        setupView()
    }
    
    // MARK: UIComponents
    let searchButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "cui_search_icon")
        button.setImage(image, for: .normal)
        button.setContentHuggingPriority(UILayoutPriority(rawValue: 10), for: .horizontal)
        button.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .horizontal)
        return button
    }()
    
    let searchInput: UITextField = {
        let input = UITextField()
        input.placeholder = "Search location.."
        return input
    }()
    
    let contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        return stack
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView(){
        backgroundColor = .white
//        uiDebugConfig()
        layer.cornerRadius = 57/2
        clipsToBounds = true
        
        setupUIConfig()
        setupAddSubView()
        layout()
    }
    
    private func setupUIConfig() {
        searchButton.addTarget(self, action: #selector(onSearchButtonTapped), for: .touchUpInside)
        searchInput.addTarget(self, action: #selector(onSearchInputTextChange), for: .editingChanged)
    }
    
    private func uiDebugConfig(){
        backgroundColor = .lightGray
        searchButton.backgroundColor = .red
        searchInput.backgroundColor = .systemBlue
    }
    
    private func setupAddSubView() {
        addSubview(contentStack)
        contentStack.addArrangedSubview(searchButton)
        contentStack.addArrangedSubview(searchInput)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            contentStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            contentStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            contentStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            contentStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
    }
    
    @objc func onSearchButtonTapped() {
        self.buttonSearchAction()
    }
    
    @objc func onSearchInputTextChange(_ textField: UITextField) {
        self.input = textField.text ?? String()
        self.onInputChangeAction()
    }
    
}

#if DEBUG
import SwiftUI
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        UIViewPreviewWrapper {
            SearchBar()
        }
        .previewLayout(.fixed(width: 358, height: 57))
    }
}
#endif
