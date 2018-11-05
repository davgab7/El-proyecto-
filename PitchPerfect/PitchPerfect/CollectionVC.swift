//
//  CollectionVC.swift
//  PitchPerfect
//
//  Created by David Gabrielyan on 29/10/18.
//  Copyright © 2018 David Gabrielyan. All rights reserved.
//

import Foundation
import UIKit

class CollectionVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionLayoutOutlet: UICollectionView!
    
    // array of items to go into the collectionView
    let array = ["Fast", "Slow", "someShit", "Echo", "Fast", "Slow", "someShit", "Echo", "Slow", "someShit", "Echo", "Slow", "someShit", "Echo", "Slow", "someShit", "Echo"];
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    //Populate the cell with an image
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellVC
        cell.cellOutlet.image = UIImage(named: array[indexPath.row] + ".png")
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let itemSize = UIScreen.main.bounds.width/3 - 3
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0) // redundant
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        
        layout.minimumLineSpacing = 3
        layout.minimumInteritemSpacing = 3
        
        collectionLayoutOutlet.collectionViewLayout = layout
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
