//
//  MainViewController.swift
//  Colorized
//
//  Created by Владимир Фалин on 25.06.2022.
//

import UIKit

final class MainViewController: UIViewController {

    @IBOutlet weak var changeColorButton: UIButton!
    
    public var color = UIColor.orange
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = color
        
        changeColorButton.layer.cornerRadius = 15
    }

    @IBAction func changeColorButtonPressed(_ sender: Any) {
        let alert = UIAlertController(
            title: nil,
            message: "Цвет фона можно задать одним из предустановленных цветов, либо создать свой собственный цвет",
            preferredStyle: .alert
        )
        let cancelAction = UIAlertAction(title: "Отменить", style: .cancel, handler: nil)
        let yourColorAction = UIAlertAction(title: "Свой цвет", style: .default) { _ in
            self.performSegue(withIdentifier: "toFirstSettings", sender: self)
        }
        let presetColorAction = UIAlertAction(title: "Предустановленный цвет", style: .default) { _ in
            self.performSegue(withIdentifier: "toSecondSettings", sender: self)
        }
        alert.addAction(cancelAction)
        alert.addAction(yourColorAction)
        alert.addAction(presetColorAction)
        present(alert, animated: true, completion: nil)
         
    }
    
    @IBAction func unwindToMain(_ sender: UIStoryboardSegue) {
        if sender.identifier == "yourColorInMaine" {
            guard let source = sender.source as? FirstSettingsViewController else { return }
            view.backgroundColor = source.color
        } else if sender.identifier == "presetColorInMaine" {
            guard let source = sender.source as? SecondSettingsViewController else { return }
            view.backgroundColor = source.color
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFirstSettings" {
            guard let destination = segue.destination as? FirstSettingsViewController else { return }
            guard let backgroundColor = view.backgroundColor else { return }
            destination.color = backgroundColor
            destination.red = backgroundColor.colorComponents?.red
            destination.green = backgroundColor.colorComponents?.green
            destination.blue = backgroundColor.colorComponents?.blue
        } else if segue.identifier == "toSecondSettings" {
            guard let destination = segue.destination as? SecondSettingsViewController else { return }
            guard let backgroundColor = view.backgroundColor else { return }
            destination.color = backgroundColor
            destination.red = backgroundColor.colorComponents?.red
            destination.green = backgroundColor.colorComponents?.green
            destination.blue = backgroundColor.colorComponents?.blue
        }
    }
}


