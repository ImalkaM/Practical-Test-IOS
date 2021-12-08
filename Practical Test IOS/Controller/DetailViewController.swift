//
//  DetailViewController.swift
//  Practical Test IOS
//
//  Created by Imalka Muthukumara on 2021-12-07.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var name: UILabel!
    
    @IBOutlet var address: UILabel!
    
    @IBOutlet var phoneNumber: UILabel!
    
    @IBOutlet var dob: UILabel!
    
    @IBOutlet var email: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // Setup candidates values
    func setCellWithValuesOf(_ candidate:Candidate) {
        DispatchQueue.main.async {
            self.updateUI(name: candidate.name, address: candidate.location, phoneNumber: candidate.phoneNumber, dob: candidate.dob?.date, email: candidate.email, imageUrl: candidate.picture?.large)
        }
    }
    
    // Update the UI Views
    func updateUI(name: Name?,address:Location?,phoneNumber:String?,dob:String?,email:String?,imageUrl:String?) {
        
        self.name.text = "\(name?.first ?? "") \(name?.last ?? "")"
        self.address.text = "\(address?.street?.number ?? 0) \(address?.street?.name ?? "") \n\(address?.city ?? ""), \(address?.state ?? ""), \(address?.postcode ?? StringOrInt.string(""))"
        
        self.phoneNumber.text = "\(phoneNumber ?? "")"
        
        self.dob.text = convertDateFormater(dob)
        
        self.email.text = email
        guard let candidateString = imageUrl else {return}
        
        guard let candidateImageURL = URL(string: candidateString) else {
            self.userImage.image = UIImage(named: "noImageAvailable")
            return
        }
        
        getImageDataFrom(url: candidateImageURL)
        
    }
    
    // MARK: - Convert date format
    func convertDateFormater(_ date: String?) -> String {
        if let index = date?.range(of: "T")?.lowerBound {
            let substring = date?[..<index]
            return String(substring ?? "")
        }
        return ""
    }
    
    // MARK: - Get image data
    private func getImageDataFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle Error
            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.userImage.image = image
                }
            }
        }.resume()
    }
}
