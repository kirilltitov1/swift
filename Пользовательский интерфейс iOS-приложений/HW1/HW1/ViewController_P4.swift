//
//  ViewController_P4.swift
//  HW1
//
//  Created by Kirill Titov on 13/08/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit

class ViewController_P4: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension ViewController_P4: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: <#T##String#>)
    }
}
