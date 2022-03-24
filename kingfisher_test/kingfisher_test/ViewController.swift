//
//  ViewController.swift
//  kingfisher_test
//
//  Created by Christian Wiradinata on 24/03/22.
//

import UIKit
import Kingfisher
import SwiftSoup


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        
        for items in arr {
            print("Image:\(items.image)\nTitle:\(items.title)\n")
        }
        print(arr.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        as! cell
        
        //Text
        let url = URL(string: "\(arr[indexPath.row].image)")
        
        cell.image.kf.indicatorType = .activity
        cell.image.kf.setImage(
            with: url,
            placeholder: nil,
            options: [.transition(.fade(0.7))],
            completionHandler: { result in
                
            }
        )
        cell.title.text = "\(arr[indexPath.row].title)"
        
        return cell
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
