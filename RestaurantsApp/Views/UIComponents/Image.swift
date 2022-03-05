//
//  Image.swift
//  RestaurantsApp
//
//  Created by Kumail kashefi on 05/03/2022.
//

import Foundation
import UIKit

class ImageView {
    
    static var sharedInstance = ImageView()
    private init(){}
    
    func getImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.white
        imageView.image = UIImage(named: "placeHolder")
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 200)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    func setImage(urlString: String?, imageView: UIImageView) {
        
        if let url = URL.init(string: urlString ?? "") {
            
            imageView.sd_setImage(with : url , placeholderImage : UIImage.init(named: "placeHolder") , options : .allowInvalidSSLCertificates) { ( image , error , type , url ) in
                
                guard error == nil else {
                    imageView.image = UIImage.init(named: "placeHolder")
                    return
                }
                
                guard let img = image else{
                    imageView.image = UIImage.init(named: "placeHolder")
                    return
                }
                
                imageView.image = img
            }
        }
    }
    
}
