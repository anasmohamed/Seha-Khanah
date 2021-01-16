//
//  LogoutSliderViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/15/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import ImageSlideshow

class LogoutSliderViewController: UIViewController {
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var textSlideShow: ImageSlideshow!
    @IBOutlet weak var bookNowBtn: UIButton!
    @IBOutlet weak var sliderImageVIew: ImageSlideshow!
    let localSource = [BundleImageSource(imageString: "slider_2"), BundleImageSource(imageString: "slider_3"), BundleImageSource(imageString: "slider_4")]
    let localSourceText = [BundleImageSource(imageString: "second"), BundleImageSource(imageString: "third"), BundleImageSource(imageString: "first")]
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.layer.cornerRadius = 10
        loginBtn.layer.borderColor = UIColor.blue.cgColor
        loginBtn.layer.borderWidth = 2
        
        bookNowBtn.layer.cornerRadius = 10
        sliderImageVIew.slideshowInterval = 5.0
        sliderImageVIew.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        sliderImageVIew.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        pageControl.pageIndicatorTintColor = UIColor.black
        sliderImageVIew.pageIndicator = pageControl
        
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        sliderImageVIew.activityIndicator = DefaultActivityIndicator()
        sliderImageVIew.delegate = self
        
        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        sliderImageVIew.setImageInputs(localSource)
        
        
        
        
        
        
        textSlideShow.slideshowInterval = 5.0
        textSlideShow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        textSlideShow.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        
        
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        sliderImageVIew.delegate = self
        
        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        textSlideShow.setImageInputs(localSourceText)
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func bookNowBtnDidTapped(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Search", bundle: nil)
        let tabBarViewController = storyboard.instantiateViewController(withIdentifier: "TabBar")
        tabBarViewController.modalPresentationStyle = .fullScreen
        self.present(tabBarViewController, animated: true, completion: nil)
        
    }
    @IBAction func loginBtnDidTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard.init(name: "Login", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController

        let navigationController = UINavigationController.init(rootViewController: loginViewController)
     
        navigationController.modalPresentationStyle = .fullScreen

        self.present(navigationController, animated: true, completion: nil)
//        self.navigationController?.presentingViewController?.present(loginViewController, animated:true , completion: nil)
//        self.navigationController!.pushViewController(loginViewController, animated: true)
        
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
extension LogoutSliderViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        print("current page:", page)
    }
}
