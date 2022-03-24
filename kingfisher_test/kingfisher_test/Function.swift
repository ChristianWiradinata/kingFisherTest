//
//  Function.swift
//  kingfisher_test
//
//  Created by Christian Wiradinata on 24/03/22.
//

import Foundation
import SwiftSoup


class infoKini {
    var image: String = ""
    var title: String = ""
}

var arr = [infoKini]()

func getData() {
    if let url = URL(string: "https://blog.danakini.co.id/index.php/press-release-2/") {
        do {
            let html = try String(contentsOf: url)
            let doc: Document = try SwiftSoup.parse(html)
            let imageURLS: Elements = try! doc.getElementsByClass("item news-block-hover_Effect")
            let titleURLS: Elements = try! doc.getElementsByClass("post-title")
            
            for image in imageURLS{
                let str = try image.attr("style")
                let start = str.index(str.startIndex, offsetBy: 21)
                let end = str.index(str.startIndex, offsetBy: str.count-2)
                let range = start...end
                
                let theImages = String(str[range])
                let data = infoKini()
                data.image = theImages
                data.title = ""
                arr.append(data)
            }
            
            var y: Int = 0
            for title in titleURLS{
                arr[y].title = "\(try title.text())"
                y+=1
            }
        } catch {
            print("Catch Error")
        }
    } else {
        print("Failed to connect to URL")
    }
    
    
}
