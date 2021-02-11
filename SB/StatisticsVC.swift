//
//  StatisticsVC.swift
//  SB
//
//  Created by Тимур on 29.01.2021.
//  Copyright © 2021 Тимур. All rights reserved.
//

import UIKit
import Charts

class StatisticsVC: UIViewController, ChartViewDelegate {

    var barChart = BarChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barChart.delegate = self
        print(0)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        barChart.frame = CGRect(x: 0, y: self.view.frame.size.height/2.25, width: self.view.frame.size.width, height: self.view.frame.size.height/2)
        
        view.addSubview(barChart)
        
        var entries = [BarChartDataEntry]()
        
        for i in 0..<10 {
            entries.append(BarChartDataEntry(x: Double(i), y: Double(i)))
        }
        
        let set = BarChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.joyful()
        
        let data = BarChartData(dataSet: set)
        barChart.data = data
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
