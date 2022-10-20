//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by Jiyeon Choi on 2022. 10. 20..
//

import UIKit

protocol LEDBoardSettingDelegate: AnyObject {
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}
class SettingViewController: UIViewController {
    
    @IBOutlet weak var textfield: UITextField!
    
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    
    
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    
    weak var delegate: LEDBoardSettingDelegate?
    
    var ledText: String?
    var textColor: UIColor = .yellow
    var backgroundColor: UIColor = .black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    private func configureView() {
        if let ledText = self.ledText {
            self.textfield.text = ledText
        }
        self.changeTextColor(textColor: self.textColor)
        self.changeBackgroundColor(backgroundColor: self.backgroundColor)
    }
    
    @IBAction func tapTextColorButton(_ sender: UIButton) {
        if sender == yellowButton {
            self.changeTextColor(textColor: .yellow)
        } else if sender == purpleButton {
            self.changeTextColor(textColor: .purple)
        } else {
            self.changeTextColor(textColor: .green)
        }
    }
    
    @IBAction func tapBackgroundColorButton(_ sender: UIButton) {
        if sender == blackButton {
            self.changeBackgroundColor(backgroundColor: .black)
        } else if sender == blueButton {
            self.changeBackgroundColor(backgroundColor: .blue)
        } else {
            self.changeBackgroundColor(backgroundColor: .orange)
        }
    }
    
    private func changeTextColor(textColor: UIColor) {
        self.textColor = textColor
        self.yellowButton.alpha = textColor == UIColor.yellow ? 1 : 0.2
        self.purpleButton.alpha = textColor == UIColor.purple ? 1 : 0.2
        self.greenButton.alpha = textColor == UIColor.green ? 1 : 0.2
    }
    
    private func changeBackgroundColor(backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.blackButton.alpha = backgroundColor == UIColor.black ? 1 : 0.2
        self.blueButton.alpha = backgroundColor == UIColor.blue ? 1 : 0.2
        self.orangeButton.alpha = backgroundColor == UIColor.orange ? 1 : 0.2
    }
    
    @IBAction func tapSaveButton(_ sender: UIButton) {
        self.delegate?.changedSetting(text: self.textfield.text, textColor: self.textColor, backgroundColor: self.backgroundColor)
        self.navigationController?.popViewController(animated: true)
    }
}
