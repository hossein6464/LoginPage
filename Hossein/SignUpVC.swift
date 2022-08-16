//
//  SignUpVC.swift
//  Hossein
//
//  Created by Diana Saidova on 2022-04-04.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var errorLabelSignup: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    @IBOutlet weak var passwordTextFieldMain: UITextField!
    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var lastnameLabel: UITextField!
    @IBOutlet weak var firstnameLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabelSignup.isHidden = true

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
   

    @IBAction func sumbitButton(_ sender: Any) {
        var userExists = false
        var passwordMatch = false
     
        for user in ViewController.users {
            if usernameLabel!.text == user.username {
                userExists = true
            }
        }
        if passwordTextFieldMain!.text == passwordConfirmationTextField!.text {
            passwordMatch = true
        }
        if passwordMatch && !userExists {
            var newUser: User?
            newUser = User(firstName: "\(String(describing: firstnameLabel!.text!))", lastName: "\(String(describing: lastnameLabel!.text!))", username: "\(usernameLabel!.text!)", password: "\(passwordTextFieldMain!.text!)", question: "\(questionTextField!.text!)", answer: "\(answerTextField!.text!)")
            if newUser != nil {
            ViewController.users.append(newUser!)
            }
            errorLabelSignup.isHidden = true
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainViewControllerId") as! ViewController
            vc.usernameTransfer = newUser!.username
            vc.passwordTransfer = newUser!.password
            self.present(vc, animated: true)
            
            for user in ViewController.users {
                print(user.firstName)
            }
    }
        if userExists || !passwordMatch {
            errorLabelSignup.isHidden = false
            errorLabelSignup.text = "Sorry User Exists or Password does not match"
        }
        
    }
}
