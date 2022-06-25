//
//  UIPickerViewDataSource.swift
//  Colorized
//
//  Created by Владимир Фалин on 25.06.2022.
//

import UIKit

extension SecondSettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        presetColors.count
    }
}
