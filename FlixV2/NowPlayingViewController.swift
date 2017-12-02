//
//  NowPlayingViewController.swift
//  FlixV2
//
//  Created by Madel Asistio on 11/17/17.
//  Copyright © 2017 Madel Asistio. All rights reserved.
//

import UIKit
import AlamofireImage

class NowPlayingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let movieData = MovieDatabase()
    var movies: [Movie]?
   
   // @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        activityIndicator.startAnimating()
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControlEvents.valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
           //activityIndicator.startAnimating()
        movieData.getMovieLibrary() {(result: [Movie]) in
            self.movies = result
        //    print(self.movies)
            self.tableView.reloadData()
            
            self.activityIndicator.stopAnimating()
        }

        // Do any additional setup after loading the view.
    }
    
    func refreshControlAction(_ refreshControl: UIRefreshControl) {
        movieData.getMovieLibrary { (result: [Movie]) in
            self.movies = result
            self.tableView.reloadData()
            refreshControl.endRefreshing()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if movies != nil {
            return movies!.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.titleLabel.text = movies![indexPath.row].title
        cell.posterImageView.af_setImage(withURL: movies![indexPath.row].posterURL!)
        cell.overviewLabel.text = movies![indexPath.row].overview
        
        
        return cell
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let detailsVC = segue.destination as! MovieDetailsViewController
        
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        detailsVC.movie = (movies?[indexPath.row])!
        
    }
    

}
