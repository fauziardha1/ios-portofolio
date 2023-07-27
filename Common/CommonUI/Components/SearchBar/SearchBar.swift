//
//  SearchBar.swift
//  CommonUI
//
//  Created by Fauzi Arda on 27/07/23.
//

import Foundation
import UIKit

public class SearchBar: UIView {
    
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
//        tempConfig()
        layer.cornerRadius = 57/2
        clipsToBounds = true
        
        setupAddSubView()
        layout()
    }
    
    private func tempConfig(){
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
}


import SwiftUI
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        UIViewPreviewWrapper {
            SearchBar()
        }
        .previewLayout(.fixed(width: 358, height: 57))
    }
}
