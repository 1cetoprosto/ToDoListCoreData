//
//  TableViewCell.swift
//  ToDoListCoreData
//
//  Created by leomac on 27.03.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var title: UILabel!
    @IBOutlet var imageUrgently: UIImageView!
    @IBOutlet var imageImportant: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
