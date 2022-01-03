//
//  combatGame.swift
//  KidsLogic
//
//  Created by sara saud on 04/05/1443 AH.
//


import WebKit
class codecombat: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://codecombat.com/play")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}
