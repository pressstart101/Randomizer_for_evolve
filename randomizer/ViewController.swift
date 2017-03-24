//
//  ViewController.swift
//  randomizer
//
//  Created by walter scott on 3/24/17.
//  Copyright © 2017 mk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var number_textfield: UITextField!
    @IBOutlet weak var result_text: UILabel!
    @IBOutlet weak var button_ui: UIButton!
    
    
    
var pplz = ["Adonnis", "Alex", "Ben","Calin", "Dam", "Ehab", "Iuri", "Jamal", "Mark", "MikeC", "MikeG", "Ryan", "Tajivon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background.png")
        view?.backgroundColor = UIColor(white: 1, alpha: 0.5)
        self.view.insertSubview(backgroundImage, at: 0)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        //self.view.backgroundColor = UIColor(UIImage(named: "background.png")!)

        number_textfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

        // Do any additional setup after loading the view, typically from a nib.
//print(shuffleArray(array: pplz))
//print(groups(8))
//   format(pplz_per_group:1)

        result_text.numberOfLines = 28
       // result_text.lineBreakMode = .byWordWrapping
        //l.frame.size.width = 300
        //result_text.sizeToFit()
        result_text.layer.masksToBounds = true
        result_text.layer.cornerRadius = 20

        number_textfield.layer.cornerRadius = 10
        button_ui.layer.cornerRadius = 40
        
}
   
    @IBAction func count_action(_ sender: Any) {
        if let str_to_int = number_textfield.text{
            let str_to_int_unwrapped = Int(number_textfield.text!)
        
            result_text.text = format(pplz_per_group: str_to_int_unwrapped!)
            dismissKeyboard()
        }
    }

    func shuffleArray<T>(array: Array<T>) -> Array<T>{
        var array1 = array
        for index in ((0 + 1)...array.count - 1).reversed()
        {
            
            var j = Int(arc4random_uniform(UInt32(index-1)))
            

            swap(&array1[index], &array1[j])
        }
        return array1
    }
    func groups(_ groupSize: Int) -> [[String]] {
        var arr = shuffleArray(array: pplz)
        return stride(from: 0, to: arr.count, by: groupSize).map({ (startIndex) -> [String] in
            let endIndex = (startIndex.advanced(by: groupSize) > arr.count) ? arr.count-startIndex : groupSize
            return Array(arr[startIndex..<startIndex.advanced(by: endIndex)])
            
        })
    }
    
    
    func format(pplz_per_group: Int) -> String {
    var arr = groups(pplz_per_group)
        var str = ""
        var num = 0
        if arr[arr.count-1].count == 1{
            arr[arr.count-2].append(arr[arr.count-1][0])
        }
        
        for i in arr{
            num += 1
            if i.count > 1{
            str += "Group" + "\(num). " + "\(i.joined(separator:" "))\n\n\n"
            }

        }
                    print(str)
        return str
    }
    
    
    func textFieldDidChange(_ textField: UITextField) {
        
    }
 
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    
}
