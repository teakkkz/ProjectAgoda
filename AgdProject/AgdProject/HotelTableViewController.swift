//
//  HotelTableViewController.swift
//  AgdProject
//
//  Created by Suwatchai on 2/2/2562 BE.
//  Copyright © 2562 suwatchai kiatchalermporn. All rights reserved.
//

import UIKit
class HotelTableViewController: UITableViewController {
    struct HT:Decodable{
        let hotels:[Hotel]
    }
    struct Hotel :Decodable{
        let id:Int
        let hotelName:String
        let area:String
        let star:Int
        let numberOfRoom:Int
    }

    var hotelArray = [Hotel]()
    var filteredArray = [Hotel]()
    var oneStarArray = [Hotel]()
    var twoStarArray =  [Hotel]()
    var threeStarArray = [Hotel]()
    var fourStarArray = [Hotel]()
    var fiveStarArray = [Hotel]()
    
    @IBOutlet var tbView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = Bundle.main.url(forResource: "hotels", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let loadhotel = try JSONDecoder().decode(HT.self, from: data)
                print(loadhotel.hotels[0].area)
                self.hotelArray = loadhotel.hotels
                self.tbView.reloadData()
            }catch{
                print(error)
            }
        }else{
            print("Invalid filename/path.")
        }

        tableView.backgroundView = UIImageView(image: UIImage(named: "bg.jpg"))

        oneStarArray = hotelArray.filter(){$0.star == 1}
        twoStarArray = hotelArray.filter(){$0.star == 2}
        threeStarArray = hotelArray.filter(){$0.star == 3}
        fourStarArray = hotelArray.filter(){$0.star == 4}
        fiveStarArray = hotelArray.filter(){$0.star == 5}
    }

 
    // MARK: - Table view data source

    @IBOutlet weak var staroneBtn: UIButton! //1
    @IBOutlet weak var startwoBtn: UIButton! //2
    @IBOutlet weak var starthreeBtn: UIButton!//3
    @IBOutlet weak var starfourBtn: UIButton!//4
    @IBOutlet weak var starfiveBtn: UIButton! //5
//isSelected function
    @IBAction func oneTapped(_ sender: Any) {
        if staroneBtn.isSelected{
            staroneBtn.setBackgroundImage(#imageLiteral(resourceName: "1s"), for: .normal)
            filteredArray.removeAll(){$0.star == 1}
        }else {
            staroneBtn.setBackgroundImage(#imageLiteral(resourceName: "1st"), for: .normal)
            filteredArray += oneStarArray
            
        }
        staroneBtn.isSelected = !staroneBtn.isSelected
    }
    @IBAction func twoTapped(_ sender: Any) {
        if startwoBtn.isSelected{
            startwoBtn.setBackgroundImage(#imageLiteral(resourceName: "2s"), for: .normal)
            filteredArray.removeAll(){$0.star == 2}
        }else {
            startwoBtn.setBackgroundImage(#imageLiteral(resourceName: "2st"), for: .normal)
            filteredArray += twoStarArray
        }
        startwoBtn.isSelected = !startwoBtn.isSelected
    }
    @IBAction func threeTapped(_ sender: Any) {
        if starthreeBtn.isSelected{
            starthreeBtn.setBackgroundImage(#imageLiteral(resourceName: "3s"), for: .normal)
            filteredArray.removeAll(){$0.star == 3}
            
        }else {
            starthreeBtn.setBackgroundImage(#imageLiteral(resourceName: "3st"), for: .normal)
            filteredArray += threeStarArray
        }
        starthreeBtn.isSelected = !starthreeBtn.isSelected
    }
    @IBAction func fourTapped(_ sender: Any) {
        if starfourBtn.isSelected{
            starfourBtn.setBackgroundImage(#imageLiteral(resourceName: "4s"), for: .normal)
            filteredArray.removeAll(){$0.star == 4}
        }else {
            starfourBtn.setBackgroundImage(#imageLiteral(resourceName: "4st"), for: .normal)
            filteredArray += fourStarArray
        }
        starfourBtn.isSelected = !starfourBtn.isSelected
    }
    @IBAction func fiveTapped(_ sender: Any) {
        if starfiveBtn.isSelected{
            starfiveBtn.setBackgroundImage(#imageLiteral(resourceName: "5s"), for: .normal)
            filteredArray.removeAll(){$0.star == 5}
        }else {
            starfiveBtn.setBackgroundImage(#imageLiteral(resourceName: "5st"), for: .normal)
            filteredArray += fiveStarArray
        }
        starfiveBtn.isSelected = !starfiveBtn.isSelected
    }
    
  
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if filteredArray.isEmpty{
            return hotelArray.count
            
        }else{
            return filteredArray.count
        }
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? HotelTableViewCell else{return UITableViewCell()}
        cell.backgroundColor = UIColor.clear

        
        if filteredArray.isEmpty{
        cell.NameLbl.text = hotelArray[indexPath.row].hotelName
        }else{
            cell.NameLbl.text = filteredArray[indexPath.row].hotelName

        
        }
        return cell
    }

    @IBOutlet weak var OkBtnn: UIButton!
    @IBOutlet weak var SFBtn1: UIButton!
    @IBAction func SFBtn(_ sender: Any) {
        popOver.center = view.center
        self.popOver.alpha = 1

        self.view.addSubview(popOver)
        self.popOver.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear , animations: {
            
            self.popOver.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
    
    @IBOutlet weak var switchBtno: UISwitch!
    @IBAction func switchBtn(_ sender: Any) {
    }
    @IBAction func OkBtn(_ sender: Any) {
        
        self.popOver.transform = CGAffineTransform(scaleX: 1, y: 1)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear , animations: {
            
            self.popOver.transform = CGAffineTransform(scaleX: 0, y: 0)
        }, completion: nil)
        
        if filteredArray.isEmpty{
            if switchBtno.isOn {
                hotelArray.sort(){$0.hotelName < $1.hotelName}
            }else{
                hotelArray.shuffle()
            }
        }else{
            if switchBtno.isOn{
                filteredArray.sort(){$0.hotelName < $1.hotelName}
            }else{
                filteredArray.shuffle()
            }
        }
        
        self.tbView.reloadData()
        self.popOver.removeFromSuperview()
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        self.popOver.removeFromSuperview()
    }

    @IBOutlet var popOver: UIView!
    
    override func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetail"{
                let destination = segue.destination as! DetailViewController
                if let indexPath = self.tableView.indexPathForSelectedRow{
                    if filteredArray.isEmpty{
                destination.title1 = hotelArray[indexPath.row].hotelName
                destination.area1 = hotelArray[indexPath.row].area
                destination.star1 = hotelArray[indexPath.row].star
                destination.nor1 = hotelArray[indexPath.row].numberOfRoom
                    }else{
                        destination.title1 = filteredArray[indexPath.row].hotelName
                        destination.area1 = filteredArray[indexPath.row].area
                        destination.star1 = filteredArray[indexPath.row].star
                        destination.nor1 = filteredArray[indexPath.row].numberOfRoom
                }
            }
        }
    }//end func prepare
}//END of class
