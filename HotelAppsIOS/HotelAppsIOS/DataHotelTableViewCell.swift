//
//  DataHotelTableViewCell.swift
//  HotelAppsIOS
//
//  Created by Muhammad Hilmy Fauzi on 17/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class DataHotelTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNamaHotel: UILabel!
    @IBOutlet weak var lblAlamat: UILabel!
    @IBOutlet weak var lblRate: UILabel!
    @IBOutlet weak var lblRateHuruf: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
