import UIKit

class GroupsVC: UITableViewController {
    var groupList: [Group] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        groupList = GroupDataBase.shared.userGroups
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTemplate", for: indexPath) as! GroupCell
        let gottenGroup = groupList[indexPath.row]
        cell.groupname.text = gottenGroup.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let removingGroup = GroupDataBase.shared.userGroups[indexPath.row]
            groupList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            GroupDataBase.shared.searchGroups.append(removingGroup)
        }
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            guard let searchGroupTableVC = segue.source as? SearchGroupTableVC
                else {return}
            if let indexPath = searchGroupTableVC.tableView.indexPathForSelectedRow {
               let group = searchGroupTableVC.groupList[indexPath.row]
                GroupDataBase.shared.searchGroups.remove(at: indexPath.row)
                groupList.append(group)
                tableView.reloadData()
            }
        }
    }
}
