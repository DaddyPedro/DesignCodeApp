//
//  SectionViewController.swift
//  DesignCodeApp
//
//  Created by mhd tahhan on 7/4/18.
//  Copyright © 2018 mhd tahhan. All rights reserved.
//

import UIKit

class SectionViewController: UIViewController {
    
    @IBOutlet weak var sectionTitleLable: UILabel!
    @IBOutlet weak var sectionCaptionLabel: UILabel!
    @IBOutlet weak var sectionImageView: UIImageView!
    @IBOutlet weak var sectionBodyLabel: UILabel!
    @IBOutlet weak var sectionProgressLabel: UILabel!
    
    
    var sections: [[String:String]]!
    var section: [String: String]!
    var indexPath: IndexPath!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }


    

//    @IBAction func closeButtonTapped(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
//        
//    }
    
    
    
    func displayData() {
        sectionTitleLable.text = section["title"]
        sectionBodyLabel.text = section["body"]
        sectionCaptionLabel.text = section["caption"]
        sectionImageView.image = UIImage(named: section["image"]!)
        sectionProgressLabel.text = "\(indexPath.row + 1) / \(sections.count)"
        
    }
    
    

}
