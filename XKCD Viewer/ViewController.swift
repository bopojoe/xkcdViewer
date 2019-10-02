//
//  ViewController.swift
//  XKCD Viewer
//
//  Created by 20074556 on 02/10/2019.
//  Copyright © 2019 20074556. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
var pictures = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items where item.hasSuffix(".png") {
            pictures.append(item)
        }
        // Do any additional setup after loading the view, typically from a nib.
        print(pictures)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        .replacingOccurrences(of:".png", with: "")
        .components(separatedBy:"_") [2...]
        .joined(separator: " ")
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

