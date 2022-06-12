//
//  LeftLableAndSwitchCell.swift
//  IphoneSettings
//
//  Created by Sergey Kykhov on 12.06.2022.
//

import UIKit

// Класс для создания ячейки с лейблом слева и переключателем справа
class LeftLableAndSwitchCell: UITableViewCell, UITableViewDelegate {
    static var identifier = "LeftLableAndSwitchCell"

    //     Лейбл слева
    private let labelLeft: UILabel = {
        let label = UILabel()
        label.numberOfLines = Metrics.labelNumberOfLines

        return label
    }()

    // Переключатель
    private let mySwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.onTintColor = .systemGreen

        return mySwitch
    }()

    // Вью слева, в который положу вью с изображением, вид с закругленными краями
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = Metrics.iconContainerCornerRadius
        view.layer.masksToBounds = true

        return view
    }()

    // Вью с изображением, которую положу во вью слева
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    // Собрал ячейку и установил лейбл и переключатель, стрелочка отключена
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(labelLeft)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(mySwitch)
        contentView.clipsToBounds = true
        accessoryType = .none

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Размеры и рассположение
    override func layoutSubviews() {
        super.layoutSubviews()

        let size: CGFloat = contentView.frame.size.height - Metrics.sizeLeadingPosition
        iconContainer.frame = CGRect(x: Metrics.iconContainerXframe,
                                     y: Metrics.iconContainerYframe,
                                     width:size,
                                     height: size)

        let imageSize: CGFloat = size / Metrics.imageSizeConfigurationRatio
        iconImageView.frame = CGRect(x: (size - imageSize) / Metrics.iconImageViewFrameRatio,
                                     y: (size - imageSize) / Metrics.iconImageViewFrameRatio,
                                     width: imageSize,
                                     height: imageSize)
        imageView?.center = iconContainer.center

        mySwitch.sizeToFit()
        mySwitch.frame = CGRect(x: contentView.frame.size.width - mySwitch.frame.size.width - Metrics.mySwitchXframe,
                                y: (contentView.frame.size.height - mySwitch.frame.size.height) / Metrics.mySwitchYframe,
                                width: mySwitch.frame.size.width,
                                height: mySwitch.frame.size.height)

        labelLeft.frame = CGRect(
            x: Metrics.labelXframe + iconContainer.frame.size.width,
            y: 0,
            width: (contentView.frame.size.width - Metrics.labelFrameWidthPosition) - iconContainer.frame.size.width,
            height: contentView.frame.size.height)
    }

    // Переиспользование ячейки
    override func prepareForReuse() {
        super.prepareForReuse()

        labelLeft.text = nil
        iconImageView.image = nil
        iconContainer.backgroundColor = nil
        mySwitch.isOn = true
    }

    // Настройки содержания элементов в ячейке
    public func configure(with model: SettingsCell) {
        labelLeft.text = model.leftLable
        iconImageView.image = model.image
        iconContainer.backgroundColor = model.iconBackGroundColor
        mySwitch.isOn = model.isOn ?? false
    }

    enum Metrics {
        static let iconContainerCornerRadius: CGFloat = 8
        static let labelNumberOfLines = 1
        static let imageSizeConfigurationRatio: CGFloat = 1.5
        static let iconImageViewFrameRatio: CGFloat = 2
        static let sizeLeadingPosition: CGFloat = 12
        static let labelFrameWidthPosition: CGFloat = 20
        static let labelXframe: CGFloat = 25
        static let iconContainerXframe: CGFloat = 15
        static let iconContainerYframe: CGFloat = 6
        static let mySwitchXframe: CGFloat = 20
        static let mySwitchYframe: CGFloat = 2
    }
}

