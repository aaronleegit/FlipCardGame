//
//  ViewController.swift
//  FlipCardGame
//
//  Created by Aaron Lee on 2020/10/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var primary: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    var buttons:[UIButton] = []
    var clicked:[Bool] = [false,false,false,false,false,false]
    var type:[Int] = []
    var file:[String] = ["red","yellow","blue"]
    var totalTimes = 0
    var checkPoint = 0
    var whatToCheck:[Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    @IBAction func oneClick(_ sender: Any) {
        clicked[0] = true
        checkPoint += 1
        whatToCheck.append(0)
        updateUI()
        if (checkPoint == 2){
            check()
        }
    }
    @IBAction func twoClick(_ sender: Any) {
        clicked[1] = true
        checkPoint += 1
        whatToCheck.append(1)
        updateUI()
        if (checkPoint == 2){
            check()
        }
    }
    @IBAction func threeClick(_ sender: Any) {
        clicked[2] = true
        checkPoint += 1
        whatToCheck.append(2)
        updateUI()
        if (checkPoint == 2){
            check()
        }
    }
    @IBAction func fourClick(_ sender: Any) {
        clicked[3] = true
        checkPoint += 1
        whatToCheck.append(3)
        updateUI()
        if (checkPoint == 2){
            check()
        }
    }
    @IBAction func fiveClick(_ sender: Any) {
        clicked[4] = true
        checkPoint += 1
        whatToCheck.append(4)
        updateUI()
        if (checkPoint == 2){
            check()
        }
    }
    @IBAction func sixClick(_ sender: Any) {
        clicked[5] = true
        checkPoint += 1
        whatToCheck.append(5)
        updateUI()
        if (checkPoint == 2){
            check()
        }
    }
    
    func random() -> Void {
        var a = [1,2,3,4,5,6]
        for i in 0...5 {
            let ranInd = Int.random(in: 0...(a.count - 1))
            type.append(a[ranInd])
            a.remove(at: ranInd)
            type[i] = type[i] % 3
        }
    }
    
    func updateUI() -> Void {
        for i in 0...5 {
            if (clicked[i] == true){
                buttons[i].setImage(UIImage(named: file[type[i]]), for: .normal)
                buttons[i].isEnabled = false
            } else {
                buttons[i].setImage(UIImage(named: "pokerBack"), for: .normal)
                buttons[i].isEnabled = true
            }
        }
    }
    
    func check() -> Void {
        checkPoint = 0
        totalTimes += 2
        if !(type[whatToCheck[0]] == type[whatToCheck[1]]){
            clicked = [false,false,false,false,false,false]
            updateUI()
        }
        whatToCheck = []
        if (clicked == [true,true,true,true,true,true]){
            primary.setTitle("You win of \(totalTimes) Rounds! Click to Restart!", for: .normal)
            primary.isEnabled = true
        }
    }
    
    func initialize() -> Void {
        primary.setTitle("Play the FlipCardGame!", for: .normal)
        primary.isEnabled = false
        clicked = [false,false,false,false,false,false]
        buttons = [one,two,three,four,five,six]
        type = []
        file = ["red","yellow","blue"]
        totalTimes = 0
        checkPoint = 0
        whatToCheck = []
        random()
        updateUI()
    }
    
    @IBAction func primaryClicked(_ sender: Any) {
        initialize()
    }
    
}

