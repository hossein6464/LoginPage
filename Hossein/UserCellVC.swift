//
//  UserCellVC.swift
//  Hossein
//
//  Created by Diana Saidova on 2022-04-04.
//

import UIKit

class UserCellVC: UITableViewCell {

    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstnameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func update(with user: User) -> Void {
        firstnameLabel.text = user.firstName
        lastNameLabel.text = user.lastName
    
    }

}
