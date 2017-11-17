//
//  ViewController.swift
//  HotelAppsIOS
//
//  Created by Muhammad Hilmy Fauzi on 17/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelNamaHotel: UILabel!
    @IBOutlet weak var labelAlamat: UILabel!
    @IBOutlet weak var labelRatingAngka: UILabel!
    @IBOutlet weak var labelRatingHuruf: UILabel!
    @IBOutlet weak var labelFasilitas: UILabel!
    @IBOutlet weak var labelLokasi: UILabel!
    
    var passNamaHotel:String?
    var passAlamat:String?
    var passRatingAngka:String?
    var passRatingHuruf:String?
    var passFasilitas:String?
    var passlokasiTerdekat:String?

    override func viewDidLoad() {
        labelNamaHotel.text = passNamaHotel!
        labelAlamat.text = passAlamat!
        labelRatingAngka.text = passRatingAngka! + "/10"
        labelRatingHuruf.text = passRatingHuruf!
        labelFasilitas.text = "Facility: " + passFasilitas!
        labelLokasi.text = "Nearby Location: " + passlokasiTerdekat!

        if labelRatingAngka.text! == "4" {
            labelRatingHuruf.text! = "Good"
        }else if labelRatingAngka.text! == "5" {
            labelRatingHuruf.text! = "Good"
        }else if labelRatingAngka.text! == "6" {
            labelRatingHuruf.text! = "Very Good"
        }else if labelRatingAngka.text! == "7" {
            labelRatingHuruf.text! = "Very Good"
        }else if labelRatingAngka.text! == "8" {
            labelRatingHuruf.text! = "Very Good"
        }else if labelRatingAngka.text! == "9" {
            labelRatingHuruf.text! = "Very Good"
        }else{
            labelRatingHuruf.text! = "Excellant"
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

