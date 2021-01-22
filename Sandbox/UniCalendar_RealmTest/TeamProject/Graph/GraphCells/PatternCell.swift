//
//  PatternCell.swift
//  TeamProject
//
//  Created by Nayeon Kim on 2021/01/17.
//

import UIKit
import Charts

class PatternCell: UITableViewCell {

    
    @IBOutlet weak var patternLabel: UILabel!
    @IBOutlet weak var pieChartView: PieChartView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
