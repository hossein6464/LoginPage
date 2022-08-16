//
//  ViewController.swift
//  Hossein
//
//  Created by Diana Saidova on 2022-04-04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var mainViewPasswordTextField: UITextField!
    @IBOutlet weak var mainViewUsernameTextField: UITextField!
    var usernameTransfer = ""
    var passwordTransfer = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        mainViewUsernameTextField.text = usernameTransfer
        mainViewPasswordTextField.text = passwordTransfer
        // Do any additional setup after loading the view.
    }
    public static var users: [User] = User.loadUsers()
    
    @IBAction func logInActionButton(_ sender: Any) {
        var userNameExists = false
        var passwordRight = false
        for user in ViewController.users {
            print(user.username)
            if user.username == mainViewUsernameTextField!.text! {
                userNameExists = true
                if user.password == mainViewPasswordTextField!.text {
                    passwordRight = true
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserTableVCId") as! UserTableVC
                    self.present(vc, animated: true)
                    }
            }
        }
        if userNameExists == false || passwordRight == false {
            errorLabel.isHidden = false
            errorLabel.text = "Wrong User name or Password"
        }
    }
    @IBAction func signUpActionButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVCId") as! SignUpVC
        self.present(vc, animated: true)
    }
    @IBAction func forgotPasswordActionButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UpdatePasswordVCId") as! UpdatePasswordVC
        self.present(vc, animated: true)
    }
}

