import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewCell()
    }
    
    func setViewCell() {
        tableView.register(UINib(nibName: SearchBrandCell.nibName, bundle: nil), forCellReuseIdentifier: SearchBrandCell.identifier)
        tableView.register(UINib(nibName: SearchItemCell.nibName, bundle: nil), forCellReuseIdentifier: SearchItemCell.identifier)
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row / 2 == 0 {
            return tableView.dequeueReusableCell(withIdentifier: SearchBrandCell.identifier, for: indexPath) as! SearchBrandCell
        } else {
            return tableView.dequeueReusableCell(withIdentifier: SearchItemCell.identifier, for: indexPath) as! SearchItemCell
        }
    }
}


extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let popUpRiceSelectViewController = UIStoryboard(name: "Search", bundle: Bundle.main).instantiateViewController(withIdentifier: "PopUpRiceSelectViewController") as? PopUpRiceSelectViewController else {
            return
        }
        popUpRiceSelectViewController.modalPresentationStyle = .overFullScreen // 팝업 스타일 풀 스크린으로 변경
        self.present(popUpRiceSelectViewController, animated: true, completion: nil)
    }
    
}


extension SearchViewController: UISearchBarDelegate {
    
}
