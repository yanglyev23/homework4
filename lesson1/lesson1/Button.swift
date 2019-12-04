//
//  Button.swift
//  lesson1
//
//  Created by Admin on 28.11.2019.
//  Copyright © 2019 Heads and Hands. All rights reserved.
//

import UIKit

class Button: UIButton {
    override var isHighlighted: Bool{
        didSet{
            if isHighlighted{
                backgroundColor = UIColor.red
            }
            else{
                backgroundColor = UIColor.blue
            }
            }
        }
}
