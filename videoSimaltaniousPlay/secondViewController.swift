//
//  secondViewController.swift
//  videoSimaltaniousPlay
//
//  Created by 伊藤走 on 10/31/20.
//

import UIKit
import WebKit

class secondViewController: UIViewController,  WKUIDelegate, WKNavigationDelegate  {


    @IBOutlet var videoB: WKWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayVideoB()
    }
    
    private func displayVideoB(){
        videoB .uiDelegate = self
        videoB.navigationDelegate = self
        if let videoURL:URL = URL(string: "https://www.youtube.com/embed/qOiDlprXF2w?playsinline=1") {
            print("videoUrl:\(videoURL)")
            let request:URLRequest = URLRequest(url: videoURL)
            videoB.load(request)
        }
    }

}
