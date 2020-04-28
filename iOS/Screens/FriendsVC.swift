

import UIKit
//структура для работы с секциями, для дальнейшей сортировки по алфавиту списка друзей
struct Section <T> {
    var title: String
    var items: [T]
}

class FriendsVC: UITableViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    var friendList = ["Lolita", "Pavel", "Svetlana", "Olga", "Anna"]
    var friendListObj = [Friend(name: "Lolita", avatar: "avatar"),
                       Friend(name: "Pavel", avatar: "2"),
                        Friend(name: "Svetlana", avatar: "3"),
                        Friend(name: "Olga", avatar: "4"),
                        Friend(name: "Anna", avatar: "5")]
    var friendSection = [Section<Friend>]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        //инициализруем массив, который надо сортировать, сортировка по каждому элементу массива, по имени, по первому символу
        let friendDictionary = Dictionary.init(grouping: friendListObj) {
            $0.name.prefix(1)
        }
        friendSection = friendDictionary.map {Section (title: String($0.key), items: $0.value)}

    }

    override func numberOfSections(in tableView: UITableView) -> Int { //сколько групп в списке
        return friendSection.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {   //возвращает количество секций
        return friendSection[section].items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {     //возвращает шаблон данной ячейки
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTemplate", for: indexPath) as! FriendCell   //извлекает шаблон ячейки
        let friend = friendListObj[indexPath.row]
        cell.username.text = friendSection[indexPath.section].items[indexPath.row].name
        cell.shadowAvatar.image.image = UIImage(named: friendSection[indexPath.section].items[indexPath.row].avatarPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)  //отвечает за нажатие ячейки 
        let viewController = storyboard.instantiateViewController(identifier: "PhotoController") as! PhotoController
        viewController.friend = friendSection[indexPath.section].items[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendSection[section].title
    }
}

extension FriendsVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let friendDictionary = Dictionary.init(grouping: friendListObj.filter { (user) -> Bool in
            return searchText.isEmpty ? true: user.name.lowercased().contains(searchText.lowercased())}) {$0.name.prefix(1)}
               friendSection = friendDictionary.map {Section (title: String($0.key), items: $0.value)}
        friendSection.sort { $0.title < $1.title}
        tableView.reloadData()
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)  //скрыть клавиатуру после обработки
    }
    
}
 

