//
//  CandidateTableViewCell.swift
//  Practical Test IOS
//
//  Created by Imalka Muthukumara on 2021-12-07.
//

import UIKit

class CandidateTableViewCell: UITableViewCell {
    
    @IBOutlet var firstName: UILabel!
    
    @IBOutlet var imageCandidate: UIImageView!
    
    @IBOutlet var age: UILabel!
    private var urlString: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // Setup candidates values
    func setCellWithValuesOf(_ candidate:Candidate) {
        updateUI(firstName: candidate.name?.first, lastName: candidate.name?.last, age: candidate.dob?.age, image: candidate.picture?.medium)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // Update the UI Views
    private func updateUI(firstName: String?,lastName: String?,age:Int?,image:String?) {
        self.firstName.text = "\(firstName ?? "") \(lastName ?? "")"
        self.age.text = String(age ?? 0)
        guard let candidateString = image else {return}
        
        guard let candidateImageURL = URL(string: candidateString) else {
            self.imageCandidate.image = UIImage(named: "noImageAvailable")
            return
        }
        
        self.imageCandidate.image = nil
        
        getImageDataFrom(url: candidateImageURL)
        
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
                    self.imageCandidate.image = image
                }
            }
        }.resume()
    }
}
