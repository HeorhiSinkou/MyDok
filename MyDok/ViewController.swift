//
//  ViewController.swift
//  MyDok
//
//  Created by georg syncov on 09.04.17.
//  Copyright © 2017 georg syncov. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    let myUser = User()
    
    
    @IBAction func segment(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex
        {
        case 0:
            regV.isHidden = true
        case 1:
            regV.isHidden = false
        default:
            break
        }
        
        
        
    }
    
    @IBOutlet weak var regV: UIView!
    
    @IBOutlet weak var emailL: UITextField!
    
    @IBOutlet weak var passwordL: UITextField!
    
    @IBOutlet weak var buttonL: UIButton!
    
    
    
    @IBOutlet weak var emailR: UITextField!
    @IBOutlet weak var passR: UITextField!
    @IBOutlet weak var repassR: UITextField!
    @IBAction func switchR(_ sender: Any) {
    }
    //окно регистрации
    @IBAction func registButtonR(_ sender: Any) {
        let email = emailR.text!.lowercased()//приводит все к нижнему регистру
        let finalEmail = email.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)//убирает лишние пробелы и абзацы
        
        let isEmailAddresValid = isValidEmailAddress(emailAddressString: finalEmail)
        
        if isEmailAddresValid == false{
            displayAlertMessage(messageToDisplay: "Email addres is not valid")
            return
        }
        //проверка на заполненность полей пароля
        if ((passR.text?.isEmpty)! || (repassR.text?.isEmpty)!) {
            displayAlertMessage(messageToDisplay: "All fields are required")
            return
        }
        
        //проверка на идентичность паролей
        if (passR.text != repassR.text) {
            displayAlertMessage(messageToDisplay: "Passwords do not match")
            return
        }
        //добавить проверку на согласие с пользовательским соглашением
        
        
        
        
        
        
        
        
       
        
        //user.string(forKey: "finalEmail")
        //user.string(forKey: "passR")
        
        //UserDefaults.standard.string(forKey: "finalEmail")
        //UserDefaults.standard.string(forKey: "passR")
        
        let alertController = UIAlertController(title: "Alert", message: "Registration completed", preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            
            // Code in this block will trigger when OK button tapped.
            //переходит на основную страницу
            self.performSegue(withIdentifier: "closeZone", sender: self)
        }
        
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion:nil)
        //сохранение данных пользователя
        myUser.userEmailStored = finalEmail
        myUser.userPasswordStored = passR.text!
        
        
        
        
    }
    //окно входа
    @IBAction func buttonLogin(_ sender: UIButton) {
        // добавить идентификацию пользователя через логин пароль и сайт
        // code
        if ((emailL.text?.isEmpty)! || (passwordL.text?.isEmpty)!) {
            displayAlertMessage(messageToDisplay: "All fields are required")
            return
        }
        let userEmail = emailL.text
        let userPassword = passwordL.text
        
        //let userEmailStored = "snak59@tut.by"
        //let userEmailStored = user.string(forKey: "finalEmail")
            //UserDefaults.standard.string(forKey: "finalEmail")
        //let userPasswordStored = "1234"
        //let userPasswordStored = user.string(forKey: "passR")
            //UserDefaults.standard.string(forKey: "passR")
        
        if(userEmail == myUser.userEmailStored)
        {
            if(userPassword == myUser.userPasswordStored)
            {
                // Login is successfull
//                UserDefaults.standard.set(true,forKey:"isUserLoggedIn");
//                UserDefaults.standard.synchronize();
//                
                self.performSegue(withIdentifier: "closeZone", sender: self)
            }
        }
        else {
            displayAlertMessage(messageToDisplay: "You are not registred")
            
        }
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        regV.isHidden = true
        
        if (myUser.userEmailStored != nil) || (myUser.userPasswordStored != nil) {
            
           self.performSegue(withIdentifier: "closeZone", sender: self) 
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    func displayAlertMessage(messageToDisplay: String){
        let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
            
        }
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
    }
    
    
}

