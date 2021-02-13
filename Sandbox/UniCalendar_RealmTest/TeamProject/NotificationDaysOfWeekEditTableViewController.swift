//
//  NotificationDaysOfWeekEditTableViewController.swift
//  TeamProject
//
//  Created by Nayeon Kim on 2021/01/25.
//

import UIKit

class NotificationDaysOfWeekEditTableViewController: UITableViewController {

    var checkedDayList: [Int] = Array<Int>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        for day in checkedDayList {
            self.tableView.cellForRow(at: [0, day])?.accessoryType = .checkmark
        }
    }
    @IBAction func cancelModal(_ sender: Any) {
        checkedDayList.removeAll()
        performSegue(withIdentifier: "unwindToDetailNotificationSetting", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destView = segue.destination
        
        guard let vc = destView as? NotificationSettingEditTableViewController else {
            return
        }
        vc.checkedDaysOfWeek = self.checkedDayList.sorted{$0 < $1}
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.selectionStyle = .none
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            if checkedDayList.contains(indexPath.row) {
                if let index = checkedDayList.firstIndex(of: indexPath.row) {
                    checkedDayList.remove(at: index)
                }
            }
            checkedDayList = checkedDayList.filter{ $0 != indexPath.row}
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            checkedDayList.append(indexPath.row)
        }
    }
    
    @IBAction func completeModal(_ sender: Any) {
        performSegue(withIdentifier: "unwindToDetailNotificationSetting", sender: self)
    }
    
}
