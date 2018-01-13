//
//  ViewController.swift
//  MCQ Quiz.
//
//  Created by Shinnosuke Chuman on 2018/01/13.
//  Copyright © 2018年 Shinnosuke Chuman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var trueFalseOptions = ["True","False"]
    var questions = [""]
    
    //MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var questuonLabel: UILabel!
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPathForSelectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
    }
    
    //MARK: UITableViewDataSource method
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.trueFalseOptions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReueIdentifier = "optionsCell"
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReueIdentifier)!
        
        cell.textLabel?.text = self.trueFalseOptions[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped " + self.trueFalseOptions[indexPath.row] + ".")
        if count == 0{
            if indexPath.row == 0{
                let alert = UIAlertController(title: "You got it right!", message: "You tapped " + self.trueFalseOptions[indexPath.row] + ".", preferredStyle:  UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: false, completion: nil)
            } else {
                let alert = UIAlertController(title: "You got it wrong!", message: "You tapped " + self.trueFalseOptions[indexPath.row] + ".", preferredStyle:  UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: false, completion: nil)
            }
        tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        
    }
    }
    
    
    }

extension UIView {
    @IBInspectable var borderColor: UIColor? {
        get {
            return layer.borderColor.map { UIColor(cgColor: $0) }
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
}
}

