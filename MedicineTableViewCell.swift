//
//  MedicineTableViewCell.swift
//  BetterMed
//
//  Created by Channel Two on 3/27/16.
//  Copyright © 2016 Matthew Horger. All rights reserved.
//

import UIKit

class MedicineTableViewCell: UITableViewCell {
    // MARK: Properties

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    //@IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var dosage: UILabel!
    @IBOutlet weak var time: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
