//
//  LikeClubListCell.swift
//  gombang
//
//  Created by 정나눔 on 2021/01/22.
//

import UIKit

class LikeClubListCell: UITableViewCell {
    var clubImage: UIImageView={
        let clubImage=UIImageView()
        clubImage.translatesAutoresizingMaskIntoConstraints=false
        clubImage.frame=CGRect(x: 10, y: 0, width: 30, height: 30)
        return clubImage
    }()
    
    var clubLabel: UILabel={
        let clubLabel=UILabel()
        clubLabel.translatesAutoresizingMaskIntoConstraints=false
        return clubLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.likeClubListSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func likeClubListSetting(){
        //셀에 위에서 만든 이미지 뷰 객체를 넣어준다.
        self.addSubview(self.clubLabel)
        self.addSubview(self.clubImage)
        //제약조건 설정하기
        
        
        clubImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        clubImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        clubImage.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        clubImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        //myImage.widthAnchor.constraint(equalToConstant: 0).isActive = true
        //myImage.heightAnchor.constraint(equalToConstant: 0).isActive = true
    }
}
