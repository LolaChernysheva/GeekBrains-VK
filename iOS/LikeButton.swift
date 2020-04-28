//
//  LikeButton.swift
//  iOS
//
//  Created by Лолита Чернышева on 04.01.2020.
//  Copyright © 2020 Лолита Чернышева. All rights reserved.
//

import UIKit

class LikeButton: UIButton {
//довавить атрибут с помощью @IBInspectable
    @IBInspectable var liked: Bool = false {
        didSet {
            setUpDefault()
        }
    }
    
    @IBInspectable var likeCount: Int = 0 {
        didSet {
            setUpDefault()
        }
    }
    
    func like() {
        liked = !liked
        if liked {
        setLinked()
        }  else {
            disableLike()
            }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpDefault()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpDefault()
    }

    private func setUpDefault() {
        setImage(liked ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart"), for: .normal)
        setTitle(String(likeCount), for: .normal)
        tintColor = liked ? .red : .gray
        setTitleColor(liked ? .red : .gray, for: .normal)
        imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        imageView?.contentMode = .scaleAspectFit
    }


    //ставим лайк
    func setLinked() {
        likeCount += 1
        setImage(UIImage(systemName: "heart.fill"), for: .normal)
        setTitle(String(likeCount), for: .normal)
        animatedLikeButton()
        
    }
    //убираем лайк
    func disableLike() {
        likeCount -= 1
        setImage(UIImage(systemName: "heart"), for: .normal)
        setTitle(String(likeCount), for: .normal)
        tintColor = .gray
        setTitleColor(UIColor.gray, for: .normal)
        animatedLikeButton()
    }

    override func draw(_ rect: CGRect) {
    super.draw(rect)
    }
    
    /*func animation () {
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       options: [],
                       animations: {
                self.imageView?.transform = CGAffineTransform (scaleX: 1.5, y: 1.5)
        
        }, completion: { _ in
            UIView.animate(withDuration: 1.0,
                           delay: 0,
                           options: [],
                           animations: {
                self.imageView?.transform = CGAffineTransform (scaleX: 1.0, y: 1.0)
            })
        })
    } */
    //анимация нажатия на лайк
    private func animatedLikeButton () {
        let animation = CASpringAnimation (keyPath: "transform.scale")
        animation.fromValue = 1.1
        animation.toValue = 1
        animation.stiffness = 500
        animation.mass = 1
        animation.duration = 1
        animation.beginTime = CACurrentMediaTime()
        animation.fillMode = CAMediaTimingFillMode.both
        layer.add(animation, forKey: nil)
    }
}
