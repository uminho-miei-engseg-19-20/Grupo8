//
//  getCertificate.swift
//  soap
//
//  Created by João Macedo on 05/07/2020.
//  Copyright © 2020 João Macedo. All rights reserved.
//

import Foundation

class GetCertificate : NSObject, XMLParserDelegate{
    
    static let shared = GetCertificate()
    var session = URLSession.shared
    
    
    
    func getCertificate(num: String,appid: String,  callback: @escaping ( _ data: String)-> Void){
        
        let urll = "https://cmd.autenticacao.gov.pt/Ama.Authentication.Frontend/CCMovelDigitalSignature.svc"
        let url = URL(string: urll)
        
        let header = [ "content-type": "text/xml", "SOAPAction": "http://Ama.Authentication.Service/CCMovelSignature/GetCertificate"]
        
        let param = "<?xml version='1.0' encoding='UTF-8'?><s11:Envelope xmlns:s11='http://schemas.xmlsoap.org/soap/envelope/'><s11:Body><ns1:GetCertificate xmlns:ns1='http://Ama.Authentication.Service/'> <ns1:applicationId>"+appid+"</ns1:applicationId><ns1:userId>"+num+"</ns1:userId></ns1:GetCertificate></s11:Body></s11:Envelope>"
        
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
