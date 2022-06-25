//
//  FirstSettingsViewController.swift
//  Colorized
//
//  Created by Владимир Фалин on 25.06.2022.
//

import UIKit

final class FirstSettingsViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var saveButton: UIButton!
    
    public var color = UIColor()
    public var red: CGFloat?
    public var green: CGFloat?
    public var blue: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        saveButton.layer.cornerRadius = 15
        
        colorView.backgroundColor = color
        colorView.layer.cornerRadius = 20
        
        setupSlider(slider: redSlider, minimumTrackTintColor: .red, colorValue: red)
        setupSlider(slider: greenSlider, minimumTrackTintColor: .green, colorValue: green)
        setupSlider(slider: blueSlider, minimumTrackTintColor: .blue, colorValue: blue)
        
        redLabel.text = String(Int(redSlider.value))
        greenLabel.text = String(Int(greenSlider.value))
        blueLabel.text = String(Int(blueSlider.value))
    }

    @IBAction func redSliderAction(_ sender: UISlider) {
        redLabel.text = String(Int(sender.value))
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value) / 255, green: CGFloat(greenSlider.value) / 255, blue: CGFloat(blueSlider.value) / 255, alpha: 1)
    }
    
    @IBAction func greenSliderAction(_ sender: UISlider) {
        greenLabel.text = String(Int(sender.value))
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value) / 255, green: CGFloat(greenSlider.value) / 255, blue: CGFloat(blueSlider.value) / 255, alpha: 1)
    }
    
    @IBAction func blueSliderAction(_ sender: UISlider) {
        blueLabel.text = String(Int(sender.value))
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value) / 255, green: CGFloat(greenSlider.value) / 255, blue: CGFloat(blueSlider.value) / 255, alpha: 1)
    }
    
    private func setupSlider(slider: UISlider, minimumTrackTintColor: UIColor, colorValue: CGFloat?) {
        slider.maximumTrackTintColor = .darkGray
        slider.minimumTrackTintColor = minimumTrackTintColor
        slider.value = Float(colorValue ?? 0) * 255
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let backgroundColor = colorView.backgroundColor else { return }
        color = backgroundColor
    }
}

