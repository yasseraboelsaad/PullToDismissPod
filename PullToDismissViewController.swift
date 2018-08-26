//
//  RootViewController.swift
//  Pods-PullToDismissPod_Example
//
//  Created by Yasser Abouel-Saad on 8/26/18.
//

import UIKit

class PullToDismissViewController: UIViewController {

    @IBOutlet var fadingBackgroundView: UIView!
    @IBOutlet var containerView: UIView!
    
    
    @IBInspectable var minimumVelocityToHide = 1500 as CGFloat
    @IBInspectable var minimumScreenRatioToHide = 0.5 as CGFloat
    @IBInspectable var animationDuration = 0.2 as TimeInterval
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)   {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overFullScreen;
        self.modalTransitionStyle = .coverVertical;
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.modalPresentationStyle = .overFullScreen;
        self.modalTransitionStyle = .coverVertical;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.fadingBackgroundView.alpha = 0.8

        // Listen for pan gesture
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        self.containerView.addGestureRecognizer(panGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    func slideViewVerticallyTo(_ y: CGFloat) {
        self.containerView.frame.origin = CGPoint(x: self.containerView.frame.minX, y: y)
    }
    
    @objc func onPan(_ panGesture: UIPanGestureRecognizer) {
        switch panGesture.state {
        case .began, .changed:
            // If pan started or is ongoing then
            // slide the view to follow the finger
            let translation = panGesture.translation(in: self.containerView)
            let y = max(60, translation.y)
            print("minY, ",self.containerView.frame.minY)
            print("translation Y, ",translation.y)
            print("alpha" , 0.8 - y/UIScreen.main.bounds.height)
            print("y" , y)
            
            self.fadingBackgroundView.alpha = 0.8 - y/UIScreen.main.bounds.height
            self.slideViewVerticallyTo(y)
            break
        case .ended:
            // If pan ended, decide it we should close or reset the view
            // based on the final position and the speed of the gesture
            let translation = panGesture.translation(in: containerView)
            let velocity = panGesture.velocity(in: containerView)
            let closing = (translation.y > self.containerView.frame.size.height * minimumScreenRatioToHide) ||
                (velocity.y > minimumVelocityToHide)
            
            if closing {
                UIView.animate(withDuration: animationDuration, animations: {
                    // If closing, animate to the bottom of the view
                    self.slideViewVerticallyTo(self.containerView.frame.size.height)
                }, completion: { (isCompleted) in
                    if isCompleted {
                        // Dismiss the view when it dissapeared
                        self.fadingBackgroundView.alpha = 0
                        self.dismiss(animated: false, completion: nil)
                    }
                })
            } else {
                // If not closing, reset the view to the top
                UIView.animate(withDuration: animationDuration, animations: {
                    self.slideViewVerticallyTo(60)
                    
                })
                self.fadingBackgroundView.alpha = 0.8
            }
            
            break
        default:
            // If gesture state is undefined, reset the view to the top
            UIView.animate(withDuration: animationDuration, animations: {
                self.slideViewVerticallyTo(60)
            })
            break
        }
    }
    
    func dismissRootViewController() {
        self.fadingBackgroundView.alpha = 0.0
        dismiss(animated: true, completion: nil)
    }

}
