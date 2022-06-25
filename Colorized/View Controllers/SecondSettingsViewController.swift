//
//  SecondSettingsViewController.swift
//  Colorized
//
//  Created by Владимир Фалин on 25.06.2022.
//

import UIKit

class SecondSettingsViewController: UIViewController {
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var colorPickerView: UIPickerView!
    @IBOutlet weak var saveButton: UIButton!
    
    public var color = UIColor()
    public var red: CGFloat?
    public var green: CGFloat?
    public var blue: CGFloat?
    
    let presetColors = [
        "красный",
        "зелёный",
        "синий",
        "коричневый",
        "пурпурный",
        "оранжевый",
        "бирюзовый"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        saveButton.layer.cornerRadius = 15
        
        colorView.layer.cornerRadius = 20
        colorView.backgroundColor = color
        
        setupColorPickerView()
    }
    
    private func setupColorPickerView() {
        colorPickerView.delegate = self
        colorPickerView.dataSource = self
        colorPickerView.backgroundColor = .darkGray
        colorPickerView.layer.cornerRadius = 20
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let backgroundColor = colorView.backgroundColor else { return }
        color = backgroundColor
    }
}
