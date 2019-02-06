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
        //        enum CodingKeys: String, CodingKey {
        //            case hotels = "hotels"
        //        }
    }
    struct Hotel :Decodable{
        let id:Int
        let hotelName:String
        let area:String
        let star:Int
        let numberOfRoom:Int

//        enum CodingKeys: String, CodingKey {
//            case id = "id"
//            case hotelName = "hotelName"
//            case area = "area"
//            case star = "star"
//            case numberOfRoom = "numberOfRoom"
//        }

        
        
    }

    var hotelArray = [Hotel]()
    @IBOutlet var tbView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = Bundle.main.url(forResource: "hotels", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let loadhotel = try JSONDecoder().decode(HT.self, from: data)
                print(loadhotel.hotels[0].area)
                self.hotelArray = loadhotel.hotels
               // DispatchQueue.main.async {
                self.tbView.reloadData()
                    
            //    }
                
            }catch{
                print(error)
            }
        }else{
            print("Invalid filename/path.")
        }
        
       
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


    @IBOutlet weak var testtt: UIButton!
    @IBAction func testBtn(_ sender: UIButton) {
        if testtt.isSelected{
            testtt.setBackgroundImage(#imageLiteral(resourceName: "st1"), for: .normal)}
        else{
            testtt.setBackgroundImage(#imageLiteral(resourceName: "st2"), for: .normal)
        }
        testtt.isSelected = !testtt.isSelected
        }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return hotelArray.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as?HotelTableViewCell else{return UITableViewCell()}

        cell.NameLbl.text = hotelArray[indexPath.row].hotelName

        return cell
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let myDetailViewController = segue.destination as! DetailViewController
//
//
//    }
    

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = tableView.indexPathForRow
        if let _ = tableView.cellForRow(at: indexPath as IndexPath){
            
        }
    }
    @IBOutlet weak var OkBtnn: UIButton!
    @IBOutlet weak var SFBtn1: UIButton!
    @IBAction func SFBtn(_ sender: Any) {
        self.view.addSubview(popOver)
        popOver.center = self.view.center
        
    }
    
    @IBOutlet weak var switchBtno: UISwitch!
    
    @IBAction func switchBtn(_ sender: Any) {
   
        if switchBtno.isOn == true {
            hotelArray.sort(){$0.hotelName < $1.hotelName}
            }
        else if switchBtno.isOn == false{
            hotelArray.shuffle()
        }
        }
    
//            if OkBtnn.isEnabled  {
//                tbView.reloadData()
//                self.popOver.removeFromSuperview()
            
        
    
    
    @IBAction func OkBtn(_ sender: Any) {
        tbView.reloadData()
        self.popOver.removeFromSuperview()
    }
    
    @IBOutlet var popOver: UIView!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetail"{
                let destination = segue.destination as! DetailViewController
                if let indexPath = self.tableView.indexPathForSelectedRow{
        
                destination.titel1 = hotelArray[indexPath.row].hotelName
                destination.area1 = hotelArray[indexPath.row].area
                destination.star1 = hotelArray[indexPath.row].star
                destination.nor1 = hotelArray[indexPath.row].numberOfRoom
                    
            }
        
 
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
    }//end func prepare
    
        
//    @IBOutlet weak var testSwitchBtn: UISwitch!
//
//    @IBAction func testSwitch(sender: UISwitch) {
//        if sender.isOn{
//            hotelArray.sort() { $0.hotelName < $1.hotelName }
//            print(hotelArray)
//
//            self.tbView.reloadData()
//        }
//            else{
//                self.tbView.reloadData()
//            }
//
//
//     testSwitchBtn.addTarget(self, action: #selector(testSwitch(sender: )), for: UIControl.Event.valueChanged)
//

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}//END OF CLSASS//
