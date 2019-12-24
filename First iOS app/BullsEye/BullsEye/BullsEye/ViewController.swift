//
//  ViewController.swift
//  BullsEye
//
//  Created by Catalina on 12/24/19.
//  Copyright © 2019 Catalina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var current_value: Int = 0
    var target_val: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var target_label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let rounded_val = slider.value.rounded()
        current_value = Int(rounded_val)
        // Do any additional setup after loading the view.
        start_new_round()
    }

    @IBAction func show_alert(){
        
        let message = "The Value of the slider is now been set on: \(current_value)" +
        "\nThe target Value is: \(target_val)"
        
        let alert = UIAlertController(title: "Hello world", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Go!", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        start_new_round()
    }
    
    @IBAction func slider_moved(_ slider: UISlider){
        let rounded_val = slider.value.rounded()
        current_value = Int(rounded_val)
    }
    
    func start_new_round() {
        target_val = Int.random(in: 1...100)
        current_value = 50
        slider.value = Float(current_value)
        update_labels()
    }
    
    func update_labels(){
        target_label.text = String(target_val)
    }
    
}

