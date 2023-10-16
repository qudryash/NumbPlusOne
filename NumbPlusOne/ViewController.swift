//
//  ViewController.swift
//  NumbPlusOne
//
//  Created by Kudryashov Andrey on 16.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var numbValue = 0                               // Объявляем переменную numbValue со значением 0
    
    @IBOutlet weak var numb: UILabel!               // Добавление привязки лейбла к коду
    @IBOutlet weak var numbPlusOneText: UIButton!   // Добавление привязки кнопки к коду
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        При запуске проекта загружаем входные данные:
                
                numb.text = "Значение счётчика: \(numbValue)"   // Изменение названия text на "Значение счётчика: 0"
                numbPlusOneText.setTitle("+1", for: .normal)    // Изменение название title на "+1"

    }

    //    Добавляем действие для кнопки (при нажатии на кнопку обновляем переменную numbValue на значение +1)
    @IBAction func numbPlusOne(_ sender: Any) {
        
        numbValue += 1
        numb.text = "Значение счётчика: \(numbValue)"
        
    }
    
}

