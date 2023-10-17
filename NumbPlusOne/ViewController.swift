//
//  ViewController.swift
//  NumbPlusOne
//
//  Created by Kudryashov Andrey on 16.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var numbValue = 0                               // Объявляем переменную numbValue со значением 0
    var dates: [String] = []                        // Объявляем переменную dates как массив
    
    @IBOutlet weak var numb: UILabel!               // Добавление привязки лейбла к коду
    @IBOutlet weak var numbPlusOneText: UIButton!   // Добавление привязки кнопки к коду
    @IBOutlet weak var numbMinusOneText: UIButton!  // Добавление привязки кнопки к коду
    @IBOutlet weak var resetButton: UIButton!       // Добавление привязки кнопки к коду
    @IBOutlet weak var dateLabelText: UITextView!   // Добавление привязки текстового поля к коду
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        При запуске проекта загружаем входные данные:
        
        numb.text = "Значение счётчика: \(numbValue)"   // Изменение названия text на "Значение счётчика: 0"
        numbPlusOneText.setTitle("+1", for: .normal)    // Изменение название title на "+1"
        numbPlusOneText.tintColor = .red                // Изменяем цвет шрифта
        numbMinusOneText.setTitle("-1", for: .normal)   // Изменение название title на "-1"
        numbMinusOneText.tintColor = .blue              // Изменяем цвет шрифта
        resetButton.setImage(UIImage(systemName: "repeat"), for: .normal) // добавляем иконку для кнопки сброса
        resetButton.setTitle("", for: .normal)          // Изменение название title на ""
        resetButton.tintColor = .black                  // Изменяем цвет иконки
        dateLabelText.text = "История изменений:"       // Изменение названия text на "История изменений:"
    }
    
    //    Добавляем действие для кнопки (при нажатии на кнопку обновляем переменную numbValue на значение +1)
    @IBAction func numbPlusOne(_ sender: Any) {
        
        numbValue += 1
        numb.text = "Значение счётчика: \(numbValue)"
        recordDate(action: "+1")
        
    }
    
    //    Добавляем действие для кнопки (при нажатии на кнопку обновляем переменную numbValue на значение -1)
    @IBAction func numbMinusOne(_ sender: Any) {
        
        if numbValue != 0 {
            numbValue -= 1
            numb.text = "Значение счётчика: \(numbValue)"
            recordDate(action: "-1")
            } else {
                recordDate(action: "Попытка уменьшить значение счётчика ниже 0")
            }
        
    }
    
    //    Добавляем действие для кнопки (при нажатии на кнопку обновляем переменную numbValue на значение 0)
    @IBAction func reset(_ sender: Any) {
        
        numbValue = 0
        numb.text = "Значение счётчика: \(numbValue)"
        recordDate(action: "Значение сброшено")
        
    }
    
    //    Добавляем работу текстового поля с датой и значением
    func recordDate(action: String) {
        
        var date = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .medium)
        if action == "Значение сброшено" {
            dates.append("\(date): \n \(action)")
            } else if action == "Попытка уменьшить значение счётчика ниже 0" {
                dates.append("\(date): \n \(action)")
                } else {
                    dates.append("\(date): \n Значение изменено на \(action)")
                }
        dateLabelText.text = dates.joined(separator: "\n \n")
        let bottom = NSMakeRange(dateLabelText.text.count - 1, 1)
        dateLabelText.scrollRangeToVisible(bottom)
    }

}

