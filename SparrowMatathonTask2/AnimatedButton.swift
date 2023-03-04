//
//  AnimatedButton.swift
//  SparrowMatathonTask2
//
//  Created by Dmitriy Shrayber on 04.03.2023.
//

import UIKit

open class AnimatedButton: UIButton {
    
    private var title: String?
    private var action: Selector?
    private var imageName: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    init(title: String, action: Selector?, image: String) {
        super.init(frame: .zero)
        self.action = action
        self.imageName = image
        self.title = title
        setupButton()
    }
    
    open override func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
     
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            super.sendAction(action, to: target, for: event)
        }
    }
    
    func setupButton() {
        var configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .medium
        configuration.baseForegroundColor = UIColor.white
        configuration.title = self.title
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        configuration.image = UIImage(systemName: imageName ?? "file")
        configuration.imagePadding = 8
        configuration.imagePlacement = .trailing
        self.configuration = configuration
        self.addTarget(self, action: #selector(scaleDown), for: .touchDown)
        self.addTarget(self, action: #selector(scaleBack), for: [.touchUpOutside, .touchCancel, .touchUpInside])
        self.addTarget(superview, action: action ?? #selector(voidFunc), for: .touchUpInside)
    }
    
    @objc func scaleDown() {
        UIView.animate(withDuration: 0.25, delay: 0, options: .allowUserInteraction) {
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        } completion: { _ in }
    }
    
    @objc func scaleBack() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .allowUserInteraction) {
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
        } completion: { _ in }
    }
    @objc func voidFunc() {}
   
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
