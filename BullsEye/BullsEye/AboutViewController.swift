//
//  AboutViewController.swift
//  BullsEye
//
//  Created by didAR on 12/25/19.
//  Copyright © 2019 Catalina. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var web_view: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            web_view.load(request)
            
        }
            
        
        
    }
    
    @IBAction func close (){
        dismiss(animated: true, completion: nil)
    }

}
