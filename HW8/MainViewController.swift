//
//  ViewController.swift
//  HW8
//
//  Created by mac on 7.09.22.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tuneUI()
        registerForKeyboardNotifications()
    }
    func tuneUI() {
        myTextField.delegate = self
        myTextField.returnKeyType = .continue
    }
//    MARK: observers
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { _ in
            self.view.frame.origin.y = 0
        }
    }
    
    @objc func kbWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRactangle = keyboardFrame.cgRectValue
            self.view.frame.origin.y = (150 - keyboardRactangle.height)
        }
    }
}
// MARK: delegate and segue
extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ScreenBVC") as? ScreenBViewController else {
            return false
        }
        self.navigationController?.pushViewController(vc, animated: true)
        textField.resignFirstResponder()
        guard textField.text?.isEmpty != true else {
            return true
        }
        vc.animalList.stringNewAnimals = textField.text!
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        myTextField.resignFirstResponder()
    }
}
