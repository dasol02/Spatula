import UIKit

class WeekDayCell: UICollectionViewCell {
    @IBOutlet weak var labelDayNumber: UILabel!
    @IBOutlet weak var labelDayWeek: UILabel!
    @IBOutlet weak var viewDayToDo: UIView!
    @IBOutlet weak var viewSelected: UIView!
    var day: SpatulaDay! {
        didSet {
            updateContents()
        }
    }
    
    override var isSelected: Bool {
        didSet {
            updateCellSelected(isSelected: isSelected)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewSelected.layer.cornerRadius = viewSelected.circularWidth
    }
    
    private func updateContents() {
        labelDayNumber.text = day.dayNumber
        labelDayWeek.text = day.dayWeek
    }
    
    private func updateCellSelected(isSelected: Bool) {
        if isSelected {
            viewSelected.isHidden = false
        } else {
            viewSelected.isHidden = true
        }
    }
}
