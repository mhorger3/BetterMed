//
//  MedicineTableViewController.swift
//  BetterMed
//
//  Created by Channel Two on 3/27/16.
//  Copyright © 2016 Matthew Horger. All rights reserved.
//

import UIKit

class MedicineTableViewController: UITableViewController {
    // MARK: Properties
    
    var medicines = [Medicine]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the sample data.
        loadSampleMedicines()
    }
    
    func loadSampleMedicines() {
        let photo1 = UIImage(named: "medicine1")!
        let medicine1 = Medicine(name: "Aleve", photo: photo1, dosage: "2", time: "6AM, 8PM")!
        
        let photo2 = UIImage(named: "medicine2")!
        let medicine2 = Medicine(name: "Allegra", photo: photo2, dosage: "1", time: "6AM")!
        
        let photo3 = UIImage(named: "medicine3")!
        let medicine3 = Medicine(name: "Fish Oil", photo: photo3, dosage: "2", time: "12PM")!
        
        medicines += [medicine1, medicine2, medicine3]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicines.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "MedicineTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MedicineTableViewCell
        
        // Fetches the appropriate medicine for the data source layout.
        let medicine = medicines[indexPath.row]
        
        cell.nameLabel.text = medicine.name
        cell.photoImageView.image = medicine.photo
        //cell.ratingControl.rating = meal.rating
        cell.dosage.text = medicine.dosage
        cell.time.text = medicine.time
        
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func unwindToMedicinelList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? MedicineViewController, medicine = sourceViewController.medicine {
            // Add a new medicine item.
            let newIndexPath = NSIndexPath(forRow: medicines.count, inSection: 0)
            medicines.append(medicine)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
        }
    }
}

