//
//  ScreenBViewController.swift
//  HW8
//
//  Created by mac on 8.09.22.
//

import UIKit

class ScreenBViewController: UIViewController {

    @IBOutlet weak var animalTableView: UITableView!
    
    var animalList = ModelController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tuneUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let selectedRows = animalTableView.indexPathsForSelectedRows {
            for indexPath in selectedRows {
                animalTableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
    
    func tuneUI() {
        animalTableView.dataSource = self
        animalTableView.delegate = self
        animalTableView.rowHeight = 70
    }

}
// MARK: TableDataSource
extension ScreenBViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        animalList.unionNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalsListCell", for: indexPath)
        let pet = animalList.unionNames[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = pet
        content.textProperties.font = .systemFont(ofSize: CGFloat(23))
        if animalList.rusNames.contains(pet) {
            content.secondaryText = animalList.engNames[animalList.rusNames.firstIndex(of: pet)!]
        }
        content.image = UIImage(named: pet)
        content.imageProperties.cornerRadius = tableView.rowHeight / 5
        if animalList.stringNewAnimals.capitalized.contains(pet) {
            cell.accessoryType = .checkmark
        }
        cell.contentConfiguration = content
        return cell
    }
    
}
// MARK: TableDelegate
extension ScreenBViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        guard animalList.rusNames.contains(animalList.unionNames[indexPath.row]) else {
            self.addAlert()
            return
        }
        let index = animalList.rusNames.firstIndex(of: animalList.unionNames[indexPath.row])
        guard let vc = storyboard?.instantiateViewController(identifier: "descr") as? ScreenCViewController else {
            return
        }
        vc.index = index!
        vc.animalList = animalList
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        guard animalList.rusNames.contains(animalList.unionNames[indexPath.row]) else {
            self.addAlert()
            return nil
        }
        let index = animalList.rusNames.firstIndex(of: animalList.unionNames[indexPath.row])
        guard let vc = storyboard?.instantiateViewController(identifier: "descr") as? ScreenCViewController else {
            return nil
        }
        vc.index = index!
        vc.animalList = animalList
        self.navigationController?.pushViewController(vc, animated: true)
        return indexPath
    }
}
// MARK: Alert
extension ScreenBViewController {
    func addAlert() {
        let alert = UIAlertController(title: "Ошибка!", message: "Информации о выбранном животном нет", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Назад", style: .destructive, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
}
