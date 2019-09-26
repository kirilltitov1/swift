//
//  ViewController2.swift
//  HW1
//
//  Created by Kirill Titov on 22/09/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit
import WebKit
import Alamofire

class ViewController2: UIViewController {
    
    var session = Session.instance

    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7144201"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
        URLQueryItem(name: "scope", value: "262150"),
        URLQueryItem(name: "response_type", value: "token"),
        URLQueryItem(name: "v", value: "5.68") ]
        let request = URLRequest(url: urlComponents.url!)
        
        webView.load(request)
    }
}


extension ViewController2: WKNavigationDelegate {
    
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment
            
            else {
                decisionHandler(.allow)
                return
            }
        
        let params = fragment
            .components(separatedBy: "&")
            .map{ $0.components(separatedBy: "=") }
            .reduce([String: String] ()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        let token = params["access_token"]
        
        session.token = token!
        
        print(session.token)
        decisionHandler(.cancel)
//        loadNameFriendsList()
//        loadPhotosList()
        loadGroups()
//        loadSearchGroupByQ()
        
        if (!token!.isEmpty) {
            let storyBoard = UIStoryboard(name: "Main", bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "mainScreen")
            self.show(vc, sender: nil)
        }
    }
}


extension ViewController2 {

    func loadNameFriendsList() {
        let METHOD_NAME = "/friends.get"

        let PARAMETERS: Parameters = ["fields": "nickname",
                                      "access_token": session.token,
                                      "v": session.apiVersion
        ]
        
        let url = session.vkURL + session.vkMethod + METHOD_NAME
        
        Alamofire.request(url, method: .get, parameters: PARAMETERS).responseJSON {response in
            print(response.value ?? "")
        }
    }
    
    
    func loadPhotosList() {
        let METHOD_NAME = "/photos.get"
        let PARAMETERS: Parameters = ["extended": "0",
                                     "access_token": session.token,
                                     "v": session.apiVersion,
                                     "album_id": "wall"
        ]
        let url = session.vkURL + session.vkMethod + METHOD_NAME
        Alamofire.request(url, method: .get, parameters: PARAMETERS).responseData {response in
            
            guard let items = response.value else { return }
            
            do {
                let photos = try JSONDecoder().decode(Photo.self, from: items)
                print(photos.response.items[0].sizes[0].url)
            } catch {
                print(error)
            }
        }
    }
    
    
    func loadGroups() {
        let METHOD_NAME = "/groups.get"
        let PARAMETERS: Parameters = ["extended": "0",
                                     "access_token": session.token,
                                     "v": session.apiVersion
        ]
        let url = session.vkURL + session.vkMethod + METHOD_NAME
        Alamofire.request(url, method: .get, parameters: PARAMETERS).responseData {response in
            
            guard let items = response.value else { return }
                
            do {
                let groups = try JSONDecoder().decode(Group.self, from: items)
                print(groups.response.items)
            } catch {
                print(error)
            }
        }
    }
    
    
    func loadSearchGroupByQ() {
        let METHOD_NAME = "/groups.search"
        let PARAMETERS: Parameters = ["q": "Music",
                                      "offset": "3",
                                      "count": "3",
                                      "access_token": session.token,
                                      "v": session.apiVersion
        ]
        let url = session.vkURL + session.vkMethod + METHOD_NAME
        Alamofire.request(url, method: .get, parameters: PARAMETERS).responseJSON {response in
            print(response.value ?? "")
        }
    }
}
