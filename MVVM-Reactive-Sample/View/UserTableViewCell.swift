//
//  UserTableViewCell.swift
//  MVVM-Reactive-Sample
//
//  Created by Gokhan Akkurt on 13.06.2019.
//

import UIKit
import Reusable

final class UserTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
