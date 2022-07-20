//
//  ViewController.swift
//  Salon_Task3
//
//  Created by 相良 詠斗 on 2021/06/27.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var firstTextField: UITextField!
    @IBOutlet private weak var secondTextField: UITextField!
    @IBOutlet private weak var firstSwitch: UISwitch!
    @IBOutlet private weak var secondSwitch: UISwitch!
    @IBOutlet private weak var firstLabel: UILabel!
    @IBOutlet private weak var secondLabel: UILabel!
    @IBOutlet private weak var resultLabel: UILabel!
    
    @IBAction func buttonAction(_ sender: Any) {
        
        let numbers = textFields.map { NumberFormatter().number(from: $0.text ?? "0")?.intValue ?? 0 }

        let firstSignedNumber = numbers[0] * (firstSwitch.isOn ? -1 : 1)
        let secondSignedNumber = numbers[1] * (secondSwitch.isOn ? -1 : 1)

        firstLabel.text = "\(firstSignedNumber)"
        secondLabel.text = "\(secondSignedNumber)"

        resultLabel.text = "\(firstSignedNumber + secondSignedNumber)"
    }
    
    private var textFields: [UITextField] { [firstTextField, secondTextField] }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFields.forEach {
            $0.keyboardType = .numberPad
        }
    }
}
