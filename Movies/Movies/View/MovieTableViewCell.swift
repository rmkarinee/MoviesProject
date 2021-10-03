//
//  MovieTableViewCell.swift
//  Movies
//
//  Created by Karine Rodrigues on 03/10/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var movieLabelDescription: UITextView!
    @IBOutlet weak var movieLabelTitle: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
