//
//  ViewController.swift
//  ScrollView
//
//  Created by Kristijan Kontus on 01/03/2017.
//  Copyright © 2017 com.kkontus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showCustomScrollViewButton(_ sender: UIButton) {
        let customScrollViewController = CustomScrollViewController()
        let scrollNavigationController = UINavigationController(rootViewController: customScrollViewController)
        self.present(scrollNavigationController, animated: true, completion: nil)
    }
    
}
