//
//  ViewController.swift
//  IphoneSettings
//
//  Created by Sergey Kykhov on 12.06.2022.
//

import UIKit

class ViewController: UIViewController {
    private lazy var models = Section.configurateCells()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(LeftLableCell.self,
                           forCellReuseIdentifier: LeftLableCell.identifier)
        tableView.register(LeftLableAndSwitchCell.self,
                           forCellReuseIdentifier: LeftLableAndSwitchCell.identifier)
        tableView.register(LeftLableAndRightLableCell.self,
                           forCellReuseIdentifier: LeftLableAndRightLableCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        navigationItem.title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        view.addSubview(tableView)
    }

    private func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]

        switch model.self {
        case .basicCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LeftLableCell.identifier,
                                                           for: indexPath) as? LeftLableCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell

        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LeftLableAndSwitchCell.identifier,
                                                           for: indexPath) as? LeftLableAndSwitchCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell

        case .rightLabelCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LeftLableAndRightLableCell.identifier,
                                                           for: indexPath) as? LeftLableAndRightLableCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .basicCell(let model):
            model.handler()
            print("Нажата ячейка - \(model.leftLable ?? "Отсутствует")")
        case .switchCell(let model):
            model.handler()
            print("Нажата ячейка - \(model.leftLable ?? "Отсутствует")")
        case .rightLabelCell(let model):
            model.handler()
            print("Нажата ячейка - \(model.leftLable ?? "Отсутствует")")
        }
    }
}



