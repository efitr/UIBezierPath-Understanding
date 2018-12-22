//
//  ViewController.swift
//  UIBezierPath
//
//  Created by Egon Fiedler on 12/21/18.
//  Copyright © 2018 App Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    // This function will appear if it's true
    override func viewDidAppear(_ animated: Bool) {
        //What exactly is this doing?
        super.viewDidAppear(animated)
        
        let width: CGFloat = 240.0
        let height: CGFloat = 160.0
        
        let demoView = DemoView(frame: CGRect(x: self.view.frame.size.width/2 - width/2,
                                              y: self.view.frame.size.height/2 - height/2,
                                              width: width,
                                              height: height))
        //
        self.view.addSubview(demoView)
    }
    

}

