//
//  ViewController.swift
//  IntroduceStudent
//
//  Created by Md Shahedur Rahman on 1/16/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var interestsButton: UIButton!
    @IBOutlet weak var introduceSelfButton: UIButton!
    @IBOutlet weak var changeColorButton: UIButton!
    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var morePetsStepper: UIStepper!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    
    func styleButton(_ button: UIButton) {
        // Add rounded corners
        button.layer.cornerRadius = 8
            
        // Add border
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemBlue.cgColor // You can change the color
            
        // Customize title color
        button.setTitleColor(UIColor.systemBlue, for: .normal)
            
        // Customize font
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        }
    
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        numberOfPetsLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)
        
        let introduction = "My name is \(firstNameTextField.text!) \(lastNameTextField.text!) and I attend \(schoolNameTextField.text!). I am currently in my \(year!) year and I own \(numberOfPetsLabel.text!) dogs. It is \(morePetsSwitch.isOn) that I want more pets."

        // Creates the alert where we pass in our message, which our introduction.
                let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)

                // A way to dismiss the box once it pops up
                let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)

                // Passing this action to the alert controller so it can be dismissed
                alertController.addAction(action)

                present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func changeColorDidTapped(_ sender: UIButton) {
        // Generate a random color
        let randomColor = UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1.0
        )
                
        // Change the background color of the main view
        UIView.animate(withDuration: 1.0) {
            self.view.backgroundColor = randomColor
        }
    }
    
    @IBAction func interestsDidTapped(_ sender: UIButton) {
    
                let additionalInfoAlert = UIAlertController(title: "Interests", message: "Volunteering, Photography, Sports, Traveling, and Music.", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Got it!", style: .default, handler: nil)
                additionalInfoAlert.addAction(action)
                
                present(additionalInfoAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleButton(introduceSelfButton)
        styleButton(changeColorButton)
    }

}

