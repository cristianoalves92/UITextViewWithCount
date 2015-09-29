//
//  UITextViewWithCount.swift
//  PickDate
//
//  Created by Cristiano Alves on 28/09/15.
//  Copyright © 2015 Cristiano Alves. All rights reserved.
//

import UIKit

class UITextViewWithCount: UITextView, UITextViewDelegate {

    var counterLabel = UILabel()
    
    @IBInspectable var counterFontSize : CGFloat = 10 {
        didSet {
            self.counterLabel.font = UIFont(name: self.counterLabel.font.fontName, size: counterFontSize)
        }
    }
    
    // MARK: Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        self.counterLabel = UILabel.init()
        self.counterLabel.font = UIFont(name: self.counterLabel.font.fontName, size: counterFontSize)
        
        self.counterLabel.text =  "\(self.text.characters.count)"
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textDidChange", name: UITextViewTextDidChangeNotification, object: self)
    
        self.addSubview(self.counterLabel)
        
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        resizeLabel()
    }
    
    func resizeLabel() {
    
        self.counterLabel.sizeToFit()
        
        var height: CGFloat
        
        if(self.frame.height > self.contentSize.height) {
            
            height = self.frame.height
        } else {
            height = self.contentSize.height
        }
        
        self.counterLabel.frame = CGRectMake(self.frame.width - counterLabel.frame.width - 8 ,height - counterLabel.frame.height - 8, counterLabel.frame.width ,  counterLabel.frame.height)
    
    }
    
    func textDidChange() {
        
        self.counterLabel.text = "\(self.text.characters.count)"
        
        resizeLabel()
    }
    
    
    func sizeWithFont () {
        
        
        
    }
    

    
    
    
    
    
    
   
}
