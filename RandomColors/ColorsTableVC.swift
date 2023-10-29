//
//  ColorsTableVC.swift
//  RandomColors
//
//  Created by Stanislav Shurko on 29.10.23.
//

import UIKit

class ColorsTableVC: UIViewController {
    
    enum Cells {
        static let colorCell = "colorCell";
    }
    
    enum Segues {
        static let toDetail = "ToColorsDetailVC";
    }
    
    var colors: [UIColor] = [];

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.colors = createRandomColorsArray();
        
        // Do any additional setup after loading the view.
    }
    
    func createRandomColorsArray() -> [UIColor] {
        var randomColors: [UIColor] = [];
        for _ in 0..<50 {
            randomColors.append(.random());
        }
        return randomColors
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorsDetailVC;
        destVC.color = sender as? UIColor;
    }

}

extension ColorsTableVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.colors.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.colorCell, for: indexPath);
        cell.backgroundColor = self.colors[indexPath.row];
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = self.colors[indexPath.row];
        performSegue(withIdentifier: Segues.toDetail, sender: color);
    }
    
}
