//
//  UITextViewWithReverseCount.swift
//  PickDate
//
//  Created by Cristiano Alves on 29/09/15.
//  Copyright © 2015 Cristiano Alves. All rights reserved.
//

import UIKit

class UITextViewWithReverseCount: UITextViewWithCount {

    @IBInspectable var maxLength : Int = 10
    
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
    
    override func textDidChange() {
        
        if(self.text.characters.count > maxLength) {
            
            self.text = self.text.substringToIndex(self.text.startIndex.advancedBy(maxLength))
        }
        
        self.counterLabel.text = "\(maxLength - self.text.characters.count)"
        
        self.resizeLabel()
    
    }
    
    

    
}
