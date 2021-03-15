import UIKit

class WeekViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableiView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewCell()
    }
    
    func setViewCell() {
        collectionView.register(UINib(nibName: WeekDayCell.nibName, bundle: nil), forCellWithReuseIdentifier: WeekDayCell.identifier)
        tableiView.register(UINib(nibName: WeekListCell.nibName, bundle: nil), forCellReuseIdentifier: WeekListCell.identifier)
    }
}


extension WeekViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeekListCell.identifier, for: indexPath) as! WeekListCell
        return cell
    }
}


extension WeekViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeekDayCell.identifier, for: indexPath) as! WeekDayCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let cell = collectionView.cellForItem(at: indexPath) as! WeekDayCell
        if cell.isSelected {
            collectionView.deselectItem(at: indexPath, animated: true)
            return false
        } else {
            cell.isSelected = true
            return true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: Request Day Change Update Content
    }
}
