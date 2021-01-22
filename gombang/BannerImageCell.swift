//
//  BannerImageCell.swift
//  gombang
//
//  Created by 정나눔 on 2021/01/22.
//

import UIKit

class BannerImageCell: UICollectionViewCell {
    var bannerImage: UIImageView={
        let bannerImage=UIImageView()
        bannerImage.translatesAutoresizingMaskIntoConstraints=false
        return bannerImage
    }()
    override init(frame: CGRect) {
            super.init(frame: frame)
           // initialize what is needed
        imageSetting()
        }
     
        required init?(coder: NSCoder) {
            super.init(coder: coder)
         
            self.isUserInteractionEnabled = true
           // initialize what is needed
        }
     
        
        func imageSetting(){
            //셀에 위에서 만든 이미지 뷰 객체를 넣어준다.
            addSubview(bannerImage)
            //제약조건 설정하기
            bannerImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            bannerImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            bannerImage.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            bannerImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            //myImage.widthAnchor.constraint(equalToConstant: 0).isActive = true
            //myImage.heightAnchor.constraint(equalToConstant: 0).isActive = true
        }
}
