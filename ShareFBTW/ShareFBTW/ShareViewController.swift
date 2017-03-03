//
//  ShareViewController.swift
//  ShareFBTW
//
//  Created by Rome Rock on 3/3/17.
//  Copyright © 2017 Rome Rock. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func shareFacebookButtonPressed(_ sender: Any) {
        /*
         
         //in the case of FB, their SDK doesn't allows you to wrote something on behalf of the user, so you can sent a picture or link, like this case
         
        let linkContent:FBSDKShareLinkContent = FBSDKShareLinkContent()
        linkContent.contentURL = URL(string: "<URL>")
         //this code will shows you the popup, for the results you must override the methods for FBSDKSharingDelegate
        FBSDKShareDialog.show(from: self, with: linkContent, delegate: self)
        */
        
        UserDefaults.standard.set(true, forKey: "facebookShare")
        UserDefaults.standard.synchronize()
        NotificationCenter.default.post(name: .fullVersion, object: nil)
        dismiss(animated: true, completion: nil)
    }
    /*
     //methods for the FBSDKSharingDelegate
    // MARK: - FBSDKSharingDelegate Methods
    
    func sharer(_ sharer: FBSDKSharing!, didCompleteWithResults results: [AnyHashable : Any]!) {
        print("post FB composition Complete")
        //you can ignore this two lines bellow, sometimes in your app you want to do some stuff with UI, and when the sharing is in process, put a black view, so if you want to do something with the UI specifically shows a new view you may want to add this code
        let when = DispatchTime.now() + 1.5
        DispatchQueue.main.asyncAfter(deadline: when) {
            //unlock stuff
        }
        
    }
    
    func sharer(_ sharer: FBSDKSharing!, didFailWithError error: Error!) {
        //handle the error
        print("post FB composition Failed")
    }
    
    func sharerDidCancel(_ sharer: FBSDKSharing!) {
        print("post FB composition cancelled")
    }
    */
    
    @IBAction func shareTwitterButtonPressed(_ sender: Any) {
        /*
        let composer = TWTRComposer()
        
        composer.setText("Hello")
        // Called from a UIViewController
        composer.show(from: self) { result in
            
            if (result == TWTRComposerResult.cancelled) {
                print("Tweet composition cancelled")
            }
            if (result == TWTRComposerResult.done) {
                print("Sending tweet!")
                //unlock something, the tweet was send
            }
        }
        */
        
        UserDefaults.standard.set(true, forKey: "twitterShare")
        UserDefaults.standard.synchronize()
        NotificationCenter.default.post(name: .fullVersion, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func noButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch? = touches.first
        let touchLocation = touch?.location(in: self.view)
        let contentViewFrame = self.view.convert(contentView.frame, from: contentView.superview)
        if !contentViewFrame.contains(touchLocation!) {
            dismiss(animated: true, completion: nil)
        }
        
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
