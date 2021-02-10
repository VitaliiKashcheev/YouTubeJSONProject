//
//  ViewController.swift
//  YoutubeProject
//
//  Created by Виталий on 1/26/21.
//  Copyright © 2021 Виталий. All rights reserved.
//
//  http://api.openweathermap.org/data/2.5/weather?lat=48.43419751085481&lon=35.052431171121995&appid=b6d62163539082e5da40ee4b38bdd436&units=metric


import Foundation
import UIKit
import youtube_ios_player_helper
import SwiftyJSON
import CoreLocation
import Alamofire
import NVActivityIndicatorView

class ViewController: UIViewController, CLLocationManagerDelegate, YTPlayerViewDelegate {
    
    @IBOutlet weak var clock: UILabel!
    
    @IBOutlet var playerView: YTPlayerView!
    
    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var temp: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var texfild: UITextField!
    
    @IBAction func playButton(_ sender: UIButton) {
        playerView.load(withVideoId: self.texfild.text!, playerVars: ["playsinline": 1])
    }
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var alarmLabel: UILabel!
    
    @IBAction func addAlarm(_ sender: Any) {
        
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "hh:mm"
        let selectedtime: String = formatter.string(from: datePicker.date)
        self.alarmLabel.text = selectedtime
    }
    
    @IBOutlet weak var feelsLike: UILabel!
    
    @IBOutlet weak var status: UILabel!
    
    
    let apiKey = "b6d62163539082e5da40ee4b38bdd436"
    var lat = Double()
    var lon = Double()
    let locationManager = CLLocationManager()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1)
        
        self.texfild.text = "mTLunRuCGQQ"
        
        //MARK: Timer
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        view.addSubview(datePicker)
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        datePicker.setValue(false, forKeyPath: "highlightsToday")
        
        
        //MARK: YoutubePlayer
        
        playerView.delegate = self
        
        //MARK: LocationManager
        
        locationManager.requestWhenInUseAuthorization()
        var currentLoc: CLLocation!
        if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == .authorizedAlways) {
            currentLoc = locationManager.location
            print(currentLoc.coordinate.latitude)
            print(currentLoc.coordinate.longitude)
            lat = currentLoc.coordinate.latitude
            lon = currentLoc.coordinate.longitude
        }
        
        loadData()
    }
    
 
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
 
    
    @objc func updateTime() {
        let currentTime = Date()
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm"
        clock.text = timeFormatter.string(from: currentTime)
        alarm()
        
    }
    
    func alarm(){
        let time = clock.text
        let alarm = alarmLabel.text
        if time == alarm {
            exit(0)
        }
    }
 
}

