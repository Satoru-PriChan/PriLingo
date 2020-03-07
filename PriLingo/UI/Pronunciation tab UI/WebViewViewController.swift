//
//  WebViewViewController.swift
//  PriLingo
//
//  Created by 999-503 on 2020/03/07.
//  Copyright © 2020 SoLaMi Smile. All rights reserved.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    let url: String
    
    init(url: String) {
        self.url = url
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadWebView(url: self.url)

        // Do any additional setup after loading the view.
    }
    
    private func loadWebView(url: String) {
        guard let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let uRL = URL(string: encodedUrl) else { return }
        let request = URLRequest(url: uRL)
        self.webView.load(request)
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
