//
//  TableViewEmptyCell.swift
//  iOs
//
//  Created by JORGE VAZQUEZ REQUEJO on 10/10/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit

protocol EmptyStatusCellDelegate: class{
    func emptyStatusCellDidPressBack(cell: TableViewEmptyCell)
}

class TableViewEmptyCell: UITableViewCell {
    
    @IBOutlet weak var lblDatos: UILabel!
    @IBOutlet weak var btnVolver: UIButton!
    
    weak var delegate: EmptyStatusCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btnVolver.layer.cornerRadius = 10
        btnVolver.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func backButtonPressed(){
        delegate?.emptyStatusCellDidPressBack(cell: self)
    }
    
}
