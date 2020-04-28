//
//  NewsVC.swift
//  
//
//  Created by Лолита Чернышева on 06.01.2020.
//

import UIKit

class NewsVC: UITableViewController {
    var newsArray = [News(userName: "Pavel", avatar: "1", timeOfCreation: "12:00", newsText: "С                Новым Годом", newsImage: "2"),
                    News(userName: "Lolita", avatar: "3", timeOfCreation: "13:00", newsText: "Hello", newsImage: "4"),
                    News(userName: "Irina", avatar: "1", timeOfCreation: "12:00", newsText: "С Новым Годом", newsImage: "5")]
    override func viewDidLoad() {
        //регистрируем ячейку
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "SimpleNews")
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleNews", for: indexPath) as! NewsCell //извлекает шаблон ячейки и приводит к типу NewsCell
        let news = newsArray[indexPath.row] // получаем новость поиндексу
        //заполняем ячейку данными из новости
        cell.userName.text = news.userName
        cell.avatar.image.image = UIImage(named: news.avatar)
        cell.newsText.text = news.newsText
        cell.timeOfNewsCreation.text = news.timeOfCreation
        
        cell.newsImage.image = UIImage(named: news.newsImage)
        return cell
    }

}


   
