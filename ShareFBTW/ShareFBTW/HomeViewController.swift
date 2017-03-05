//
//  HomeViewController.swift
//  ShareFBTW
//
//  Created by Rome Rock on 3/3/17.
//  Copyright © 2017 Rome Rock. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet var contentView: UIView!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var facebookCheckImageView: UIImageView!
    @IBOutlet var twitterCheckImageView: UIImageView!
    @IBOutlet var restoreButton: UIButton!
    
    @IBOutlet var menuItem: UIBarButtonItem!
    var titleLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if self.revealViewController() != nil {
            menuItem.target = self.revealViewController()
            menuItem.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController().panGestureRecognizer().delegate = self
        }
        
        titleLabel = UILabel()
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.white
        titleLabel.text = "MM: Share and get rewarded"
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
        
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 1)
        contentView.layer.shadowOpacity = 0.4
        contentView.layer.shadowRadius = 0
        contentView.layer.cornerRadius = 2
        
        setFullVersion()
        
        NotificationCenter.default.addObserver(self, selector: #selector(HomeViewController.setFullVersion), name: .fullVersion, object: nil)
    }
    
    func setFullVersion() {
        var twitterShare = false
        
        if UserDefaults.standard.object(forKey: "twitterShare") != nil {
            twitterShare = UserDefaults.standard.bool(forKey: "twitterShare")
        }
        
        var facebookShare = false
        
        if UserDefaults.standard.object(forKey: "facebookShare") != nil {
            facebookShare = UserDefaults.standard.bool(forKey: "facebookShare")
        }
        
        facebookCheckImageView.isHidden = !facebookShare
        twitterCheckImageView.isHidden = !twitterShare
        
        let colorText = (twitterShare || facebookShare) ? "343434" : "7E7E7E"
        let text = (twitterShare || facebookShare) ? "ON" : "OFF"
        
        statusLabel.textColor = UIColor(hex: colorText)
        statusLabel.text = text
        
        restoreButton.isEnabled = (twitterShare || facebookShare)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func restoreButtonPressed(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "twitterShare")
        UserDefaults.standard.set(false, forKey: "facebookShare")
        UserDefaults.standard.synchronize()
        NotificationCenter.default.post(name: .fullVersion, object: nil)
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
