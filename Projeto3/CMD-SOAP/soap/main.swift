//
//  main.swift
//  soap
//
//  Created by João Macedo on 05/07/2020.
//  Copyright © 2020 João Macedo. All rights reserved.
//

import Foundation
import ArgumentParser


var appid = get_appid()

func viewDidLoad(){
    
    GetCertificate.shared.getCertificate(num: "+351 933037504", appid: appid) {
        (message) in print(message)
    }
    Ccmovelsign.shared.ccmovelsign(num: "+351 933037504", appid: appid, pin: "1111"){
        (message) in print(message)
    }
}




struct Random: ParsableCommand  {
    
    @Argument () var cmd : String
    @Argument() var numero: String
    @Argument() var numero1: String
    @Argument() var numero2: String
    @Argument() var numero3: String
    @Argument() var numero4: String
    
        
    func validate(nm : String)->Bool {
      
      if (!nm.contains("+351")){
          return false
      }
      
      if(nm.count != 13){
          return false
      }
      
    return true
      
}
    func validatePin(pin :String)->Bool  {
        let charSet = NSCharacterSet.letters
        if pin.rangeOfCharacter(from:charSet)?.isEmpty == false{
          return false
        }
        return true
    }
    
    func run() {
        switch cmd {
            case "ms", "CCMovelSign":
                
                    if (numero == "applicationId") {
                        if (validate(nm : numero2)) {
                            if (validatePin(pin : numero3)) {
                                
                                Ccmovelsign.shared.ccmovelsign(num: numero2,appid: numero1, pin : numero3){
                                    (message) in print(message)
                                }
                                    break
                                }
                             else {
                                print("Pin errado\n")
                                break
                            }
                        }
                         else {
                                print("numero invalido\n")
                                print("O numero deve ser no formato '+351NNNNNNNNN'\n")
                                break
                          }
                        }

                   
                     if (validate(nm : numero2)) {
                        if (validatePin(pin : numero3)) {
                                
                            Ccmovelsign.shared.ccmovelsign(num: numero2,appid: appid, pin : numero3){
                                (message) in print(message)
                            }
                            break
                        } else {
                                print("Pin errado\n")
                                break;
                        }
                    } else {
                            print("numero invalido\n")
                            print("O numero deve ser no formato '+351NNNNNNNNN'\n")
                            break;
                    }
                    
            
            
       case "otp", "ValidateOtp":
        
            if (numero == "applicationId") {
                if (validate(nm : numero2)) {
                    Validate_otp.shared.validate_otp(code: numero3, processId: numero4, appid : numero1){
                            (message) in print(message)
                        }
                            break
                }
                 else {
                        print("numero invalido\n")
                        print("O numero deve ser no formato '+351NNNNNNNNN'\n")
                        break
                  }
            }

            if (validate(nm : numero2)) {
                
                Validate_otp.shared.validate_otp(code: numero3, processId: numero4, appid : appid){
                            (message) in print(message)
                        }
                          
                break
                 
            } else {
                    print("numero invalido\n")
                    print("O numero deve ser no formato '+351NNNNNNNNN'\n")
                    break;
            }
            
           

        case "gc":
            if (numero == "applicationId") {
                if (validate(nm : numero2)) {
                        GetCertificate.shared.getCertificate(num : numero2,appid : numero1){
                            (message) in print(message)
                        }
                            break
                }
                 else {
                        print("numero invalido\n")
                        print("O numero deve ser no formato '+351NNNNNNNNN'\n")
                        break
                  }
            }

            if (validate(nm : numero2)) {
                
                GetCertificate.shared.getCertificate(num : numero2, appid : numero1){
                            (message) in print(message)
                }
                break
                 
            } else {
                    print("numero invalido\n")
                    print("O numero deve ser no formato '+351NNNNNNNNN'\n")
                    break;
            }
           
            

        case "help", "h":
            print( "usage: test_cmd_wsdl.php [-h] [-V]\r\n")
            print( "                        {GetCertificate,gc,CCMovelSign,ms,")
            print( "CCMovelMultipleSign,mms,ValidateOtp,otp,TestAll,test}\r\n")
            print( "                        ...\r\n\r\n")
            print( "test Command Line Program (for Preprod/Prod Signature CMD (SOAP) version 1.6 technical specification)")
            print( "\r\n")
            print( "optional arguments:\r\n")
            print( "  -h, --help           show this help message and exit\r\n")
            print( "  -h, --help           show program version\r\n\r\n")
            print( "CCMovelDigitalSignature Service:\r\n")
            print( "  {GetCertificate,gc,CCMovelSign,ms,CCMovelMultipleSign,mms,")
            print( "ValidateOtp,otp,TestAll,test} -> Signature CMD (SCMD) operations")
            print( "\r\n\r\n")
            print( "    GetCertificate (gc)       -> Get user certificate\r\n")
            print( "    CCMovelSign (ms)          -> Start signature process\r\n")
            print( "    CCMovelMultipleSign (mms) -> Start multiple signature process")
            print( "\r\n    ValidateOtp (otp)         -> Validate OTP\r\n")
            print( "    TestAll (test)            -> Automatically test all comands")
            print( "\r\n")

        default:
            print("Use -h for usage :\n")
            print("test_cmd_wsdl.php -h for all operations\n")
            print( "test_cmd_wsdl.php <oper1> -h for usage of operation <oper1>\n")
        }
        
    }
}


Random.main()


//viewDidLoad()

