//
//  MovieCollectionViewCell.swift
//  Movies APP
//
//  Created by MESHO on 15/05/2023.
//

import UIKit
import SwiftUI

class MovieCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var MovieImageView: UIImageView!
    @IBOutlet weak var MovieTitle_Label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.layer.cornerRadius = 20
//        self.layer.borderColor = Color.accentColor.cgColor
//        self.layer.borderWidth = 2
    }

}
