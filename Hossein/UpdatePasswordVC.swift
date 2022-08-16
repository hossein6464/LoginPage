//
//  UpdatePasswordVC.swift
//  Hossein
//
//  Created by Diana Saidova on 2022-04-04.
//

import UIKit

class UpdatePasswordVC: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    @IBOutlet weak var passwordMainTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true

        // Do any additional setup after loading the view.
    }

    @IBAction func updatePassword(_ sender: Any) {
        var rightAnswer = false
        var rightPassword = false
        var userPassworedChanged: User = User(firstName: "", lastName: "", username: "", password: "", question: "", answer: "")
        for (index, user) in ViewController.users.enumerated() {
            if user.answer == answerTextField!.text && user.username == usernameTextField!.text && passwordConfirmationTextField!.text == passwordMainTextField!.text {
                errorLabel.isHidden = true
                rightAnswer = true
                rightPassword = true
                ViewController.users[index].password = passwordMainTextField!.text!
                userPassworedChanged = user
                
                }
            }
        if rightAnswer && rightPassword {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainViewControllerId") as! ViewController
            
            vc.usernameTransfer = userPassworedChanged.username
            vc.passwordTransfer = userPassworedChanged.password
            
            self.present(vc, animated: true)
            for user in ViewController.users {
                print("Username: \(user.username) Password: \(user.password)")
            }
        }
        if !rightAnswer && !rightPassword {
            errorLabel.isHidden = false
            errorLabel.text = "Either the answer username or passwords do not match"
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
