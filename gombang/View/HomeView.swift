//
//  HomeView.swift
//  gombang
//
//  Created by 정나눔 on 2021/01/22.
//

import UIKit

class HomeView: UIViewController {

    //MARK: View생성
    var bannerImageView: UICollectionView = {
        let layout=UICollectionViewFlowLayout()
        let bannerImageView=UICollectionView(frame: .init(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        bannerImageView.translatesAutoresizingMaskIntoConstraints=false
        bannerImageView.backgroundColor = .white
        
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing=1
        bannerImageView.showsHorizontalScrollIndicator=false
        
        bannerImageView.frame=CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 85)
        
        return bannerImageView
    }()
    
    var popularClubListView: UICollectionView = {
        let layout=UICollectionViewFlowLayout()
        let popularClubListView=UICollectionView(frame: .init(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        popularClubListView.translatesAutoresizingMaskIntoConstraints=false
        popularClubListView.backgroundColor = .white
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        layout.scrollDirection = .horizontal
        popularClubListView.showsHorizontalScrollIndicator=false
        
        popularClubListView.frame=CGRect(x: 0, y: 250, width: UIScreen.main.bounds.width, height: 163)
        
        return popularClubListView
    }()
    
    var likeClubListView: UITableView={
        let likeClubListView=UITableView()
        likeClubListView.translatesAutoresizingMaskIntoConstraints=false
        likeClubListView.frame=CGRect(x: 0, y: 480, width: UIScreen.main.bounds.width, height: 1000)
        return likeClubListView
    }()
    
    //MARK: view안에 들어갈 list(data)
    var bannerImage=["이벤트배너1.png"]
    var popularClubImage=["홍보이미지.png","이미지.jpg","홍보이미지.png","홍보이미지.png","홍보이미지.png"]
    var nowPage: Int = 0
    
    var likeClubList=["1","1","1","1","1","1","1","1","1","1","1","1"]
    
    //MARK: view
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        navigationBar()
        bannerImageViewSetting()
        popularClubLabelView()
        popularClubListViewSetting()
        likeClubLabelView()
        likeClubListViewSetting()
    }
    
    //MARK: label view 생성
    func popularClubLabelView(){
        let popularClubLabel=UILabel()
        popularClubLabel.font = UIFont.systemFont(ofSize: 18.0)
        popularClubLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        popularClubLabel.text="#인기 동아리"
        popularClubLabel.frame=CGRect(x: 15, y: 210, width: view.frame.width, height: 30)
        
        view.addSubview(popularClubLabel)
    }
    
    func likeClubLabelView(){
        let likeClubLabel=UILabel()
        likeClubLabel.font = UIFont.systemFont(ofSize: 18.0)
        likeClubLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        likeClubLabel.text="#즐겨찾기"
        likeClubLabel.frame=CGRect(x: 15, y: 440, width: view.frame.width, height: 30)
        
        view.addSubview(likeClubLabel)
    }

    //MARK: navigation custom
    func navigationBar(){ //네비게이션 커스텀
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    
        let titleView=UIView() //네이게이션 titleView에 이미지와 라벨 집어넣기 위한 view
        titleView.backgroundColor=UIColor.white
        titleView.frame=CGRect(x: 0, y: 0, width: view.frame.width, height: 30)
        
        let logoImageView=UIImageView() //이미지 뷰를 만듬
        let logoimage=UIImage(named: "곰방-로고.png")
        logoImageView.frame=CGRect(x: 10, y: 0, width: 30, height: 30)
        logoImageView.image=logoimage
        titleView.addSubview(logoImageView) //이미지 뷰를 titleview에 삽입
        
        let gombangText=UILabel() //라벨 뷰를 만듬
        gombangText.textColor=UIColor.black
        gombangText.text="Gombang"
        gombangText.frame = CGRect(x: 50, y: 0, width: 150, height: 30)
        gombangText.font = UIFont.systemFont(ofSize: 20.0)
        gombangText.font = UIFont.boldSystemFont(ofSize: 20.0)
        titleView.addSubview(gombangText) //라벨 뷰를 titleview에 삽입
        
        navigationItem.titleView=titleView //적용
    }
    
    func bannerImageViewSetting(){
        self.view.addSubview(self.bannerImageView)
        
        self.bannerImageView.dataSource=self
        self.bannerImageView.delegate=self
        self.bannerImageView.register(BannerImageCell.self, forCellWithReuseIdentifier: "cell")
        bannerTimer()
    }
    
    func popularClubListViewSetting(){
        self.view.addSubview(self.popularClubListView)
        
        self.popularClubListView.dataSource=self
        self.popularClubListView.delegate=self
        self.popularClubListView.register(PopularClubListCell.self, forCellWithReuseIdentifier: "popularcell")
    }
    
    func likeClubListViewSetting() {
        self.view.addSubview(self.likeClubListView)
        /*self.likeClubListView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive=true
        self.likeClubListView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive=true
        self.likeClubListView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive=true
        self.likeClubListView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -150).isActive=true*/
        
        self.likeClubListView.dataSource=self
        self.likeClubListView.delegate=self
        //self.likeClubListView.register(ClubTableViewCell.self, forHeaderFooterViewReuseIdentifier: "tablecell")
        
        self.likeClubListView.register(LikeClubListCell.self, forCellReuseIdentifier: "tablecell")
    }
    
    func bannerTimer() {
            let _: Timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (Timer) in
                self.bannerMove()
            }
        }
        // 배너 움직이는 매서드
        func bannerMove() {
            // 현재페이지가 마지막 페이지일 경우
            if nowPage == bannerImage.count-1 {
            // 맨 처음 페이지로 돌아감
                bannerImageView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
                nowPage = 0
                return
            }
            // 다음 페이지로 전환
            nowPage += 1
            bannerImageView.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
        }
}

//MARK: collectionview delegate & datasource, flowlayout
extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView==bannerImageView{
            return bannerImage.count
        }
        else if collectionView==popularClubListView{
            return popularClubImage.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView==bannerImageView){
            guard let cell: BannerImageCell=self.bannerImageView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? BannerImageCell else {
                return UICollectionViewCell()
            }
            cell.backgroundColor = .white
            cell.bannerImage.image = UIImage(named: bannerImage[indexPath.row])
            
            return cell
        }
        
