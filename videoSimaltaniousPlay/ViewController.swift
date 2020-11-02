//
//  ViewController.swift
//  videoSimaltaniousPlay
//
//  Created by 伊藤走 on 10/31/20.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet var videoA: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        displayVideoA()
    }
    
    
    @IBAction func nextPageBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "nextView", sender: nil)
    }
}

extension ViewController:WKUIDelegate, WKNavigationDelegate{
    
    private func displayVideoA(){
        videoA.uiDelegate = self
        videoA.navigationDelegate = self
        
        if let videoURL:URL = URL(string: "https://www.youtube.com/embed/qOiDlprXF2w?playsinline=1") {
            print("videoUrl:\(videoURL)")
            let request:URLRequest = URLRequest(url: videoURL)
            videoA.load(request)
        }
    }
    



}

