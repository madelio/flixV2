//
//  MovieDetailsViewController.swift
//  FlixV2
//
//  Created by Madel Asistio on 11/18/17.
//  Copyright © 2017 Madel Asistio. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var backdropImageView: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleLabel: UILabel!
    var movie = Movie()
    
    override func viewDidLoad() {
        
        scrollView.delegate = self
        scrollView.isScrollEnabled = true
        
        super.viewDidLoad()
        
        posterImageView.af_setImage(withURL: movie.posterURL!)
        backdropImageView.af_setImage(withURL: movie.backdropURL!)
        releaseDateLabel.text = movie.releaseDate
        overviewLabel.text = movie.overview
        titleLabel.text = movie.title
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
