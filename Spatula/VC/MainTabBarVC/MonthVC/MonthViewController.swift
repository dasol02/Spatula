import UIKit
import FSCalendar

class MonthViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {
    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var currentLabel: UILabel!
    
    let gregorian = NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setCalendarView()
    }
    
    // MARK: - Calendar
    func setCalendarView() {
        calendarView.calendarWeekdayView.backgroundColor = .white
        calendarView.appearance.weekdayTextColor = .black
        calendarView.locale = Locale(identifier: "ko_KR")
        
        calendarView.appearance.todayColor = .black
        calendarView.appearance.selectionColor = .black
        calendarView.appearance.titleFont = UIFont.systemFont(ofSize: 14)
        calendarView.allowsMultipleSelection = false
        calendarView.swipeToChooseGesture.isEnabled = false
        
        calendarView.headerHeight = 0
        
        calendarView.scrollEnabled = true
        calendarView.delegate = self
        
        setCurrentLabelDate(date: calendarView.currentPage)
    }
    
    func setCurrentLabelDate(date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM월"
        currentLabel.text = dateFormatter.string(from: date)
    }
    
    // MARK: - FSCalendarDataSource
    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
//        let day = gregorian!.component(.day, from: date)
        return nil
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let day = gregorian!.component(.day, from: date)
        print("didSelect \(day)day")
    }
    // MARK: - FSCalendarDelegate
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        setCurrentLabelDate(date: calendar.currentPage)
    }
}
