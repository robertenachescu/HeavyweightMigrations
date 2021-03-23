//
//  FlagCell.swift
//  HeavyweightMigration
//
//  Created by Robert Enachescu on 23.03.2021.
//

import UIKit

class FlagCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var extraLbl: UILabel!
    
    static let identifier: String = "FlagCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadCellWithDetails(from user: InternationalUser) {
        nameLbl.text = user.userName
        
        extraLbl.text = "- \(user.userSex?.lowercased() ?? "person")"
        switch user.userSex {
        case Gender.Male.rawValue:
            extraLbl.textColor = .blue
        case Gender.Female.rawValue:
            extraLbl.textColor = .systemPink
        default:
            extraLbl.text = "- person"
            extraLbl.textColor = .none
        }
        
        switch user.userCountry {
        case Country.Colombia.rawValue:
            imgView.image = UIImage(named: Country.Colombia.rawValue)
        case Country.Romania.rawValue:
            imgView.image = UIImage(named: Country.Romania.rawValue)
        default:
            imgView.image = UIImage(named: Country.World.rawValue)
        }
    }

}
