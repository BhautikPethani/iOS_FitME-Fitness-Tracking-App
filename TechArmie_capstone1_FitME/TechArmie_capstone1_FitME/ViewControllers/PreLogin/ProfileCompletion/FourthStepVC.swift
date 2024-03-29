//
//  FourthStepVC.swift
//  TechArmie_capstone1_FitME
//
//  Created by Vir Davinder Singh on 2022-07-22.
//

import Foundation
import UIKit

class FourthStepVC : BaseVC{
    
    var profileModel = ProfileModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func goToNext(_ sender: Any) {
        let vc = FifthStepVC.instantiate(fromAppStoryboard: .Main)
        vc.profileModel = profileModel
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

