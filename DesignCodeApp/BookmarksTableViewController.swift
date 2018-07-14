//
//  BookmarksTableViewController.swift
//  DesignCodeApp
//
//  Created by mhd tahhan on 7/14/18.
//  Copyright © 2018 mhd tahhan. All rights reserved.
//

import UIKit

class BookmarksTableViewController: UITableViewController {
    
    var bookmarks: [[String: String]] = allBookmarks

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }



    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return bookmarks.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookmarksCell", for: indexPath) as! bookmarkTableViewCell
        let bookmark = bookmarks[indexPath.row]
        cell.badgeImageView.image = UIImage(named: "Bookmarks/" + bookmark["type"]!)
        cell.chapterNumberLabel.text = bookmark["chapter"]
        cell.titleLabel.text = bookmark["part"]
        cell.bodyLabel.text = bookmark["content"]
        cell.chapterTitleLabel.text = bookmark["section"]
        
        
        return cell
    }

}
