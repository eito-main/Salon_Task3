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
    
    @IBAction func ButtonAction(_ sender: Any) {
        
        let numbers = textFields.map { NumberFormatter().number(from: $0.text ?? "0")?.intValue ?? 0}
        resultLabel.text = "\(calculate(first: numbers[0], second: numbers[1]))"
    }
    
    private var textFields: [UITextField] { [firstTextField, secondTextField] }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFields.forEach {
            $0.keyboardType = .numberPad
        }
    }
    
    func calculate(first: Int, second: Int) -> Int{
        
        //代入しないと符号変換ができないため
        var firstNum = first
        var secondNum = second
        
        if firstSwitch.isOn {
            firstNum = firstNum * -1
        }
        if secondSwitch.isOn {
            secondNum = secondNum * -1
        }
        
        firstLabel.text = "\(firstNum)"
        secondLabel.text = "\(secondNum)"
        
        return firstNum + secondNum
    }
}
