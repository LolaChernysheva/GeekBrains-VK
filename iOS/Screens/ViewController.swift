//
//  ViewController.swift
//  iOS
//
//  Created by Лолита Чернышева on 30/11/2019.
//  Copyright © 2019 Лолита Чернышева. All rights reserved.
//

import UIKit
import WebKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var webview: WKWebView!
    {
        didSet{
            webview.navigationDelegate = self
        }
    }

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func pressButton(_ sender: Any) {
        guard let loginInput = login.text,
            let passwordInput = password.text   else {
            return
        }
        if loginInput == "admin" && passwordInput == "0000" {
            print("успешная авторизация")
        } else {
            print("введены неверные логин или пароль")
        }
        
    }
    override func viewDidLoad() {

        super.viewDidLoad()
        testAnimation()
        let hideAction = UITapGestureRecognizer (target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(hideAction)
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7464836"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "9374537"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        webview.load(request)
    }
    
    @objc func hideKeyboard() {
            view.endEditing(true)
    }
    
    func testAnimation () {
        UIView.animate(withDuration: 1.0,
                       delay: 1.0,
                       options: [.repeat, .autoreverse],
                       animations: {
                        self.login.transform = CGAffineTransform (scaleX: 1.1, y: 1.1)
        })
    }


}
extension ViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
            }
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        let token = params["access_token"]
        
      Session.shared.token = token ?? ""
        print(token)
        VKApi.getUserGroups()
        decisionHandler(.cancel)
    }
}
