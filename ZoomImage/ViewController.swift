//
//  ViewController.swift
//  ZoomImage
//
//  Created by Son on 2018/06/19.
//  Copyright © 2018 son. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageViewConstraintsBottom: NSLayoutConstraint!
    
    @IBOutlet weak var imageViewConstraintsTop: NSLayoutConstraint!
    
    @IBOutlet weak var imageViewConstraintsTrailing: NSLayoutConstraint!
    
    @IBOutlet weak var imageViewConstraintsLeading: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scollView.minimumZoomScale = 1.0
        scollView.maximumZoomScale = 5.0
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func handlePinch(recognizer: UIPinchGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
            recognizer.scale = 1
        }
    }

    fileprivate func updateMinZoomScaleForSile(_ size: CGSize){
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height
        let minScale = min(widthScale, heightScale)

        scollView.minimumZoomScale = minScale
        scollView.zoomScale = minScale
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateMinZoomScaleForSile(view.bounds.size)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
