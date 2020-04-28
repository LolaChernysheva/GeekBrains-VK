//
//  AvatarView.swift
//  iOS
//
//  Created by Лолита Чернышева on 04.01.2020.
//  Copyright © 2020 Лолита Чернышева. All rights reserved.
//

import UIKit
class AvatarView: UIView {
    var image: UIImageView!
    
    @IBInspectable var shadowOpacity: CGFloat = 0.5 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 4.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addImage()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addImage()
        
    }
    // добавим картинку
    func addImage () {
        image = UIImageView(frame: frame)   //картинка приняла форму основного объекта
        addSubview(image)
    }
    
    //настраиваем свойство тени и само отображение
    
    override func layoutSubviews() {  //вызывается каждый раз, когда хотябы одно свойство subview изменяется. Нужна для сохранения всех пропорций
        
        //обновим размеры картинки
        image.frame = bounds
        
        //настраиваем тень
        layer.shadowColor = UIColor.black.cgColor
        //настраиваем прозрачность тени (бывает от 0 до 1)
        layer.shadowOpacity = Float(shadowOpacity)
        //радиус
        layer.shadowRadius = shadowRadius
        //высота
        layer.shadowOffset = CGSize (width: 0, height: 1)
        
        //сделаем картинку круглой
        layer.backgroundColor = UIColor.clear.cgColor//убирает белый фон контейнера
        image.layer.cornerRadius = bounds.size.height / 2
        image.layer.masksToBounds = true //если есть модификации, то ны их применяем (не игнорируем)
    }
}
