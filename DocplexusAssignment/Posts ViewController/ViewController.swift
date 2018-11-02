//
//  ViewController.swift
//  DocplexusAssignment
//
//  Created by asmita.borawake on 01/11/18.
//  Copyright © 2018 asmita.borawake. All rights reserved.
//

import UIKit
import AlamofireImage
class ViewController: UIViewController {
    //MARK: Properties
  var postsViewModel = PostsViewModel()
    
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var postsTableView: UITableView!
    var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle:
        UIActivityIndicatorViewStyle.whiteLarge)
    //MARK: ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupUI()
        fetchPostsData()
    }
    
   
    //MARK: Funcations & Methods
    
   func  setupUI(){
    
    postsTableView.delegate = self
    postsTableView.dataSource = self
    //register cell with xib
    let nibName = UINib(nibName: postsCell , bundle: nil)
    postsTableView.register(nibName, forCellReuseIdentifier: cellIdentifier)
    postsTableView.rowHeight = UITableViewAutomaticDimension
    postsTableView.estimatedRowHeight = 200
    
    activityIndicator.color = UIColor.darkGray
     editBtn.applyShadow(cornerRadius: 5, color: UIColor.lightGray, opacity: 0.5, offsetWidth: 0, offsetHeight: 0)
    }

    
    //fetch posts data
    func fetchPostsData() {
        startRefreshing()
        postsViewModel.fetchCalendarYearData { (completed, error) in
            if completed{
                self.stopRefreshing()
             self.postsTableView.reloadData()
                print(self.postsViewModel.postsModelClass.count)
            }else if error != nil {
                print(error!)
            }else {
                self.stopRefreshing()
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    func startRefreshing() -> Void {
        postsTableView.backgroundView = activityIndicator
        activityIndicator.startAnimating()
    }
    
    func stopRefreshing() -> Void {
        activityIndicator.stopAnimating()
        postsTableView.backgroundView = nil
    }

}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsViewModel.postsModelClass.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postsTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PostsCell
        
        let postsData = postsViewModel.postsModelClass[indexPath.row]
        cell.autherName.text = postsData.user.authorName
        cell.therapeuticsName.attributedText = postsViewModel.name(postName: postsData)
        cell.viewCountLbl.text = "\(String(postsData.viewCount)) Views"
        cell.voteCountLbl.text = "\(String(postsData.voteCount)) Votes"
        cell.answerCountLbl.text = "\(String(postsData.answerCount)) Comment"
        cell.detialsText.attributedText = postsViewModel.infoTextForCell(postsData: postsData)
        if !postsData.featuredAttachmentUrl.isEmpty {
            let url = URL(string: postsData.featuredAttachmentUrl)
            let height = postsData.featuredAttachmentHeigth
            cell.autherImgHeightConstraint.constant = CGFloat(height)
            let width =  postsData.featuredAttachmentWidth
            cell.autherImgWidthConstraint.constant = CGFloat(width)
            cell.autherImg.af_setImage(withURL: url!)
        }else {
            cell.autherImgHeightConstraint.constant = 0
            cell.autherImgWidthConstraint.constant = 0
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
}

