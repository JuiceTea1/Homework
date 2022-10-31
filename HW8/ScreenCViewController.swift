//
//  ScreenCViewController.swift
//  HW8
//
//  Created by mac on 8.09.22.
//

import UIKit

class ScreenCViewController: UIViewController {

    @IBOutlet var descrView: UIView!
    @IBOutlet weak var descrLabel: UILabel!
    
    @IBOutlet weak var langSwitch: UISwitch!
    @IBOutlet weak var engLabel: UILabel!
    @IBOutlet weak var rusLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var animalList = ModelController()
    var index: Int = 0
    private var descr: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    func configure() {
        self.rusLabel.text = animalList.existingAnimals[index].rusName
        self.engLabel.text = animalList.engNames[index]
        self.imageView.image = UIImage(named: animalList.rusNames[index])
        self.descrLabel.text = animalList.existingAnimals[index].descriptionRus!
    }
    
    @IBAction func changeLangSw(_ sender: Any) {
        switch langSwitch.isOn {
        case true:
            self.descrLabel.text = animalList.existingAnimals[index].descriptionRus!
        case false:
            self.descrLabel.text = animalList.existingAnimals[index].descriptionEng!
            
        }
    }
    
}
