//
//  UIImageView+Extension.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/23.
//  Copyright © 2019 Annie. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func getLocalImage(path imageName: String) {
        
        let image = UIImage.init(imageLiteralResourceName: imageName)
        self.image = image
        self.backgroundColor = .clear
        
//        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
//        let nsUserDomainMask    = FileManager.SearchPathDomainMask.userDomainMask
//        let paths               = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
//        if let dirPath          = paths.first
//        {
//
//            //            let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("\(imageName).png")
//            let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("koutsu_00001.png")
//            //            let image    = UIImage(contentsOfFile: imageURL.path)
//            // Do whatever you want with the image
//            var imageData : Data?
//            do {
//                imageData = try Data(contentsOf: imageURL)
//            } catch {
//                print(error.localizedDescription)
//                return
//            }
//
//            guard let dataOfImage = imageData else { return }
//            guard let image = UIImage(data: dataOfImage) else { return }
//
//            self.image = image
//        }
//        self.backgroundColor = .gray
        
    }
}
