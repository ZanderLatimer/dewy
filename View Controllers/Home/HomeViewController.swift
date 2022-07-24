//
//  HomeViewController.swift
//  Dewy
//
//  Created by Vanessa Putnam on 7/24/22.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    class func viewController() -> HomeViewController {
        let storyboard = UIStoryboard(name: "HomeViewController", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}
