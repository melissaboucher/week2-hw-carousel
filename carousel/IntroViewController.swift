//
//  IntroViewController.swift
//  carousel
//
//  Created by Melissa on 5/11/15.
//  Copyright (c) 2015 Melissa Boucher. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    var yOffsets : [Float] = [-280, -250, -420, -400, -510, -490]
    var xOffsets : [Float] = [-75, 35, 8, 85, -115, -100]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        introScrollView.contentSize = imageView.image!.size
        introScrollView.delegate = self
        introScrollView.sendSubviewToBack(imageView)
        
        //set initial positions
        
        
        //setup all tile views
        tile1View.transform = CGAffineTransformMakeTranslation(CGFloat(xOffsets[0]), CGFloat(yOffsets[0]))
        tile1View.transform = CGAffineTransformScale(tile1View.transform, CGFloat(scales[0]), CGFloat(scales[0]))
        tile1View.transform = CGAffineTransformRotate(tile1View.transform, CGFloat(Double(rotations[0])*M_PI/180))
        
        
        tile2View.transform = CGAffineTransformMakeTranslation(CGFloat(xOffsets[1]), CGFloat(yOffsets[1]))
        tile2View.transform = CGAffineTransformScale(tile2View.transform, CGFloat(scales[1]), CGFloat(scales[1]))
        tile2View.transform = CGAffineTransformRotate(tile2View.transform, CGFloat(Double(rotations[1])*M_PI/180))

        tile3View.transform = CGAffineTransformMakeTranslation(CGFloat(xOffsets[2]), CGFloat(yOffsets[2]))
        tile3View.transform = CGAffineTransformScale(tile3View.transform, CGFloat(scales[2]), CGFloat(scales[2]))
        tile3View.transform = CGAffineTransformRotate(tile3View.transform, CGFloat(Double(rotations[2])*M_PI/180))

        tile4View.transform = CGAffineTransformMakeTranslation(CGFloat(xOffsets[3]), CGFloat(yOffsets[3]))
        tile4View.transform = CGAffineTransformScale(tile4View.transform, CGFloat(scales[3]), CGFloat(scales[3]))
        tile4View.transform = CGAffineTransformRotate(tile4View.transform, CGFloat(Double(rotations[3])*M_PI/180))

        tile5View.transform = CGAffineTransformMakeTranslation(CGFloat(xOffsets[4]), CGFloat(yOffsets[4]))
        tile5View.transform = CGAffineTransformScale(tile5View.transform, CGFloat(scales[4]), CGFloat(scales[4]))
        tile5View.transform = CGAffineTransformRotate(tile5View.transform, CGFloat(Double(rotations[4])*M_PI/180))

        tile6View.transform = CGAffineTransformMakeTranslation(CGFloat(xOffsets[5]), CGFloat(yOffsets[5]))
        tile6View.transform = CGAffineTransformScale(tile6View.transform, CGFloat(scales[5]), CGFloat(scales[5]))
        tile6View.transform = CGAffineTransformRotate(tile6View.transform, CGFloat(Double(rotations[5])*M_PI/180))

        
    }
    
    
    
    
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max-r2Min)/(r1Max-r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offset = Float(scrollView.contentOffset.y)
//        println("content offset: \(scrollView.contentOffset.y)")
        
        //tile1
        var tx1 = convertValue(offset, r1Min:0, r1Max:568, r2Min:xOffsets[0], r2Max:0)
        var ty1 = convertValue(offset, r1Min:0, r1Max:568, r2Min: yOffsets[0], r2Max:0)
        
        var scale1 = convertValue(offset, r1Min:0, r1Max:568, r2Min: scales[0], r2Max:1)
        var rotation1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[0], r2Max: 0)
        
        tile1View.transform = CGAffineTransformMakeTranslation(CGFloat(tx1), CGFloat(ty1))
        tile1View.transform = CGAffineTransformScale(tile1View.transform, CGFloat(scale1), CGFloat(scale1))
        tile1View.transform = CGAffineTransformRotate(tile1View.transform, CGFloat(Double(rotation1)*M_PI/180))
        
        //tile2
        var tx2 = convertValue(offset, r1Min:0, r1Max:568, r2Min:xOffsets[1], r2Max:0)
        var ty2 = convertValue(offset, r1Min:0, r1Max:568, r2Min: yOffsets[1], r2Max:0)
        
        var scale2 = convertValue(offset, r1Min:0, r1Max:568, r2Min: scales[1], r2Max:1)
        var rotation2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[1], r2Max: 0)
        
        tile2View.transform = CGAffineTransformMakeTranslation(CGFloat(tx2), CGFloat(ty2))
        tile2View.transform = CGAffineTransformScale(tile2View.transform, CGFloat(scale2), CGFloat(scale2))
        tile2View.transform = CGAffineTransformRotate(tile2View.transform, CGFloat(Double(rotation2)*M_PI/180))
        
        //tile3
        var tx3 = convertValue(offset, r1Min:0, r1Max:568, r2Min:xOffsets[2], r2Max:0)
        var ty3 = convertValue(offset, r1Min:0, r1Max:568, r2Min: yOffsets[2], r2Max:0)
        
        var scale3 = convertValue(offset, r1Min:0, r1Max:568, r2Min: scales[2], r2Max:1)
        var rotation3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[2], r2Max: 0)
        
        tile3View.transform = CGAffineTransformMakeTranslation(CGFloat(tx3), CGFloat(ty3))
        tile3View.transform = CGAffineTransformScale(tile3View.transform, CGFloat(scale3), CGFloat(scale3))
        tile3View.transform = CGAffineTransformRotate(tile3View.transform, CGFloat(Double(rotation3)*M_PI/180))
        
        //tile4
        var tx4 = convertValue(offset, r1Min:0, r1Max:568, r2Min:xOffsets[3], r2Max:0)
        var ty4 = convertValue(offset, r1Min:0, r1Max:568, r2Min: yOffsets[3], r2Max:0)
        
        var scale4 = convertValue(offset, r1Min:0, r1Max:568, r2Min: scales[3], r2Max:1)
        var rotation4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[3], r2Max: 0)
        
        tile4View.transform = CGAffineTransformMakeTranslation(CGFloat(tx4), CGFloat(ty4))
        tile4View.transform = CGAffineTransformScale(tile4View.transform, CGFloat(scale4), CGFloat(scale4))
        tile4View.transform = CGAffineTransformRotate(tile4View.transform, CGFloat(Double(rotation4)*M_PI/180))

        
        //tile5
        var tx5 = convertValue(offset, r1Min:0, r1Max:568, r2Min:xOffsets[4], r2Max:0)
        var ty5 = convertValue(offset, r1Min:0, r1Max:568, r2Min: yOffsets[4], r2Max:0)
        
        var scale5 = convertValue(offset, r1Min:0, r1Max:568, r2Min: scales[4], r2Max:1)
        var rotation5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[4], r2Max: 0)
        
        tile5View.transform = CGAffineTransformMakeTranslation(CGFloat(tx5), CGFloat(ty5))
        tile5View.transform = CGAffineTransformScale(tile5View.transform, CGFloat(scale5), CGFloat(scale5))
        tile5View.transform = CGAffineTransformRotate(tile5View.transform, CGFloat(Double(rotation5)*M_PI/180))

        
        //tile6
        var tx6 = convertValue(offset, r1Min:0, r1Max:568, r2Min:xOffsets[5], r2Max:0)
        var ty6 = convertValue(offset, r1Min:0, r1Max:568, r2Min: yOffsets[5], r2Max:0)
        
        var scale6 = convertValue(offset, r1Min:0, r1Max:568, r2Min: scales[5], r2Max:1)
        var rotation6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[5], r2Max: 0)
        
        tile6View.transform = CGAffineTransformMakeTranslation(CGFloat(tx6), CGFloat(ty6))
        tile6View.transform = CGAffineTransformScale(tile6View.transform, CGFloat(scale6), CGFloat(scale6))
        tile6View.transform = CGAffineTransformRotate(tile6View.transform, CGFloat(Double(rotation6)*M_PI/180))
    
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
