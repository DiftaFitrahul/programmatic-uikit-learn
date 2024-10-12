//
//  GFButton.swift
//  GithubAppUIKIT
//
//  Created by MacBook Difta on 10/10/24.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        // Custom Code Here
        configure()
    }
    
    required init?(coder: NSCoder) {
        // It is for storyBoard
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String){
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
        
    }
    
    private func configure(){
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        titleLabel?.font = .preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false // using AutoLayout
    }
    
}
