//
//  ViewController.swift
//  StretchyHeaderLayout
//
//  Created by hongjuyeon_dev on 2019/12/05.
//  Copyright © 2019 hongjuyeon_dev. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    let pictures = Picture.loadPictures()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = collectionView.collectionViewLayout as? StretchyHeaderLayout {
            layout.itemSize = CGSize(width: collectionView.bounds.width - 4.0, height: 62)
            layout.minimumLineSpacing = 2
            layout.sectionInset = UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0)
            layout.headerReferenceSize = CGSize(width: collectionView.bounds.width, height: 180)
            layout.maximumStretchHeight = collectionView.bounds.width
        }
    }
}

extension ViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureCell", for: indexPath) as! PictureCell
        cell.picture = pictures[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
        return header
    }
}
