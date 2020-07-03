//
//  MainScreenLogicController.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

struct MainScreenLogicController {
    
    func textFieldIsEmpty(with text : String, andAdded string : String) -> Bool? {
        if text.isEmpty {
            //in this case the text field was empty
            if string != "" {
                //and the user entered a string that is not "delete"
                return false
            }
        }
        else {
            //the text is not empty
            if text.count == 1 && string == "" {
                //there is only one character in the text field and the user erased it
                return true
            }
        }
        
        return nil
    }
    
    func shouldHideActionButton(_ hidden : Bool,withAnimation animate : Bool) -> (alpha : CGFloat,enabled : Bool,animationDuration : TimeInterval) {
        //for the action button, hiding it can be immediate (when moving to the search screen) and with animation (when text is entered or erased)
        //here we decide the parameters of animating the action button, in regards to the different options
        var alpha : CGFloat = 1.0
        var enabled = true
        var animationDuration : TimeInterval = 0.0
        
        if hidden {
            alpha = 0.0
            enabled = false
        }
        
        if animate {
            if hidden {
                animationDuration = 0.7
            }else{
                animationDuration = 2.3
            }
        }
        
        return (alpha,enabled,animationDuration)
    }
}
