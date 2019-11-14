//
//  ViewController.swift
//  PageControllerDemo
//
//  Created by iPHTech12 on 15/05/2018.
//  Copyright © 2018 iPHTech12. All rights reserved.
//

import UIKit

class AccountTypeViewController2: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!

    @IBOutlet weak var signUpButton: CustomButton!
    @IBOutlet weak var loginButton: CustomButton!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var theBestWayLabel: UILabel!

    var index = 0
    var timer = Timer()


  //  var color = [UIColor.red, UIColor.blue, UIColor.green, UIColor.gray, UIColor.orange, UIColor.systemPink, UIColor.purple, UIColor.yellow]
    var image = ["images","tutorial_2","images","tutorial_2"]
    var infoTextArray = ["The best way to share gifts and donations to your\nfriends. Let's get started", "The best way to share gifts and donations to your\nfriends. Let's get started", "The best way to share gifts and donations to your\nfriends. Let's get started", "The best way to share gifts and donations to your\nfriends. Let's get started"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         loginButton.setBackGroundColor(color: UIColor(hexString: PURPLE_BG))
        
        welcomeLabel.textColor = UIColor.white
        theBestWayLabel.textColor = UIColor.white
        
        signUpButton.layer.cornerRadius = 10.0
        loginButton.layer.cornerRadius = 10.0

        self.signUpButton.setTitleColor(UIColor(hexString: "#31156C"), for: .normal)
        self.loginButton.setTitleColor(.white, for: .normal)
        self.signUpButton.backgroundColor = UIColor(hexString: "#FFB900")
        self.loginButton.backgroundColor = UIColor(hexString: "#7741C9")

        
        configurePageControl()
        
        var swipe = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipe.direction = UISwipeGestureRecognizer.Direction.right
        imageView.addGestureRecognizer(swipe)
        
        swipe = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipe.direction = UISwipeGestureRecognizer.Direction.left
        imageView.addGestureRecognizer(swipe)

        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }


    }
    
        @objc func changeImage(){

            index = index + 1
            
            if index > image.count - 1 {
                index = 0
            }
            let transition:CATransition = CATransition()
                       transition.duration = 0.5
                       transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                       transition.type = CATransitionType.push
                       transition.subtype = CATransitionSubtype.fromRight
                       imageView.layer.add(transition, forKey: kCATransition)
//            imageView.backgroundColor = color[index]
            imageView.image = UIImage(named: image[index])
            self.theBestWayLabel.text = infoTextArray[index]
            pageControl.currentPage = index

    }

    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        self.pageControl.numberOfPages = image.count
        self.pageControl.currentPage = 0
//        self.pageControl.tintColor = UIColor.red
//        self.pageControl.pageIndicatorTintColor = UIColor.black
//        self.pageControl.currentPageIndicatorTintColor = UIColor.green
        self.view.addSubview(pageControl)
        
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizer.Direction.left:
                print("Swip Left")
                index = index + 1
                
                if index > image.count - 1 {
                    index = 0
                }

            case UISwipeGestureRecognizer.Direction.right:
                print("Swip Right")
                index = index - 1
                if index < 0 {
                    index = image.count - 1
                }
                
            default:
                break
            }
            imageView.image = UIImage(named:image[index])
            self.theBestWayLabel.text = infoTextArray[index]

            print(index)
            pageControl.currentPage = index
        }
    }
    
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        let destination = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(destination, animated: true)
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        let destination = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(destination, animated: true)
        
    }

    
}
