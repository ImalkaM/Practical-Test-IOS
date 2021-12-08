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
    
    var candidate:CandidateDetails?
    
    let button = UIButton()
    
    var viewModel = DetailViewModel()
    
    var isSelected:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isSelected = candidate?.isSelected
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:candidate?.isSelected ?? false ? "Selected" : "Select", style: .plain, target: self, action: #selector(addTapped))
        
        updateUI()
    }
    
    @objc func addTapped(){
        isSelected?.toggle()
        DispatchQueue.main.async {
            if self.isSelected ?? false{
                self.navigationItem.rightBarButtonItem?.title = "Selected"
            }else{
                self.navigationItem.rightBarButtonItem?.title = "Select"
            }
        }
        viewModel.updateCandidateStatus(candidate: candidate!, isSelected: isSelected!)
    }
    
    // Setup candidates values
    func setCellWithValuesOf(_ candidate:CandidateDetails) {
        DispatchQueue.main.async {
            //self.updateUI(candidate: viewModel.candidate)
        }
    }
    
    // Update the UI Views
    func updateUI() {
        
        if let fName = candidate?.firstName,let lName = candidate?.lastName{
            self.name.text = "\(fName) \(lName)"
        }
       
//        self.address.text = "\(candidate.locationNumber!) \(candidate.streetName!) \n\(candidate.city!), \(candidate.state!)"
//
        self.phoneNumber.text = candidate?.tpNo
//
        self.dob.text = convertDateFormater(candidate?.dob)
//
        self.email.text = candidate?.email
        guard let candidateString = candidate?.imageAvatar else {return}

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
