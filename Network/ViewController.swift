//
//  ViewController.swift
//  Network
//
//  Created by 이치원 on 2020/06/04.
//  Copyright © 2020 richone. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func send(_ sender: Any) {
        
        requestSignIn()
    }
    
    
    func requestSignIn(){
        //회원가입 post
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {
            (data: Data?, response : URLResponse?, error : Error?)
            in guard error == nil && data != nil else{
                if let err = error{
                    print(err.localizedDescription)
                }
                return
            }
            
            //data 가져오기
            if let _data = data {
                if let strData = NSString(data : _data, encoding: String.Encoding.utf8.rawValue){
                    let str = String(strData)
                    print(str)
                    DispatchQueue.main.async {
                        print(str)
                    }
                }
            }else{
                print("data nil")
            }
        })
        task.resume()
        
        
    }
    
}
