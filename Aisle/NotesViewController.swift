
import UIKit

class NotesViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
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
