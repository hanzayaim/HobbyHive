//
//  RegisterViewController.swift
//  HobbyHiveRev
//
//  Created by Raihan Daffa Rizky on 11/12/23.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmationPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerOnClick(_ sender: Any) {
        guard let username = usernameTextField.text,
                      let fullName = fullNameTextField.text,
                      let phoneNumber = phoneNumberTextField.text,
                      let password = passwordTextField.text,
                      let confirmationPassword = confirmationPasswordTextField.text,
                      !username.isEmpty,
                      !fullName.isEmpty,
                      !phoneNumber.isEmpty,
                      !password.isEmpty,
                      !confirmationPassword.isEmpty else {
                    showAlert(with: "Error", message: "All fields are required.")
                    return
                }
                
                guard password == confirmationPassword else {
                    showAlert(with: "Error", message: "Passwords do not match.")
                    return
                }

                guard isPasswordStrong(password) else {
                    showAlert(with: "Error", message: "Password must be at least 8 characters long and include uppercase letters, numbers, and special characters.")
                    return
                }
                
                guard isUsernameUnique(username) else {
                    showAlert(with: "Error", message: "Username already exists. Please choose another one.")
                    return
                }

                guard isValidPhoneNumber(phoneNumber) else {
                    showAlert(with: "Error", message: "Invalid phone number format.")
                    return
                }
                
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                
                let newUser = User(context: context)
                newUser.username = username
                newUser.fullName = fullName
                newUser.phoneNumber = phoneNumber
                newUser.password = password
                
                do {
                    try context.save()
                    showAlert(with: "Success", message: "User registered successfully.")
                    clearTextFields()
                } catch let error as NSError {
                    showAlert(with: "Error", message: "Failed to register user. \(error.localizedDescription)")
                }
            }
            
            func showAlert(with title: String, message: String) {
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }

            func isPasswordStrong(_ password: String) -> Bool {
                return password.count >= 8 && password.rangeOfCharacter(from: .uppercaseLetters) != nil && password.rangeOfCharacter(from: .decimalDigits) != nil
            }
            
            func isUsernameUnique(_ username: String) -> Bool {
                return true
            }

            func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
                return true
            }
            
            func clearTextFields() {
                usernameTextField.text = ""
                fullNameTextField.text = ""
                phoneNumberTextField.text = ""
                passwordTextField.text = ""
                confirmationPasswordTextField.text = ""
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
