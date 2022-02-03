//
//  ViewController.swift
//  UKadai6
//
//  Created by 岩渕優児 on 2022/02/03.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak private var label: UILabel!
    @IBOutlet weak private var slider: UISlider!
    private var number: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNumber()
        slider.minimumValue = 1
        slider.maximumValue = 100
    }
    @IBAction func judgeButton(_ sender: Any) {
        let slideNumber = Int(slider.value)
        if number == slideNumber {
            let message = "あたり！ \n あなたの値: \(slideNumber)"
            alert(message: message)
        } else {
            let message = "はずれ！ \n あなたの値: \(slideNumber)"
            alert(message: message)
        }
    }
    private func setupNumber() {
        number = Int.random(in: 1...100)
        label.text = "\(number!)"
    }
    private func alert(message: String) {
        let alertController = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "再挑戦", style: .default, handler: { _ in
            self.setupNumber()
        }))
        present(alertController, animated: true)
    }
}
