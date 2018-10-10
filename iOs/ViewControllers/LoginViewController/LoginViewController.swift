//
//  LoginViewController.swift
//  iOs
//
//  Created by JORGE VAZQUEZ REQUEJO on 3/10/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let myUser = "Jorge"
    let myPass = "hola"

    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 5.0
        loginButton.layer.masksToBounds = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    private func showSeriesVC(){
        let seriesVC = iOsViewController()
        let navigationController = UINavigationController(rootViewController: seriesVC)
        navigationController.modalTransitionStyle = .flipHorizontal
        //navigationController.navigationBar.isTranslucent = false
        present(navigationController, animated: true, completion: nil)
    }
    @IBAction func ActionLogin(_ sender: UIButton){
        if(userTextField.text == myUser && passTextField.text == myPass){
            loginButton.backgroundColor = UIColor.green
            showSeriesVC()
        }else{
            loginButton.backgroundColor = UIColor.red
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
