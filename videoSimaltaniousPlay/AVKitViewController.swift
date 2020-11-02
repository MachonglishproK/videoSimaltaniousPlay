//
//  AVKitViewController.swift
//  videoSimaltaniousPlay
//
//  Created by 伊藤走 on 11/1/20.
//

import UIKit
import AVKit
import MobileCoreServices

class AVKitViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet var viewA: UIView!
    @IBOutlet var viewB: UIView!
    
    
    
    
    var vcPlayerA : AVPlayerViewController?
    var vcPlayerB : AVPlayerViewController?
    var rateA: Float = 1.0
    var rateB: Float = 1.0
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sliderA(_ sender: UISlider) {
        guard vcPlayerA != nil else { return }
        rateA = Float(sender.value)
        vcPlayerA?.player!.rate = rateA
        
    }
    @IBAction func sliderB(_ sender: UISlider) {
        guard vcPlayerB != nil else { return }
        rateB = Float(sender.value)
        vcPlayerB?.player!.rate = rateB
    }
    
    
    @IBAction func saveVideoA(_ sender: UIButton) {
        index = sender.tag
        VideoHelper.startMediaBrowser(delegate: self, sourceType: .savedPhotosAlbum)
    }
    
    @IBAction func playVideoA(_ sender: UIButton) {
        guard vcPlayerA != nil else { return }
        self.vcPlayerA?.player?.play()
    }
    
    @IBAction func stopVideoA(_ sender: UIButton) {
        guard vcPlayerA != nil else { return }
        self.vcPlayerA?.player?.pause()
        
    }
    
    @IBAction func saveVideoB(_ sender: UIButton) {
        index = sender.tag
        VideoHelper.startMediaBrowser(delegate: self, sourceType: .savedPhotosAlbum)
    }
    @IBAction func playVideoB(_ sender: UIButton) {
        guard vcPlayerB != nil else { return }
        self.vcPlayerB?.player?.play()
    }
    
    @IBAction func stopVideoB(_ sender: UIButton) {
        guard vcPlayerB != nil else { return }
        self.vcPlayerB?.player?.pause()
    }
    
}



// MARK: - UIImagePickerControllerDelegate
extension  AVKitViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        // 1
        guard
            let mediaType = info[UIImagePickerController.InfoKey.mediaType] as? String,
            mediaType == (kUTTypeMovie as String),
            let url = info[UIImagePickerController.InfoKey.mediaURL] as? URL
        else { return }
        
        // 2
        dismiss(animated: true) {
            //3
            
            switch self.index {
            case 1:
                let player = AVPlayer(url: url)
                self.vcPlayerA = AVPlayerViewController()
                self.vcPlayerA?.player = player
                guard self.vcPlayerA != nil else {return }
                self.vcPlayerA?.videoGravity = AVLayerVideoGravity.resizeAspectFill
                self.vcPlayerA?.view.frame = self.viewA.bounds
                self.viewA.addSubview((self.vcPlayerA?.view)!)
                
            case 4:
                let player = AVPlayer(url: url)
                self.vcPlayerB = AVPlayerViewController()
                guard self.vcPlayerB != nil else {return }
                self.vcPlayerB?.player = player
                self.vcPlayerB?.videoGravity = AVLayerVideoGravity.resizeAspectFill
                self.vcPlayerB?.view.frame = self.viewB.bounds
                self.viewB.addSubview((self.vcPlayerB?.view)!)
                
            default: break
            }
        }
    }
}
