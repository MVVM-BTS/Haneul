//
//  TableViewCell.swift
//  BasicCleanArchitecture
//
//  Created by κΉνλ on 2022/09/27.
//

import UIKit

class TableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
