//  HomeVC.swift
//  MS
//  Created by Ranjeet Raushan on 15/08/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import UIKit

struct MSM: Decodable{
    let img: String
}

class HomeVC: UIViewController {
  
    @IBOutlet weak var supporttableView: UITableView!
    @IBOutlet weak var saveBrandCollectionView: UICollectionView!
    @IBOutlet weak var topView: UIView!{
        didSet{
            topView.layer.cornerRadius = 15
            
        }
    }
    @IBOutlet weak var viewUnderTopView: UIView!{
           didSet{
               viewUnderTopView.layer.cornerRadius = 15
               
           }
       }
    @IBOutlet weak var allBtn: UIButton!{
        didSet{
             allBtn.layer.cornerRadius = 15
                       allBtn.layer.borderWidth = 1
                       allBtn.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var covid19Btn: UIButton!{
        didSet{
            covid19Btn.layer.cornerRadius = 15
            covid19Btn.layer.borderWidth = 1
            covid19Btn.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var donationBtn: UIButton!{
        didSet{
            donationBtn.layer.cornerRadius = 15
            donationBtn.layer.borderWidth = 1
            donationBtn.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var entertainmentBtn: UIButton!{
        didSet{
            entertainmentBtn.layer.cornerRadius = 15
            entertainmentBtn.layer.borderWidth = 1
            entertainmentBtn.layer.borderColor = UIColor.black.cgColor
        }
    }
  
    var msSeva = [MSM]()
    //Mark:- Search Bar In Navigation Bar
    lazy   var searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 20, y: 0, width: 250, height: 30))

    override func viewDidLoad() {
        super.viewDidLoad()
        supporttableView.delegate = self
        supporttableView.dataSource = self
        saveBrandCollectionView.delegate = self
        saveBrandCollectionView.dataSource = self
        
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        URLSession.shared.dataTask(with: url!){  (data,response,error) in
            if error == nil {
                do{
                    self.msSeva = try JSONDecoder().decode([MSM].self, from: data!)
                }catch{
                    print("Errors")
                }
                DispatchQueue.main.async{
                    print(self.msSeva.count)
                    self.supporttableView.reloadData()
                    self.saveBrandCollectionView.reloadData()
                }
            }
        }.resume()
        
         //Mark:- Search Bar In Navigation Bar
        searchBar.placeholder = "Search Here"
        let leftNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton

        //Mark:- Custom Right Bar Buttom with image and title
        let view = UIView()
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.init(red: 223.0/255.0, green: 223.0/255.0, blue: 223.0/255.0, alpha: 1.0)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.semanticContentAttribute = .forceLeftToRight
        button.setImage(UIImage(named: "promos"), for: .normal)
        button.setTitle("Promos", for: .normal)
        button.addTarget(self, action: #selector(rightBarButton), for: .touchUpInside)
        button.sizeToFit()
        view.addSubview(button)
        view.frame = button.bounds
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: view)
    }
    //Mark:- Custom Right Bar Buttom with image and title
    @objc func rightBarButton(){
        print("Right Bar Button Clicked")
    }
}

// Mark:- Table View
extension HomeVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return msSeva.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SupportCell") as! SupportTableViewCell
        let defaultLink1 = "https://api.opendota.com"
        let completeLink1 = defaultLink1 + msSeva[indexPath.row].img
        cell.supportimageView.downloaded(from: completeLink1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        let verticalPadding: CGFloat = 15
        let maskLayer = CALayer()
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
}
// Mark:- Collection View
extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return msSeva.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "saveBrandCollectionView", for: indexPath) as! SaveBrandCollectionViewCell
        let defaultLink = "https://api.opendota.com"
        let completeLink = defaultLink + msSeva[indexPath.row].img
        cell.collectimage.downloaded(from: completeLink)
        return cell
    }
}
//Mark :- Downloading Image
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
