//
//  testimonialViewController.swift
//  DesignCodeApp
//
//  Created by mhd tahhan on 7/7/18.
//  Copyright © 2018 mhd tahhan. All rights reserved.
//

import UIKit

class testimonialViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
   
    }


}

extension testimonialViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testimonials.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testimonialCell", for: indexPath) as! testimonialCollectionViewCell
        
        let testimonial = testimonials[indexPath.row]
        cell.testimonialTextLabel.text = testimonial["text"]
        cell.testimonialNameLabel.text = testimonial["name"]
        cell.testimonialJobLabel.text = testimonial["job"]
        cell.testimonialImageView.image = UIImage(named: testimonial["avatar"]!)
        
        
        return cell
        
    }
    
    
    
    
}
