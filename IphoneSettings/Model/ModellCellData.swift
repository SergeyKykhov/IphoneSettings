//
//  ModellCellData.swift
//  IphoneSettings
//
//  Created by Sergey Kykhov on 12.06.2022.
//

import Foundation
import UIKit

// Наполнение ячейки
struct SettingsCell {
    let leftLable: String?
    let image: UIImage?
    let iconBackGroundColor: UIColor
    let rightLabel: String?
    let rightLabelBackGroundColor: UIColor?
    let isOn: Bool?
    let handler: (() -> Void)
}

// Тип ячейки
enum CellType {
    case basicCell(model: SettingsCell)
    case switchCell(model: SettingsCell)
    case rightLabelCell(model: SettingsCell)
}

// Данные для наполнения информацией ячеек в секциях
struct Section {
    let options: [CellType]

    static func configurateCells() -> [Section] {
        return [
            Section(options: [
                .switchCell(model: SettingsCell(leftLable: "Авиарежим",
                                                image: UIImage(systemName: "airplane.circle.fill") ?? .add,
                                                iconBackGroundColor: .systemOrange,
                                                rightLabel: nil,
                                                rightLabelBackGroundColor: nil,
                                                isOn: true,
                                                handler: { }
                                               )),
                .rightLabelCell(model: SettingsCell(leftLable: "Wi-Fi",
                                                    image: UIImage(systemName: "wifi.circle.fill") ?? .add,
                                                    iconBackGroundColor: .systemBlue,
                                                    rightLabel: "Не подключено",
                                                    rightLabelBackGroundColor: .systemGray,
                                                    isOn: nil,
                                                    handler: { }
                                                   )),
                .rightLabelCell(model: SettingsCell(leftLable: "Bluetooth",
                                                    image: UIImage(systemName: "link.circle.fill") ?? .add,
                                                    iconBackGroundColor: .systemBlue,
                                                    rightLabel: "Вкл.",
                                                    rightLabelBackGroundColor: .systemGray,
                                                    isOn: nil,
                                                    handler: { }
                                                   )),
                .basicCell(model: SettingsCell(leftLable: "Сотовая связь",
                                               image: UIImage(systemName: "antenna.radiowaves.left.and.right.circle.fill") ?? .add,
                                               iconBackGroundColor: .systemGreen,
                                               rightLabel: nil,
                                               rightLabelBackGroundColor: nil,
                                               isOn: nil,
                                               handler: { }
                                              )),
                .basicCell(model: SettingsCell(leftLable: "Режим модема",
                                               image: UIImage(systemName: "link.circle.fill") ?? .add,
                                               iconBackGroundColor: .systemGreen,
                                               rightLabel: nil,
                                               rightLabelBackGroundColor: nil,
                                               isOn: nil,
                                               handler: { }
                                              )),
                .switchCell(model: SettingsCell(leftLable: "VPN",
                                                image: UIImage(systemName: "globe.americas.fill") ?? .add,
                                                iconBackGroundColor: .systemBlue,
                                                rightLabel: nil,
                                                rightLabelBackGroundColor: nil,
                                                isOn: true,
                                                handler: { }
                                               ))]
            ),
            Section(options: [
                .basicCell(model: SettingsCell(leftLable: "Уведомления",
                                               image: UIImage(systemName: "bell.circle.fill") ?? .add,
                                               iconBackGroundColor: .systemRed,
                                               rightLabel: nil,
                                               rightLabelBackGroundColor: nil,
                                               isOn: nil,
                                               handler: { }
                                              )),
                .basicCell(model: SettingsCell(leftLable: "Звуки и тактильные сигналы",
                                               image: UIImage(systemName: "speaker.wave.2.circle.fill") ?? .add,
                                               iconBackGroundColor: .systemPink,
                                               rightLabel: nil,
                                               rightLabelBackGroundColor: nil,
                                               isOn: nil,
                                               handler: { }
                                              )),
                .basicCell(model: SettingsCell(leftLable: "Не беспокоить",
                                               image: UIImage(systemName: "moon.circle.fill") ?? .add,
                                               iconBackGroundColor: .systemPurple,
                                               rightLabel: nil,
                                               rightLabelBackGroundColor: nil,
                                               isOn: nil,
                                               handler: { }
                                              )),
                .basicCell(model: SettingsCell(leftLable: "Экранное время",
                                               image: UIImage(systemName: "hourglass.circle.fill") ?? .add,
                                               iconBackGroundColor: .systemPurple,
                                               rightLabel: nil,                                                rightLabelBackGroundColor: nil,
                                               isOn: nil,
                                               handler: { }
                                              ))]
            ),
            Section(options: [
                .rightLabelCell(model: SettingsCell(leftLable: "Основные",
                                                    image: UIImage(systemName: "gearshape.circle.fill") ?? .add,
                                                    iconBackGroundColor: .lightGray,
                                                    rightLabel: nil,
                                                    rightLabelBackGroundColor: nil,
                                                    isOn: nil,
                                                    handler: { }
                                                   )),
                .basicCell(model: SettingsCell(leftLable: "Пункт управления",
                                               image: UIImage(systemName: "list.bullet.circle.fill") ?? .add,
                                               iconBackGroundColor: .lightGray,
                                               rightLabel: nil,                                                rightLabelBackGroundColor: nil,
                                               isOn: nil,
                                               handler: { }
                                              )),
                .basicCell(model: SettingsCell(leftLable: "Экран и яркость",
                                               image: UIImage(systemName: "a.circle.fill") ?? .add,
                                               iconBackGroundColor: .systemBlue,
                                               rightLabel: nil,                                                rightLabelBackGroundColor: nil,
                                               isOn: nil,
                                               handler: { }
                                              )),
                .basicCell(model: SettingsCell(leftLable: "Экран Домой",
                                               image: UIImage(systemName: "circle.grid.3x3.circle.fill") ?? .add,
                                               iconBackGroundColor: .blue,
                                               rightLabel: nil,
                                               rightLabelBackGroundColor: nil,
                                               isOn: nil,
                                               handler: { }
                                              )),
                .basicCell(model: SettingsCell(leftLable: "Универсальный доступ",
                                               image: UIImage(systemName: "person.crop.circle.fill") ?? .add,
                                               iconBackGroundColor: .systemBlue,
                                               rightLabel: nil,
                                               rightLabelBackGroundColor: nil,
                                               isOn: nil,
                                               handler: { }
                                              ))]
            )]
    }
}

