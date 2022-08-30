//
//  firstVC.swift
//  FizzBuzzApp
//
//  Created by Nima Bahrami on 8/28/22.
//

import UIKit

class firstVC: UIViewController {
   let topLabel = UILabel()
   let textField = UITextField()
   let saveButton = UIButton()
   var numberEntered: Int!
   var isTextFieldEmpy: Bool {return !textField.text!.isEmpty}
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      view.backgroundColor = .systemBackground
      configureLabel()
      configureTextField()
      configureSaveButton()
      dismissTheKeyboard()
      
   }
   //function that dismisses the keyboard
   func dismissTheKeyboard() {
      
      let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
      view.addGestureRecognizer(tap)
   }
   
   
   private func configureLabel () {
      view.addSubview(topLabel)
      let padding: CGFloat = 30
      topLabel.text = "Please Enter Any number"
      
      
      topLabel.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
         
         topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
         topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
         topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
         topLabel.heightAnchor.constraint(equalToConstant: 30)
         
      ])
   }
   
   private func configureTextField() {
      view.addSubview(textField)
      let padding: CGFloat = 30
      textField.placeholder = "Enter Value Here:"
      textField.textAlignment = .center
      textField.tintColor = .tintColor
      textField.translatesAutoresizingMaskIntoConstraints = false
      textField.keyboardType = .numberPad
      textField.delegate = self
      NSLayoutConstraint.activate([
         
         textField.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: padding),
         textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
         textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
         textField.heightAnchor.constraint(equalToConstant: 30)
         
      ])
      
   }
   
   private func configureSaveButton() {
      view.addSubview(saveButton)
      let padding: CGFloat = 30
      saveButton.backgroundColor = .systemGreen
      saveButton.setTitle("Check", for: .normal)
      saveButton.translatesAutoresizingMaskIntoConstraints = false
      saveButton.addTarget(self, action: #selector(saveValue), for: .touchUpInside)
      
      NSLayoutConstraint.activate([
         
         saveButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: padding),
         saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
         saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
         saveButton.heightAnchor.constraint(equalToConstant: 45)
         
      ])
      
   }
   
   private func alertFizz() {
      
      let alert = UIAlertController(title: "", message: "FIZZ", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "DISMISS", style: .cancel, handler: {action in print("alred tapped")}))
      
      present(alert, animated: true)
      
      
   }
   
   private func alertBuzz(){
      
      let alert = UIAlertController(title: "", message: "Buzz", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "DISMISS", style: .cancel, handler: {action in print("alred tapped")}))
      
      present(alert, animated: true)
      
   }
   
   private func alertFizzBuzz () {
      
      let alert = UIAlertController(title: "", message: "FizzBuzz", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "DISMISS", style: .cancel, handler: {action in print("alred tapped")}))
      
      present(alert, animated: true)
      
   }
   
   private func alertOtherNumber () {
      
      let alert = UIAlertController(title: "", message: "Try Another Number", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "DISMISS", style: .cancel, handler: {action in print("alred tapped")}))
      
      present(alert, animated: true)
      
   }
   
   private func alertEnterNumber () {
      
      let alert = UIAlertController(title: "", message: "Please InputSomething", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "DISMISS", style: .cancel, handler: {action in print("alred tapped")}))
      
      present(alert, animated: true)
      
   }
   
   
   @objc func saveValue(){
      guard isTextFieldEmpy else { alertEnterNumber()
         return
      }
         let textfieldInt: Int? = Int(textField.text!)
         numberEntered = textfieldInt
         if (numberEntered % 5 == 0 && numberEntered % 3 == 0 ){ alertFizzBuzz() }  else if(numberEntered % 5 == 0) { alertBuzz() } else if (numberEntered % 3 == 0) { alertFizz() } else { alertOtherNumber() }
         
   
   
   }
}

extension firstVC: UITextFieldDelegate{
   
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      saveValue()
      
      
      return true
   }
}
