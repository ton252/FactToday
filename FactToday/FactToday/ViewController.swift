//
//  ViewController.swift
//  FactToday
//
//  Created by Anton Polyakov on 24/07/2018.
//  Copyright © 2018 Anton Polyakov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    private let factModel = FactModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureGestures()
    }
    
    private func configureUI() {
    }
    
    private func configureGestures() {
        let left = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        let right = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        left.direction = .left
        right.direction = .right
        view.addGestureRecognizer(left)
        view.addGestureRecognizer(right)
    }
    
    @objc private func swipeLeft() {
        textView.setText(factModel.newFact, animated: true)
    }
    
    @objc private func swipeRight() {
        textView.setText(factModel.previousFact, animated: true)
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            textView.setText(factModel.newFact, animated: true)
        }
    }

}

extension UITextView {
    
    func setText(_ text: String, animated: Bool = false) {
        
        let fadeIn: () -> () = { [unowned self] in
            self.alpha = 0
        }
        let fadeOut: (Bool) -> () = { [unowned self] _ in
            self.text = text
            UIView.animate(withDuration: 0.5) { [unowned self] in
                self.alpha = 1
            }
        }

        UIView.animate(withDuration: 0.5, animations: fadeIn, completion: fadeOut)
//        UIView.animateKeyframes(withDuration: 8.0, delay: 0, options: [], animations: {
//            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
//                self.alpha = 0
//            })
//            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
//                self.text = text
//                self.alpha = 1
//            })
//        }, completion: nil)

    }
    
}

