//
//  StartViewController.swift
//  CandiBod
//
//  Created by Amanda Baret on 11/5/18.
//  Copyright © 2018 Amanda Baret. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

   
    @IBOutlet weak var StartButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden( true, animated: false)
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
     
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        //self.performSegue(withIdentifier: "candibodSegue", sender: nil)
    }
   

}