// Финальный класс, который содержит в себе все данные дня ячеек в секциях
final class ModelCellData {

    static var cellModelData = ["SectionOne": [Section(options: [
        .switchCell(model: SettingsCell(leftLable: "Авиарежим",
                                        image: UIImage(systemName: "airplane.circle.fill") ?? .add,
                                        iconBackGroundColor: .systemOrange,
                                        rightLabel: nil,
                                        rightLabelBackGroundColor: nil,
                                        isOn: true,
                                        handler: { }
                                       )),
        .rightLabelCell(model: SettingsCell(leftLable: "Wi-Fi",
                                            image: UIImage(systemName: "wifi.circle.fill") ?? .add,
                                            iconBackGroundColor: .systemBlue,
                                            rightLabel: "Не подключено",
                                            rightLabelBackGroundColor: .systemGray,
                                            isOn: nil,
                                            handler: { }
                                           )),
        .rightLabelCell(model: SettingsCell(leftLable: "Bluetooth",
                                            image: UIImage(systemName: "link.circle.fill") ?? .add,
                                            iconBackGroundColor: .systemBlue,
                                            rightLabel: "Вкл.",
                                            rightLabelBackGroundColor: .systemGray,
                                            isOn: nil,
                                            handler: { }
                                           )),
        .basicCell(model: SettingsCell(leftLable: "Сотовая связь",
                                       image: UIImage(systemName: "antenna.radiowaves.left.and.right.circle.fill") ?? .add,
                                       iconBackGroundColor: .systemGreen,
                                       rightLabel: nil,
                                       rightLabelBackGroundColor: nil,
                                       isOn: nil,
                                       handler: { }
                                      )),
        .basicCell(model: SettingsCell(leftLable: "Режим модема",
                                       image: UIImage(systemName: "link.circle.fill") ?? .add,
                                       iconBackGroundColor: .systemGreen,
                                       rightLabel: nil,
                                       rightLabelBackGroundColor: nil,
                                       isOn: nil,
                                       handler: { }
                                      )),
        .switchCell(model: SettingsCell(leftLable: "VPN",
                                        image: UIImage(systemName: "globe.americas.fill") ?? .add,
                                        iconBackGroundColor: .systemBlue,
                                        rightLabel: nil,
                                        rightLabelBackGroundColor: nil,
                                        isOn: true,
                                        handler: { }
                                       ))]
    )],
                                "SectionTwo": [Section(options: [
                                    .basicCell(model: SettingsCell(leftLable: "Уведомления",
                                                                   image: UIImage(systemName: "bell.circle.fill") ?? .add,
                                                                   iconBackGroundColor: .systemRed,
                                                                   rightLabel: nil,
                                                                   rightLabelBackGroundColor: nil,
                                                                   isOn: nil,
                                                                   handler: { }
                                                                  )),
                                    .basicCell(model: SettingsCell(leftLable: "Звуки и тактильные сигналы",
                                                                   image: UIImage(systemName: "speaker.wave.2.circle.fill") ?? .add,
                                                                   iconBackGroundColor: .systemPink,
                                                                   rightLabel: nil,
                                                                   rightLabelBackGroundColor: nil,
                                                                   isOn: nil,
                                                                   handler: { }
                                                                  )),
                                    .basicCell(model: SettingsCell(leftLable: "Не беспокоить",
                                                                   image: UIImage(systemName: "moon.circle.fill") ?? .add,
                                                                   iconBackGroundColor: .systemPurple,
                                                                   rightLabel: nil,
                                                                   rightLabelBackGroundColor: nil,
                                                                   isOn: nil,
                                                                   handler: { }
                                                                  )),
                                    .basicCell(model: SettingsCell(leftLable: "Экранное время",
                                                                   image: UIImage(systemName: "hourglass.circle.fill") ?? .add,
                                                                   iconBackGroundColor: .systemPurple,
                                                                   rightLabel: nil,
                                                                   rightLabelBackGroundColor: nil,
                                                                   isOn: nil,
                                                                   handler: { }
                                                                  ))]
                                )],
                                "SectionThree": [Section(options: [
                                    .rightLabelCell(model: SettingsCell(leftLable: "Основные",
                                                                        image: UIImage(systemName: "gearshape.circle.fill") ?? .add,
                                                                        iconBackGroundColor: .lightGray,
                                                                        rightLabel: nil,
                                                                        rightLabelBackGroundColor: nil,
                                                                        isOn: nil,
                                                                        handler: { }
                                                                       )),
                                    .basicCell(model: SettingsCell(leftLable: "Пункт управления",
                                                                   image: UIImage(systemName: "list.bullet.circle.fill") ?? .add,
                                                                   iconBackGroundColor: .lightGray,
                                                                   rightLabel: nil,
                                                                   rightLabelBackGroundColor: nil,
                                                                   isOn: nil,
                                                                   handler: { }
                                                                  )),
                                    .basicCell(model: SettingsCell(leftLable: "Экран и яркость",
                                                                   image: UIImage(systemName: "a.circle.fill") ?? .add,
                                                                   iconBackGroundColor: .systemBlue,
                                                                   rightLabel: nil,
                                                                   rightLabelBackGroundColor: nil,
                                                                   isOn: nil,
                                                                   handler: { }
                                                                  )),
                                    .basicCell(model: SettingsCell(leftLable: "Экран Домой",
                                                                   image: UIImage(systemName: "circle.grid.3x3.circle.fill") ?? .add,
                                                                   iconBackGroundColor: .blue,
                                                                   rightLabel: nil,
                                                                   rightLabelBackGroundColor: nil,
                                                                   isOn: nil,
                                                                   handler: { }
                                                                  )),
                                    .basicCell(model: SettingsCell(leftLable: "Универсальный доступ",
                                                                   image: UIImage(systemName: "person.crop.circle.fill") ?? .add,
                                                                   iconBackGroundColor: .systemBlue,
                                                                   rightLabel: nil,
                                                                   rightLabelBackGroundColor: nil,
                                                                   isOn: nil,
                                                                   handler: { }
                                                                  ))]
                                )]]
}

