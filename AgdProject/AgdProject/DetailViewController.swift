//
//  DetailViewController.swift
//  AgdProject
//
//  Created by Suwatchai on 2/2/2562 BE.
//  Copyright © 2562 suwatchai kiatchalermporn. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDelegate{

    @IBOutlet weak var TitleLbl: UILabel!
    @IBOutlet weak var AreaLbl: UILabel!
    @IBOutlet weak var StarLbl: UILabel!
    @IBOutlet weak var NorLbl: UILabel!
    
    
    var title1 = ""
    var area1 = ""
    var star1 = 0
    var nor1 = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        
self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)
        TitleLbl.text = title1
        AreaLbl.text = area1
        StarLbl.text = String(star1)
        NorLbl.text = String(nor1)
    }
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        var TitleLbl:String!
//        var AreaLbl:Int!
//        var StarLbl:Int!
//        var NotLbl:Int!
//
//    }
//

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
