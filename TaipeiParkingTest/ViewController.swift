//
//  ViewController.swift
//  TaipeiParkingTest
//
//  Created by 陳暘璿 on 2022/4/14.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var parkTableView: UITableView!
    var parkData  : ParkModel?
    var jsonTask = JsonTask()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.parkTableView.delegate = self
        self.parkTableView.dataSource = self

        self.parkTableView.register(UINib(nibName: "ParkTableViewCell", bundle: nil), forCellReuseIdentifier: "ParkTableViewCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        self.parkData = self.jsonTask.readLocalFile(forName: "TCMSV_alldesc")!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.parkData?.data.park.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.parkTableView.dequeueReusableCell(withIdentifier: "ParkTableViewCell") as! ParkTableViewCell
        let park = self.parkData?.data.park[indexPath.row]
        cell.nameLabel.text = park?.name
        cell.telLabel.text = park?.tel
        cell.addressLabel.text = park?.address
        return cell
    }
    


}

