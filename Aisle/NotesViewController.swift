
import UIKit

class NotesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        makeNotesAPICall()
    }

    func makeNotesAPICall() {
        guard let authToken = UserDefaults.standard.string(forKey: "authToken") else { return }

        let apiUrl = URL(string: "https://app.aisle.co/V1/users/test_profile_list")!
        var request = URLRequest(url: apiUrl)
        request.httpMethod = "GET"
       
        request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if data != nil {
            }
        }.resume()
    }
}
