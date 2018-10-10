//
//  ActorCell.swift
//  iOs
//
//  Created by JORGE VAZQUEZ REQUEJO on 3/10/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit

class ActorCell: UITableViewCell {

    @IBOutlet weak var ActorImage: UIImageView!
    @IBOutlet weak var ActorLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ActorImage.layer.cornerRadius =
        ActorImage.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
