//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 田中孝明 on 2021/02/28.
//

import UIKit

class ViewController: UIViewController {
    
    //画像を配列に格納
    var imageArray:[UIImage] = [
        UIImage(named: "image0")!,
        UIImage(named: "image1")!,
        UIImage(named: "image2")!,
        UIImage(named: "image3")!
    ]
    
    //timerを宣言
    var timer: Timer!
    
    //nowIndexを宣言（何番目の画像か）
    var nowIndex = 0
    
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var nextBotton: UIButton!
    @IBOutlet weak var backBotton: UIButton!
    @IBOutlet weak var slideShowBotton: UIButton!
    
    @IBAction func TapAction(_ sender: Any) {
        if (timer != nil) {
            //スライドショーを停止する
            timer.invalidate()
            timer = nil
            //進む、戻るボタンを有効化する
            nextBotton.isEnabled = true
            backBotton.isEnabled = true
            //停止ボタンを再生ボタンに変化させる
            slideShowBotton.setTitle("再生", for: .normal)
        }
        //セグエを使用して画面を遷移
        performSegue(withIdentifier: "toLearge", sender: nil)
    }
    
    @IBAction func nextBotton(_ sender: Any) {
        nowIndex += 1
        if (nowIndex == imageArray.count) {
            nowIndex = 0
        }
        Image.image = imageArray[nowIndex]
    }
    
    @IBAction func backBotton(_ sender: Any) {
        if (nowIndex == 0) {
            nowIndex = imageArray.count
        }
        nowIndex -= 1
        Image.image = imageArray[nowIndex]
    }
    
    @IBAction func slideShowBotton(_ sender: Any) {
        if (timer == nil) {
            //停止中のときは再生する
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            //進む、戻るボタンを無効化する
            nextBotton.isEnabled = false
            backBotton.isEnabled = false
            //再生ボタンを停止ボタンに変化させる
            slideShowBotton.setTitle("停止", for: .normal)
            
        } else {
            //再生中のときは停止する
            timer.invalidate()
            timer = nil
            //進む、戻るボタンを有効化する
            nextBotton.isEnabled = true
            backBotton.isEnabled = true
            //停止ボタンを再生ボタンに変化させる
            slideShowBotton.setTitle("再生", for: .normal)
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

    
    @objc func changeImage() {
        nowIndex += 1
        
        if (nowIndex == imageArray.count) {
            nowIndex = 0
        }
        
        Image.image = imageArray[nowIndex]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Image.image = imageArray[nowIndex]
        
    }
    
    //LeargeViewControllerに渡す
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        let leargeViewController:LeargeViewController = segue.destination as! LeargeViewController
        leargeViewController.nowIndex = nowIndex
        leargeViewController.imageArray = imageArray
    }


}

