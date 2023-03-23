//
//  SettingsViewController.swift
//  FileManager
//
//  Created by Игорь Скворцов on 23.03.2023.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    var sortAsc = false

    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Сортировать фото"
        return label
    }()
    
    lazy var sortToggle: UISwitch = {
        let toggle = UISwitch()
        toggle.translatesAutoresizingMaskIntoConstraints = false
        toggle.addTarget(self, action: #selector(tapToToggle), for: .valueChanged)
        return toggle
    }()
    
    lazy var changePassword: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setTitle("Нажмите, чтобы сменить пароль", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(changePass), for: .touchUpInside)
        
        if let image = UIImage(named: "blue_pixel") {
            button.imageView?.contentMode = .scaleAspectFill
            button.setBackgroundImage(image.imageWithAlpha(alpha: 1), for: .normal)
            button.setBackgroundImage(image.imageWithAlpha(alpha: 0.9), for: .selected)
            button.setBackgroundImage(image.imageWithAlpha(alpha: 0.9), for: .highlighted)
            button.setBackgroundImage(image.imageWithAlpha(alpha: 0.7), for: .disabled)
        }
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(sortToggle)
        view.addSubview(changePassword)
        useConstraint()
        setup()
    }
    
    func useConstraint() {
        NSLayoutConstraint.activate([label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
                                     label.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
                                     label.heightAnchor.constraint(equalToConstant: 20),
                                     sortToggle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
                                     sortToggle.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
                                     sortToggle.heightAnchor.constraint(equalToConstant: 20),
                                     changePassword.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
                                     changePassword.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
                                     changePassword.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
                                     changePassword.heightAnchor.constraint(equalToConstant: 40)])
        
    }
    
    func setup() {
        sortAsc = UserDefaults.standard.bool(forKey: "SortAsc")
        sortToggle.isOn = sortAsc
    }
    
    @objc func changePass() {
        let vc = LoginViewController()
        vc.state = .changePass
        self.navigationController?.setViewControllers([vc], animated: true)
    }
    
    @objc func tapToToggle() {
        sortAsc = sortToggle.isOn
        UserDefaults.standard.set(sortAsc, forKey: "SortAsc")
        NotificationCenter.default.post(name: NSNotification.Name("changeSort"), object: nil, userInfo: nil)
    }
    
}
