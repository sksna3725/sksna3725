//
//  PopularClubListCell.swift
//  gombang
//
//  Created by 정나눔 on 2021/01/22.
//

import UIKit

class PopularClubListCell: UICollectionViewCell {
    var popularClubImage: UIImageView={
        let popularClubImage=UIImageView()
        popularClubImage.translatesAutoresizingMaskIntoConstraints=false
        return popularClubImage
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
            addSubview(popularClubImage)
            //제약조건 설정하기
            popularClubImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            popularClubImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            popularClubImage.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            popularClubImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            //myImage.widthAnchor.constraint(equalToConstant: 0).isActive = true
            //myImage.heightAnchor.constraint(equalToConstant: 0).isActive = true
        }
}
