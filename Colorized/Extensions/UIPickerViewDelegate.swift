//
//  UIPickerViewDelegate.swift
//  Colorized
//
//  Created by Владимир Фалин on 25.06.2022.
//

import UIKit

extension SecondSettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        presetColors[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            colorView.backgroundColor = .red
        case 1:
            colorView.backgroundColor = .green
        case 2:
            colorView.backgroundColor = .blue
        case 3:
            colorView.backgroundColor = .brown
        case 4:
            colorView.backgroundColor = .purple
        case 5:
            colorView.backgroundColor = .orange
        case 6:
            colorView.backgroundColor = .cyan
        default:
            break
        }
    }
}
