//
//  PostsCell.swift
//  DocplexusAssignment
//
//  Created by asmita.borawake on 02/11/18.
//  Copyright © 2018 asmita.borawake. All rights reserved.
//

import UIKit

class PostsCell: UITableViewCell {

    @IBOutlet weak var postsImg: UIImageView!
    @IBOutlet weak var autherName: UILabel!
    @IBOutlet weak var therapeuticsName: UILabel!
    @IBOutlet weak var detialsText: UITextView!
    @IBOutlet weak var joinedSince: UILabel!
    @IBOutlet weak var viewCountLbl: UILabel!
    @IBOutlet weak var voteCountLbl: UILabel!
    @IBOutlet weak var answerCountLbl: UILabel!
    
    @IBOutlet weak var autherImg: UIImageView!
    @IBOutlet weak var viewView: UIView!
    
    @IBOutlet weak var autherImgWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var voteView: UIView!
    
    @IBOutlet weak var autherImgHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var commentView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        postsImg.layer.cornerRadius = postsImg.frame.width/2.0
        postsImg.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
