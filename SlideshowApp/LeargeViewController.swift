//
//  LeargeViewController.swift
//  SlideshowApp
//
//  Created by 田中孝明 on 2021/02/28.
//

import UIKit

class LeargeViewController: UIViewController {
    
    var nowIndex = 0
    
    var imageArray:[UIImage] = []

    @IBOutlet weak var LeargeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        LeargeImage.image = imageArray[nowIndex]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
