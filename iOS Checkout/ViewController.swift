//
//  ViewController.swift
//  iOS Checkout
//
//  Created by Harsha Marri on 29/09/19.
//  Copyright © 2019 Harsha Marri. All rights reserved.
//

import UIKit
import Razorpay

class ViewController: UIViewController, RazorpayPaymentCompletionProtocol {
    var razorpay: Razorpay!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        razorpay = Razorpay.initWithKey("rzp_test_IFMmoKlMshyTeL", andDelegate: self)
    }
    override func viewDidAppear(_ animated: Bool) {
        self.showPaymentForm()
    }
    
    internal func showPaymentForm(){
        let options: [String:Any] = [
                    "amount": "100", //This is in currency subunits. 100 = 100 paise= INR 1.
                    "currency": "INR",//We support more that 92 international currencies.
                    "description": "Test Description",
                    "name": "Product Name",
                    "prefill": [
                        "contact": "9797979797",
                        "email": "foo@bar.com"
                    ]
                ]
        razorpay.open(options)
    }
    public func onPaymentError(_ code: Int32, description str: String){
        let alertController = UIAlertController(title: "FAILURE", message: str, preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.view.window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }

    public func onPaymentSuccess(_ payment_id: String){
        let alertController = UIAlertController(title: "SUCCESS", message: "Payment Id \(payment_id)", preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.view.window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }


}

