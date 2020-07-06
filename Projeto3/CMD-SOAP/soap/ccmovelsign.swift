//
//  ccmovelsign.swift
//  soap
//
//  Created by João Macedo on 06/07/2020.
//  Copyright © 2020 João Macedo. All rights reserved.
//

import Foundation


class Ccmovelsign : NSObject, XMLParserDelegate{
    
    static let shared = Ccmovelsign()
    var session = URLSession.shared
    
    
    
    func ccmovelsign(num: String,appid: String, pin: String,  callback: @escaping ( _ data: String)-> Void){
        
        
        let urll = "https://cmd.autenticacao.gov.pt/Ama.Authentication.Frontend/CCMovelDigitalSignature.svc"
        let url = URL(string: urll)
        
        let header = [ "content-type": "text/xml", "SOAPAction": "http://Ama.Authentication.Service/CCMovelSignature/GetCertificate"]
        
        let param = "<?xml version='1.0' encoding='UTF-8'?><s11:Envelope xmlns:s11='http://schemas.xmlsoap.org/soap/envelope/'xmlns:ns1='http://Ama.Authentication.Service/'><s11:Body><ns1:CCMovelSign><ns1:request xmlns:ns2='http://schemas.datacontract.org/2004/07/Ama.Structures.CCMovelSignature'><ns2:ApplicationId>"+appid+"</ns2:ApplicationId><ns2:DocName>PADESTESTER</ns2:DocName><ns2:Hash>\"SHA256\"</ns2:Hash><ns2:Pin>"+pin+"</ns2:Pin><ns2:UserId>"+num+"</ns2:UserId></ns1:request></ns1:CCMovelSign></s11:Body></s11:Envelope>"

        var request = URLRequest(url: url!)
        request.allHTTPHeaderFields = header
        request.httpMethod = "POST"
        request.httpBody = param.data(using: .utf8)
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        let task = session.dataTask(with: request) {(data,response,error) in
            DispatchQueue.main.async{
                if error != nil{
                    callback(error?.localizedDescription ?? "try again")
                }
                else{
                    if data != nil{
                        if let data_str = String(data: data!, encoding: .utf8){
                            callback(data_str)
                        }
                        else{
                            callback("try again")
                        }
                    }
                    else{
                        callback("try again")
                    }
                }
            }
        }
        task.resume()
    }
}
