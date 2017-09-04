//
//  CustomRow.swift
//  AlamofireExample
//
//  Created by MEHMET on 3.09.2017.
//  Copyright © 2017 MEHMET. All rights reserved.
//

import UIKit

class CustomRow: UITableViewCell {
    
    
    @IBOutlet weak var salePrice: UILabel!
    
    @IBOutlet weak var currencyName: UILabel!
    @IBOutlet weak var buyPrice: UILabel!
    @IBOutlet weak var changePic: UIImageView!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