        else{
            guard let cell: PopularClubListCell=self.popularClubListView.dequeueReusableCell(withReuseIdentifier: "popularcell", for: indexPath) as? PopularClubListCell else {
                return UICollectionViewCell()
            }
            cell.backgroundColor = .white
            cell.popularClubImage.image = UIImage(named: popularClubImage[indexPath.row])
            cell.popularClubImage.layer.cornerRadius = 20
            cell.popularClubImage.clipsToBounds = true
            
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            var size=CGSize()
            if collectionView==bannerImageView{
                size=CGSize(width:view.frame.width, height:  bannerImageView.frame.height)
                return size
            }
            else if collectionView==popularClubListView{
                size=CGSize(width:popularClubListView.frame.height, height:popularClubListView.frame.height)
            }
            return size//collectionView cell크기
        }
        //옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView==bannerImageView{
            return 0
        }
        else if collectionView==popularClubListView{
            return 10
        }
            return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView==bannerImageView{
            return 0
        }
        else if collectionView==popularClubListView{
            return 0
        }
            return 0
    }
        
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        }
    }

//MARK: tableview datesource & delegate
extension HomeView:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return likeClubList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tablecell: LikeClubListCell=self.likeClubListView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as? LikeClubListCell else {
            return UITableViewCell()
        }
       //tablecell.clubImage.image = UIImage(named: popularClubImage[indexPath.row])
        tablecell.clubLabel.text=likeClubList[indexPath.row]
        
        return tablecell
    }
}
