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
    @IBOutlet weak var loginL: UITextField!
    
    @IBOutlet weak var passwordL: UITextField!
    
    @IBOutlet weak var buttonL: UIButton!
    
    @IBOutlet weak var loginR: UITextField!
    
    @IBOutlet weak var emailR: UITextField!
    @IBOutlet weak var passR: UITextField!
    @IBOutlet weak var repassR: UITextField!
    @IBAction func switchR(_ sender: Any) {
    }
    
    @IBAction func registButtonR(_ sender: Any) {
        let email = emailR.text!.lowercased()//приводит все к нижнему регистру
        let finalEmail = email.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)//убирает лишние пробелы и абзацы
        
        let isEmailAddresValid = isValidEmailAddress(emailAddressString: finalEmail)
        
        if isEmailAddresValid == false{
            displayAlertMessage(messageToDisplay: "email addres is not valid")
        }
        
        

        
    }
    
    @IBAction func buttonLogin(_ sender: UIButton) {
        // добавить идентификацию пользователя через логин пароль и сайт
        // code
        
        self.performSegue(withIdentifier: "closeZone", sender: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        regV.isHidden = true
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

