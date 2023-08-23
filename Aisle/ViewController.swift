//
//  ViewController.swift
//  Aisle
//
//  Created by Jaya Krishna on 18/08/23.
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countryCodeTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func continueButtonTapped(_ sender: UIButton) {
    
        guard let phoneNumber = phoneNumberTextField.text else { return }

        makePhoneNumberAPICall(phoneNumber: phoneNumber)
    }
    
    func makePhoneNumberAPICall(phoneNumber: String) {
        let apiUrl = URL(string: "https://app.aisle.co/V1/users/phone_number_login")!
        var request = URLRequest(url: apiUrl)
        request.httpMethod = "POST"
       
        let parameters: [String: Any] = ["number": phoneNumber]
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if data != nil {
    
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "toScreen2", sender: nil)
                }
            }
           
        }.resume()
    }
}
