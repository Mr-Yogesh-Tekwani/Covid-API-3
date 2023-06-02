//
//  ViewController.swift
//  Covid 3
//
//  Created by Yogesh Tekwani on 6/1/23.
//

import UIKit

class ViewController: UIViewController {

    var alld : allData?
    var stateArray = [""]
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "States"
        reqUrl(completionHandler: { data in
            if let aaaa = data{
                self.alld = aaaa
                self.stateArray = Array(self.alld!.keys.sorted())
                //print(stateArray.count)
               print(aaaa)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
        
        self.view.addSubview(tableView)
        tableView.frame = self.view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        
    }
    
    
}


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = stateArray[indexPath.row]
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let key = stateArray[indexPath.row]
        let allDetails = alld![key]
        let svc = SecondViewController()
        svc.l1text = "Date: \(allDetails!.meta.date)"
        svc.l2text = "Population: \(allDetails!.meta.population)"
        svc.l3text = "Positive Cases: \(allDetails!.total.confirmed)"
        navigationController?.show(svc, sender: self)
        
        
    }
}

