//
//  FeedDisplayController.swift
//  Snapchat Clone
//
//  Created by Yichen Sun on 10/17/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class FeedDisplayController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    @IBAction func unwindToFeedDisplay(_ segue: UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        table.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionName = threadNames[section]
        return threads[sectionName]!.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedDisplayCellTableViewCell
        let sectionName = threadNames[indexPath.section]
        let index = indexPath.row
        let snap = threads[sectionName]![index]
        if snap.read {
            cell.read.image = #imageLiteral(resourceName: "read")
        }
        else {
            cell.read.image = #imageLiteral(resourceName: "unread")
        }
        let time = Int(-snap.time.timeIntervalSinceNow/60)
        var minAgo: String!
        if (time == 1) {
            minAgo = " minute ago"
        }
        else {
            minAgo = " minutes ago"
        }
        cell.timeStamp.text = String(time) + minAgo
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionName = threadNames[indexPath.section]
        let index = indexPath.row
        let snap = threads[sectionName]![index]
        if (snap.read) {
            return
        }
        snap.read = true
        performSegue(withIdentifier: "toImage", sender: snap.image)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "toImage" {
                if let dest = segue.destination as? ImageViewController {
                    if let newImage = sender as? UIImage {
                        dest.newImage = newImage
                    }
                }
            }
        }    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
