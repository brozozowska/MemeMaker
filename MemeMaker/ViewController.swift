//
//  ViewController.swift
//  MemeMaker
//
//  Created by Сергей Розов on 11.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    @IBAction func controlChanged(_ sender: Any) {
        updateLabels()
    }
        
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            topCaptionLabel.center = sender.location(in: view)
        }
    }
    
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            bottomCaptionLabel.center = sender.location(in: view)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topSegmentedControl.removeAllSegments()
        for choise in topChoises {
            topSegmentedControl.insertSegment(withTitle: choise.emoji, at: topChoises.count, animated: false)
            topSegmentedControl.selectedSegmentIndex = 0
        }
        
        bottomSegmentedControl.removeAllSegments()
        for choise in bottomChoises {
            bottomSegmentedControl.insertSegment(withTitle: choise.emoji, at: bottomChoises.count, animated: false)
            bottomSegmentedControl.selectedSegmentIndex = 0
        }
        
        updateLabels()
    }
    
    let topChoises = [
        CaptionOption(emoji: "🕶️", caption: "You know what's cool?"),
        CaptionOption(emoji: "💥", caption: "You know what makes me mad?"),
        CaptionOption(emoji: "💕", caption: "You know what I love?")
    ]
    
    let bottomChoises = [
        CaptionOption(emoji: "🐈", caption: "Cats wearing hats"),
        CaptionOption(emoji: "🐕", caption: "Dogs carrying logs"),
        CaptionOption(emoji: "🐒", caption: "Monkeys being funky")
    ]
    
    func updateLabels() {
        let topIndex = topSegmentedControl.selectedSegmentIndex
        topCaptionLabel.text = topChoises[topIndex].caption
        
        let bottomIndex = bottomSegmentedControl.selectedSegmentIndex
        bottomCaptionLabel.text = bottomChoises[bottomIndex].caption
    }
}

