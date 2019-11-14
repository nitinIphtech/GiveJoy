//
//  IntroVC.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 09/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.delegate = self
        }
    }
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    
    var slides:[Slide] = [];
    var offSet: CGFloat = 0
    var isFromSetting = false


    override func viewDidLoad() {
        super.viewDidLoad()
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        if(isFromSetting == true)
        {
            nextButton.isHidden = true
            backButton.isHidden = true
            self.navigationController?.navigationBar.isHidden = false
            _ = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
            
        }
        
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
        
        self.scrollView.isDirectionalLockEnabled = true
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func createSlides() -> [Slide] {
            
            let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.imageView.image = UIImage(named: "tutorial_1")
        slide1.labelTitle.text = "Gift Sharing Application"
        slide1.labelDesc.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        slide1.labelTitle.textColor = UIColor(hexString: "#454F63")
        slide1.labelDesc.textColor = UIColor(hexString: "#78849E")

    //
    //        let attributedString = NSMutableAttributedString(string: "Did you know that Winnie the chubby little cubby was based on a real, young bear in London Did you know that Winnie the chubby little cubby was based on a real, young bear in London")
    //
    //        let paragraphStyle = NSMutableParagraphStyle()
    //        paragraphStyle.lineSpacing = 2 // Whatever line spacing you want in points
    //        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
    //        slide1.labelDesc.attributedText = attributedString


            //                label.font = UIFont(name:"fontname", size: 20.0)
            
            
            let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            slide2.imageView.image = UIImage(named: "images")
            slide2.labelTitle.text = "A real-life bear"
            slide2.labelDesc.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
            slide2.labelTitle.textColor = UIColor(hexString: "#454F63")
            slide2.labelDesc.textColor = UIColor(hexString: "#78849E")

            let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            slide3.imageView.image = UIImage(named: "tutorial_2")
            slide3.labelTitle.text = "A Gift Sharing Application"
            slide3.labelDesc.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
            slide3.labelTitle.textColor = UIColor(hexString: "#454F63")
            slide3.labelDesc.textColor = UIColor(hexString: "#78849E")

            let slide4:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            slide4.imageView.image = UIImage(named: "tutorial_1")
            slide4.labelTitle.text = "A real-life bear"
            slide4.labelDesc.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
            slide4.labelTitle.textColor = UIColor(hexString: "#454F63")
            slide4.labelDesc.textColor = UIColor(hexString: "#78849E")

//            let slide5:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
//            slide5.imageView.image = UIImage(named: "tutorial_2")
//            slide5.labelTitle.text = "A real-life bear"
//            slide5.labelDesc.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
//            slide5.labelDesc.textColor = UIColor(hexString: THEME_COLOR)
//            slide5.labelTitle.textColor = UIColor(hexString: "373A44")

//            return [slide1, slide2, slide3, slide4, slide5]
            return [slide1, slide2, slide3, slide4]
        }
    
    
    func setupSlideScrollView(slides : [Slide]) {
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
        //            let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
        //
        //            if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
        //
        //                slides[0].imageView.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
        //                slides[1].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
        //
        //            } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
        //                slides[1].imageView.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
        //                slides[2].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
        //
        //            } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
        //                slides[2].imageView.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
        //                slides[3].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.75, y: percentOffset.x/0.75)
        //
        //            } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
        //                slides[3].imageView.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
        //                slides[4].imageView.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
        //            }
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
        
        let totalPossibleOffset = CGFloat(slides.count-1) * self.view.bounds.size.width
        if offSet == totalPossibleOffset {
            //                  offSet = 0 // come back to the first image after the last image
            self.goToNextPage()
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
    
    func goToNextPage() {
        let destination = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        
        let totalPossibleOffset = CGFloat(slides.count+1) * self.view.bounds.size.width
        if offSet <= totalPossibleOffset {
            offSet = 0// come back to the first image after the last image
        }
        else {
            offSet -= self.view.bounds.size.width
        }
        DispatchQueue.main.async() {
            UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
                self.scrollView.contentOffset.x = CGFloat(self.offSet)
            }, completion: nil)
        }
    }
    
}
