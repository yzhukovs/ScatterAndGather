//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Yvette Zhukovsky on 11/14/18.
//  Copyright © 2018 Yvette Zhukovsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var labels: [UILabel] {
        return [letter1, letter2, letter3, letter4, letter5, letter6]
    }

    var shouldScramble: Bool = true
    let colors = [UIColor.red, UIColor.green, UIColor.orange, UIColor.cyan, UIColor.yellow,  UIColor.blue ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }
    
    
    private func gathered(){
        UIView.animate(withDuration: 2) {
            self.logoImage.alpha = 1
            for label in self.labels {
                label.transform = .identity
                label.layer.backgroundColor = UIColor.clear.cgColor
                label.textColor = UIColor.black
                
                
            }
            self.shouldScramble = true
        }
        
        
    }
    
    private func randomMove(label: UILabel) -> CGAffineTransform  {
        
        let labelsWidth = label.frame.width
        let labelHeight = label.frame.height
        let viewWidth =  view.superview!.bounds.width
        let viewHeight = view.superview!.bounds.height
        let Xwidth = viewWidth - labelsWidth
        let Ywidth = viewHeight - labelHeight
        let xOffset = CGFloat(arc4random_uniform(UInt32(Xwidth)/2))
        let yOffset = CGFloat(arc4random_uniform(UInt32(Ywidth)/2))
        return CGAffineTransform(translationX: xOffset, y: yOffset).rotated(by: (CGFloat(arc4random_uniform(360)))).scaledBy(x: 1.6, y: 1.6)
        
    }
    
    
    
    private func scattered(){
        UIView.animate(withDuration: 3.0) {
            self.logoImage.alpha = 0
            for label in self.labels {
                let index = Int(arc4random_uniform(UInt32(self.colors.count)))
                label.textColor = self.colors[index]
                let background = Int(arc4random_uniform(UInt32(self.colors.count)))
                label.layer.backgroundColor = self.colors[background].cgColor
                label.transform = self.randomMove(label: label)
            }
            self.shouldScramble = false
        }
        
    }
    
    
    
    
    
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var letter1: UILabel!
    @IBOutlet weak var letter2: UILabel!
    @IBOutlet weak var letter3: UILabel!
    @IBOutlet weak var letter4: UILabel!
    @IBOutlet weak var letter5: UILabel!
    @IBOutlet weak var letter6: UILabel!
    
    
    
    
    
    @IBAction func toggle(_ sender: Any) {
        if shouldScramble == true {
            scattered()
            
        }else {
            gathered()
            
        }
        
    }
    
}

