//
//  SearchGroupTableVC.swift
//  iOS
//
//  Created by Лолита Чернышева on 04.01.2020.
//  Copyright © 2020 Лолита Чернышева. All rights reserved.
//

import UIKit

class SearchGroupTableVC: UITableViewController {
    var groupList:[Group] = GroupDataBase.shared.searchGroups
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTemplate", for: indexPath) as! GroupCell
        cell.groupname.text = groupList[indexPath.row].name
        return cell
    }

}
