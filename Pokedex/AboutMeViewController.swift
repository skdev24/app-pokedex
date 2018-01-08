//
//  AboutMeViewController.swift
//  Pokedex
//
//  Created by Shivam Dev on 09/01/18.
//  Copyright © 2018 Shivam Dev. All rights reserved.
//

import UIKit

class AboutMeViewController: UITableViewController {

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        hidesBottomBarWhenPushed = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2 {
            return UITableViewAutomaticDimension
        } else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
        
    }

}
