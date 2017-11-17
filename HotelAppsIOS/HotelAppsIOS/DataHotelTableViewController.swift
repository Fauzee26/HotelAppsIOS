//
//  DataHotelTableViewController.swift
//  HotelAppsIOS
//
//  Created by Muhammad Hilmy Fauzi on 17/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class DataHotelTableViewController: UITableViewController {
    
    var hotel : [Hotel] = [] //this data taked from entity name
    var hotelnameSelected:String?
    var hotelalamatSelected:String?
    var hotelrateSelected:String?
    var hotelfasilitasSelected:String?
    var hotellokasiSelected:String?
    var hotelratingaaSelected:String?

    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return hotel.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DataHotelTableViewCell

        let dataTask = hotel[indexPath.row]
        if let myDataTask = dataTask.nama_hotel {
            cell.lblNamaHotel.text = myDataTask
        }
        if let myDataTask1 = dataTask.alamat {
            cell.lblAlamat.text = myDataTask1
        }
        if let myDataTask2 = dataTask.rate{
            cell.lblRate.text = myDataTask2 + "/10"
        }
        if let myDataTask3 = dataTask.rateHuruf{
            cell.lblRateHuruf.text = myDataTask3
        }
        
//        cell.lblRateHuruf.text == "Good"
        
        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        //memanggil method getData
        getData()
        //memanggil reloadData
        tableView.reloadData()
    }
    func getData() {
        //mengecek apakah ada error atau tidak
        do{
            //kondisi kalau tidak ada error
            //maka akan request download data
            hotel = try context.fetch(Hotel.fetchRequest())
        }
        catch{
            //kondisi apabila error fetch data
            print("Fetching Failed")
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        //mengece menu swipe bila edit data
        if editingStyle == .delete {
            let task = hotel[indexPath.row]
            context.delete(task)
            //Delete data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do{
                //retrieve data
                hotel = try context.fetch(Hotel.fetchRequest())
            }
            catch{
                print("Fetching Failed")
            }
        }
        //load data again
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        print("Row \(indexPath.row)selected")
        
        let dataTask = hotel[indexPath.row]
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        hotelnameSelected = dataTask.nama_hotel
        hotelalamatSelected = dataTask.alamat
        hotelrateSelected = dataTask.rate
        hotelfasilitasSelected = dataTask.fasilitas
        hotellokasiSelected = dataTask.lokasi_terdekat
        hotelratingaaSelected = dataTask.rateHuruf
        //memamnggil segue passDataDetail
        performSegue(withIdentifier: "passData", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak
        if segue.identifier == "passData"{

            let sendData = segue.destination as! ViewController
            sendData.passNamaHotel = hotelnameSelected
            sendData.passAlamat = hotelalamatSelected
            sendData.passRatingAngka = hotelrateSelected
            sendData.passFasilitas = hotelfasilitasSelected
            sendData.passlokasiTerdekat = hotellokasiSelected
            sendData.passRatingHuruf = hotelratingaaSelected
        }
    }
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
