//
//  ViewController.swift
//  rockPaperiOS
//
//  Created by Tariq on 8/15/16.
//  Copyright © 2016 Tariq. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    let modelInstance = appModel()   //  initialize instance of Model object
    
    let systemSound: [SystemSoundID] = [1000, 1022, 1006, 1003]  // array of iOS system sound IDs
    
    // note: "SystemSoundID" is a special datatype from AVFoundation
    // various properites of ViewController (Interface builder)
    
    @IBOutlet weak var siriChoice: UILabel!
    @IBOutlet weak var meChoice: UILabel!
    @IBOutlet weak var resultsDisplay: UILabel!
    @IBOutlet weak var meScore: UILabel!
    @IBOutlet weak var siriScore: UILabel!
    
    
    @IBAction func rockPressed(_ sender: AnyObject) {
        
        updateUI(choice: "Rock")    // call this method to refresh View after game play
        
     }
    
    @IBAction func paperPressed(_ sender: AnyObject) {
        
        updateUI(choice: "Paper")   // call this method to refresh View after game play
    }
    
    @IBAction func ScissorsPressed(_ sender: AnyObject) {
        
        updateUI(choice: "Scissors")   // call this method to refresh View after game play
    }
    
    
    override func viewDidLoad() {   // (Boilerplate code by Xcode)
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        resultsDisplay.text = "Pick your choice to play"   // set initial message and initialize view when app is loaded
        
    }
    
  func updateUI(choice:String ) {
        
        //  This method is called when user selects a choice. user choice string is updated with selection and calls the appModel class instance.
        //  modelInstance() return game play result and scores. view is updated
    
        modelInstance.userChoice = choice                        //  set user choice from user input
        resultsDisplay.text  = modelInstance.play()              //  update result field with game play result (game play is trigerred once)
        let sndIndex = modelInstance.outcome                     //  figure out what sound to play by outcome dict lookup
        AudioServicesPlaySystemSound (systemSound[sndIndex])  //  play sound
        siriChoice.text = modelInstance.computerChoice           //  update user choice text field
        meChoice.text = modelInstance.userChoice                 //  update computer choice text field
        siriScore.text = "\(modelInstance.computerScore)"        //  update computer score
        meScore.text = "\(modelInstance.userScore)"              //  update user score
    
    }
 
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}

