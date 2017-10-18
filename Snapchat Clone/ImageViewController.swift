//
//  ImageViewController.swift
//  Snapchat Clone
//
//  Created by Yichen Sun on 10/17/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var pic: UIImageView!
    var newImage: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        pic.image = newImage

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}