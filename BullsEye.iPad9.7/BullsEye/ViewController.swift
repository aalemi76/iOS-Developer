//
//  ViewController.swift
//  BullsEye
//
//  Created by Catalina on 12/24/19.
//  Copyright © 2019 Catalina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var current_value = 0
    var target_val = 0
    var scores = 0
    var rounds = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var target_label: UILabel!
    @IBOutlet weak var scores_label: UILabel!
    @IBOutlet weak var round_label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let rounded_val = slider.value.rounded()
        current_value = Int(rounded_val)
        // Do any additional setup after loading the view.
        start_over()
        
        //let thumb_image_normal = UIImage(named: "SliderThumb-Normal")!
        let thumb_image_normal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumb_image_normal, for: .normal)
        
        let thumb_image_highlited = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumb_image_highlited, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let track_left_image = #imageLiteral(resourceName: "SliderTrackLeft")
        let track_left_resizable = track_left_image.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(track_left_resizable, for: .normal)
        
        let track_right_image = #imageLiteral(resourceName: "SmallButton")
        let track_right_resizable = track_right_image.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(track_right_resizable, for: .normal)
    }

    @IBAction func show_alert(){
        
        let diff = abs(current_value - target_val)
        var points = 100 - diff
        scores += points
        
        let title: String
        if diff == 0 {
            title = "Perfect!"
            points += 100
        } else if diff < 5 {
            title = "You almost had it"
            if diff == 1 {
                points += 50
            }
        } else if diff < 10 {
            title = "Well don! Try harder!"
        } else {
            title = "Not even close!"
        }
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Go!", style: .default, handler: {
            action in
            self.start_new_round()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func slider_moved(_ slider: UISlider){
        let rounded_val = slider.value.rounded()
        current_value = Int(rounded_val)
    }
    
    @IBAction func start_over (){
        scores = 0
        rounds = 0
        start_new_round()
    }
    
    func start_new_round() {
        rounds += 1
        target_val = Int.random(in: 1...100)
        current_value = 50
        slider.value = Float(current_value)
        update_labels()
    }
    
    func update_labels(){
        target_label.text = String(target_val)
        scores_label.text = String(scores)
        round_label.text = String(rounds)
    }
    
}

