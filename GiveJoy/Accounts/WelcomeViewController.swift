//
//  ViewController.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 08/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.delegate = self
        }
    }
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var theBestWayLabel: UILabel!
    @IBOutlet weak var nextButton: CustomButton!
    var offSet: CGFloat = 0
    var slides:[WelcomeSlide] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.setBackGroundColor(color: UIColor(hexString: "#31156C"))
        self.offSet = 0
               _ = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func autoScroll() {
        let totalPossibleOffset = CGFloat(slides.count-1) * self.view.bounds.size.width
        if offSet == totalPossibleOffset {
            offSet = 0 // come back to the first image after the last image
        }
        else {
        offSet += self.view.bounds.size.width
        }
        DispatchQueue.main.async() {
            UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
                self.scrollView.contentOffset.x = CGFloat(self.offSet)
            }, completion: nil)
        }
    }
    func createSlides() -> [WelcomeSlide] {
        
        let slide1:WelcomeSlide = Bundle.main.loadNibNamed("WelcomeSlide", owner: self, options: nil)?.first as! WelcomeSlide
        slide1.imageView.image = UIImage(named: "tutorial_2")
       

        
        let slide2:WelcomeSlide = Bundle.main.loadNibNamed("WelcomeSlide", owner: self, options: nil)?.first as! WelcomeSlide
        slide2.imageView.image = UIImage(named: "images")
         
        let slide3:WelcomeSlide = Bundle.main.loadNibNamed("WelcomeSlide", owner: self, options: nil)?.first as! WelcomeSlide
        slide3.imageView.image = UIImage(named: "tutorial_2")
        

        let slide4:WelcomeSlide = Bundle.main.loadNibNamed("WelcomeSlide", owner: self, options: nil)?.first as! WelcomeSlide
        slide4.imageView.image = UIImage(named: "images")

//
//        let slide5:WelcomeSlide = Bundle.main.loadNibNamed("WelcomeSlide", owner: self, options: nil)?.first as! WelcomeSlide
//        slide5.imageView.image = UIImage(named: "tutorial_2")
       
        
        
//        return [slide1, slide2, slide3, slide4, slide5]
        return [slide1, slide2, slide3, slide4]
    }
    
    
    func setupSlideScrollView(slides : [WelcomeSlide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    
    /*
     * default function called when view is scolled. In order to enable callback
     * when scrollview is scrolled, the below code needs to be called:
     * slideScrollView.delegate = self or
     */
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        
        
        var width = Int(scrollView.frame.width)
        var page = pageControl.currentPage
        if scrollView.contentOffset.x>0 {
            scrollView.contentOffset.x = CGFloat(0  + (width * page))
        }

        
        
        /*
         * below code changes the background color of view on paging the scrollview
         */
        //        self.scrollView(scrollView, didScrollToPercentageOffset: percentageHorizontalOffset)
        
        
        /*
         * below code scales the imageview on paging the scrollview
         */
//        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
//
//        if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
//
//            slides[0].imageView.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
//            slides[1].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
//
//        } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
//            slides[1].imageView.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
//            slides[2].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
//
//        } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
//            slides[2].imageView.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
//            slides[3].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.75, y: percentOffset.x/0.75)
//
//        } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
//            slides[3].imageView.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
//            slides[4].imageView.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
//        }
    }
    
    
    
    
    func scrollView(_ scrollView: UIScrollView, didScrollToPercentageOffset percentageHorizontalOffset: CGFloat) {
        if(pageControl.currentPage == 0) {
            //Change background color to toRed: 103/255, fromGreen: 58/255, fromBlue: 183/255, fromAlpha: 1
            //Change pageControl selected color to toRed: 103/255, toGreen: 58/255, toBlue: 183/255, fromAlpha: 0.2
            //Change pageControl unselected color to toRed: 255/255, toGreen: 255/255, toBlue: 255/255, fromAlpha: 1
            
            let pageUnselectedColor: UIColor = fade(fromRed: 255/255, fromGreen: 255/255, fromBlue: 255/255, fromAlpha: 1, toRed: 103/255, toGreen: 58/255, toBlue: 183/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
            pageControl.pageIndicatorTintColor = pageUnselectedColor
            
            
            let bgColor: UIColor = fade(fromRed: 103/255, fromGreen: 58/255, fromBlue: 183/255, fromAlpha: 1, toRed: 255/255, toGreen: 255/255, toBlue: 255/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
            slides[pageControl.currentPage].backgroundColor = bgColor
            
            let pageSelectedColor: UIColor = fade(fromRed: 81/255, fromGreen: 36/255, fromBlue: 152/255, fromAlpha: 1, toRed: 103/255, toGreen: 58/255, toBlue: 183/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
            pageControl.currentPageIndicatorTintColor = pageSelectedColor
        }
    }
    
    
    func fade(fromRed: CGFloat,
              fromGreen: CGFloat,
              fromBlue: CGFloat,
              fromAlpha: CGFloat,
              toRed: CGFloat,
              toGreen: CGFloat,
              toBlue: CGFloat,
              toAlpha: CGFloat,
              withPercentage percentage: CGFloat) -> UIColor {
        
        let red: CGFloat = (toRed - fromRed) * percentage + fromRed
        let green: CGFloat = (toGreen - fromGreen) * percentage + fromGreen
        let blue: CGFloat = (toBlue - fromBlue) * percentage + fromBlue
        let alpha: CGFloat = (toAlpha - fromAlpha) * percentage + fromAlpha
        
        // return the fade colour
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    
    
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
//         let totalPossibleOffset = CGFloat(slides.count-1) * self.view.bounds.size.width
//            if offSet == totalPossibleOffset {
//        //                  offSet = 0 // come back to the first image after the last image
//               self.goToNextPage()
//            }
//            else {
//            offSet += self.view.bounds.size.width
//            }
//            DispatchQueue.main.async() {
//            UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
//            self.scrollView.contentOffset.x = CGFloat(self.offSet)
//
//            }, completion: nil)
//                      }
//            }
//
//            func goToNextPage()
//            {
          let destination = self.storyboard?.instantiateViewController(withIdentifier: "AccountTypeViewController2") as! AccountTypeViewController2
                 self.navigationController?.pushViewController(destination, animated: true)

        }
    
}


