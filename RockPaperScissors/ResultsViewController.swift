//
//  ResultViewController.swift
//  RockPaperScissors
//
//  Created by Marwin Wiechert on 20.01.18.
//  Copyright © 2018 Marwin Wiechert. All rights reserved.
//

import UIKit


class ResultsViewController: UIViewController {
    
    var headingText: String?
    var image: UIImage?
    
    @IBOutlet weak var lbl_Heading: UILabel!
    @IBOutlet weak var imgV_result: UIImageView!
    
    
    @IBAction func actPlayAgain(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl_Heading.text = headingText
        imgV_result.image = image
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
