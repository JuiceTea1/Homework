//
//  DataModelTW.swift
//  HW8
//
//  Created by mac on 9.09.22.
//

import Foundation
import UIKit

struct DataModel {
    let rusName: String
    let engName: String
    
    var descriptionRus: String? {
        switch rusName {
        case "Макака":
            return "Мака́ки (лат. Macaca) — род приматов из семейства мартышковых, состоящий из 21 вида, большинство из которых обитают в Азии."
        case "Собака":
            return "Соба́ка (лат. Canis familiaris, или Canis lupus familiaris) — домашнее животное, одно из наиболее популярных (наряду с кошкой) животных-компаньонов."
        case "Кот":
            return "Ко́шка (лат. Felis catus) — домашнее животное, одно из наиболее популярных (наряду с собакой) «животных-компаньонов»"
        case "Утка":
            return "Утки — это птицы средних и небольших размеров с относительно короткой шеей и цевкой, покрытой спереди поперечными щитками."
        default: return nil
        }
    }
    
    var descriptionEng: String? {
        switch rusName {
        case "Макака":
            return "Macaques (lat. Macaca) is a genus of primates from the marmoset family, consisting of 21 species, most of which live in Asia."
        case "Собака":
            return "A dog (lat. Canis familiaris, or Canis lupus familiaris) is a domestic animal, one of the most popular (along with a cat) companion animals."
        case "Кот":
            return "A cat (lat. Felis catus) is a pet, one of the most popular (along with a dog) “companion animals.”"
        case "Утка":
            return "Ducks are birds of medium and small size with a relatively short neck and tarsus covered in front with transverse scutes."
        default: return nil
        }
    }
}
class ModelController {
    var existingAnimals: [DataModel] = [
        DataModel(rusName: "Макака", engName: "Makaka"),
        DataModel(rusName: "Собака", engName: "Dog"),
        DataModel(rusName: "Кот", engName: "Cat"),
        DataModel(rusName: "Утка", engName: "Duck")
    ].sorted { $0.rusName < $1.rusName }
    
    var stringNewAnimals: String = ""
    
    private var newAnimals: [String] {
        stringNewAnimals.components(separatedBy: [",", " ", ".", "!", "?"]).filter { !$0.isEmpty }.map { $0.capitalized }
    }

    var rusNames: [String] {
        self.existingAnimals.map { $0.rusName }
    }
    var engNames: [String] {
        self.existingAnimals.map { $0.engName }
    }
    var unionNames: [String] {
        Set(self.rusNames).union(Set(self.newAnimals)).sorted()
    }
}
