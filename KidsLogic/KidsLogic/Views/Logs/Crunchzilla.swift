//
//  Crunchzilla.swift
//  KidsLogic
//
//  Created by sara saud on 05/05/1443 AH.
//

import WebKit
class crunchzilla: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
   
        let myURL = URL(string:"http://crunchzilla.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}



