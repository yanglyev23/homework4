//
//  ProfileViewController.swift
//  lesson1
//
//  Created by Admin on 30.11.2019.
//  Copyright © 2019 Heads and Hands. All rights reserved.
//

import UIKit

class profileViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    
    private var data = ["Настройки","Условия доставки","Рестораны","Связаться с нами","Оценить приложение","О приложении"]
    private var img: [UIImage?] = [(UIImage(named: "setup")), (UIImage(named: "delivery")), (UIImage(named: "restourant")),(UIImage(named: "contact")),(UIImage(named: "estimate")),(UIImage(named: "information"))]


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.addSubview(self.tableView)
        self.tableView.register(tableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.tableView.dataSource = self
        self.updateLayout(with: self.view.frame.size)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
       super.viewWillTransition(to: size, with: coordinator)
       coordinator.animate(alongsideTransition: { (contex) in
          self.updateLayout(with: size)
       }, completion: nil)
    }

    private func updateLayout(with size: CGSize) {
       self.tableView.frame = CGRect.init(origin: .zero, size: size)
    }
}

extension profileViewController: UITableViewDataSource {
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       switch tableView {
       case self.tableView:
          return self.data.count
        default:
          return 0
       }
    }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! tableViewCell
    cell.imageView?.image = self.img[indexPath.row]
    cell.textLabel?.text = self.data[indexPath.row]
    cell.backgroundColor = UIColor(red: 22, green: 23, blue: 27, alpha: 0)
    cell.tintColor = .white
    cell.textLabel?.textColor = .white
    cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
       return cell
    }
}

class tableViewCell: UITableViewCell{
    
}
