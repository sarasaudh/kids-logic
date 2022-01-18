//
//  Menuetting.swift
//  KidsLogic
//
//  Created by sara saud on 09/06/1443 AH.
//
import UIKit

protocol MenuViewControllerDelegate: AnyObject {
    func didSelect(menuItem: MenuViewController.MenuOption)
}
class MenuViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    //    let stringOfinfo: String = MenuOption.getTitleFor(title: .info)
    
    weak var delegate: MenuViewControllerDelegate?
    
    //    (NSLocalizedString("GAME 🎮", comment: "")
    enum MenuOption: String, CaseIterable {
        case info // = "info"
        case back //= "Back"
        case languge// = "Languge"
        case location //= "Map"
        case website //= "Website"
        case singout// = "Sign Out"
        
        var localized: String {
            switch self {
            case .info:
                return NSLocalizedString("info", comment: "")
            case .back:
                return NSLocalizedString("Back", comment: "")
            case .languge:
                return NSLocalizedString("Languge", comment: "")
            case .location:
                return NSLocalizedString("Map", comment: "")
            case .website:
                return NSLocalizedString("Website", comment: "")
            case .singout:
                return NSLocalizedString("Sign Out", comment: "")
            }
        }
        
        
        var imageName: String {
            switch self {
                
            case .info:
                return "info.circle"
            case .back:
                return "chevron.backward.circle"
            case .languge:
                return "character.book.closed.ar"
            case .location:
                return "map"
            case .website:
                return "network"
            case .singout:
                return "gear"
                
            }
        }
    }
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    let grayColor = UIColor(  #colorLiteral(red: 0.6398785114, green: 0.8450550437, blue: 0.9822372794, alpha: 1)) //UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = grayColor
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.size.width, height: view.bounds.size.height)
        
    }
    //Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOption.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = MenuOption.allCases[indexPath.row].localized
        cell.backgroundColor = grayColor
        cell.textLabel?.textColor = UIColor (#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1))
        cell.imageView?.image = UIImage(systemName: MenuOption.allCases[indexPath.row].imageName)
//        cell.textLabel?.textAlignment = .center
        cell.imageView?.tintColor = .white
        cell.contentView.backgroundColor = grayColor
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = MenuOption.allCases[indexPath.row]
        delegate?.didSelect(menuItem: item)
    }
    
}
