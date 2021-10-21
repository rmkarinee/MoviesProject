//
//  MoviesTableViewCell.swift
//  Movies
//
//  Created by Karine Rodrigues Mendonça on 03/10/21.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionMovieTableView: UILabel!
    @IBOutlet weak var titleMovieTableView: UILabel!
    @IBOutlet weak var imageMovieTableView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
