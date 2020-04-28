//
//  NewsCell.swift
//  
//
//  Created by Лолита Чернышева on 06.01.2020.
//

import UIKit

class NewsCell: UITableViewCell {
    
   
    @IBOutlet weak var avatar: AvatarView!
    @IBOutlet weak var newsText: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var timeOfNewsCreation: UILabel!
    
    
    @IBAction func likeButton(_ sender: Any) {
        (sender as! LikeButton).like()
    }
    
    @IBAction func commentButton(_ sender: Any) {
    }
    
    @IBAction func viewsButton(_ sender: Any) {
    }
    
    @IBAction func repostButton(_ sender: Any) {
    }
    
}
