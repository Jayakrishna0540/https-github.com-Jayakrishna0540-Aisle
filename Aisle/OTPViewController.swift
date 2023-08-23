//
//  OTPViewController.swift
//  Aisle
//
//  Created by Jaya Krishna on 18/08/23.
//

import UIKit

class OTPViewController: UIViewController {

    @IBOutlet weak var otpTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func continueButtonTapped(_ sender: UIButton) {
        guard let otp = otpTextField.text else { return }

        makeOTPApicall(otp: otp)
    }

    func makeOTPApicall(otp: String) {
        guard let phoneNumber = UserDefaults.standard.string(forKey: "phoneNumber") else { return }

        let apiUrl = URL(string: "https://app.aisle.co/V1/users/verify_otp")!
        var request = URLRequest(url: apiUrl)
        request.httpMethod = "POST"

        let parameters: [String: Any] = ["number": phoneNumber, "otp": otp]
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if data != nil {
            
                DispatchQueue.main.async {
                    guard ({
                        UserDefaults.standard.string(forKey: "authToken")
                        self.performSegue(withIdentifier: "toScreen3", sender: nil)
                    }) != nil else {
                        return
                    }
                }
            }
      
        }.resume()
    }
}

