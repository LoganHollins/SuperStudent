//
//  ScheduleController.swift
//  SuperStudent
//
//  Created by Logan Hollins on 2015-11-25.
//  Copyright © 2015 Logan Hollins. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ScheduleController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var singlePicker: UIPickerView!
    
    var events:[Event] = []
    var filterType : FilterType = FilterType.All
    private let filters = ["Today", "This Week", "All"]
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    enum FilterType {
        case Today
        case ThisWeek
        case All
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.addTarget(self, action: Selector("datePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        updateSchedule(NSDate(), type: FilterType.Today)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func datePickerChanged(datePicker: UIDatePicker) {
        let date = datePicker.date
        updateSchedule(date, type: filterType)
    }
    
    func updateSchedule(selectedDate : NSDate, type : FilterType) {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        events.removeAll()
        Alamofire.request(.GET, "https://api.mongolab.com/api/1/databases/rhythmictracks/collections/Events?apiKey=L4HrujTTG-XOamCKvRJp5RwYMpoJ6xCZ").responseJSON { response in
            
            if let json = response.result.value {
                var data = JSON(json)
                for i in 0...data.count - 1 {
                    var event = Event(title: data[i]["title"].stringValue,
                                        description: data[i]["description"].stringValue,
                                        date: data[i]["date"].stringValue,
                                        location: data[i]["location"].stringValue,
                                        startTime: data[i]["startTime"].stringValue,
                                        endTime: data[i]["endTime"].stringValue)
                    let date = formatter.dateFromString(event.date)
                    if(date != nil) {
                        if(self.filterType == FilterType.ThisWeek) {
                            if(NSCalendar.currentCalendar().compareDate(date!, toDate: selectedDate, toUnitGranularity:             NSCalendarUnit.WeekOfYear) == .OrderedSame) {
                                self.events.append(event)
                            }
                        } else if(self.filterType == FilterType.Today) {
                            if(NSCalendar.currentCalendar().compareDate(date!, toDate: selectedDate, toUnitGranularity:             NSCalendarUnit.Day) == .OrderedSame) {
                                self.events.append(event)
                            }
                        } else {
                            self.events.append(event)
                        }
                    }
                }
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.events.sortInPlace({$0.date < $1.date})
                    self.tableView.reloadData()
                })
                
            }
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier) as UITableViewCell!
        
        if(cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: simpleTableIdentifier)
        }
       
        cell!.textLabel!.text = events[indexPath.row].title
        cell!.detailTextLabel!.text = events[indexPath.row].date
        return cell!
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return filters.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return filters[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let date = datePicker.date
        switch(singlePicker.selectedRowInComponent(0)) {
            case 0:
                filterType = FilterType.Today
            case 1:
                filterType = FilterType.ThisWeek
            case 2:
                filterType = FilterType.All
            default:
                filterType = FilterType.All
        }
        updateSchedule(date, type: filterType)
    }
}
