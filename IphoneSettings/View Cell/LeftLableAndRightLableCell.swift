//
//  LeftLableAndRightLableCell.swift
//  IphoneSettings
//
//  Created by Sergey Kykhov on 12.06.2022.
//

import UIKit

// Класс для создания ячейки с лейблом слева и лейблом справа
class LeftLableAndRightLableCell: UITableViewCell, UITableViewDelegate {
    static var identifier = "LeftLableAndRightLableCell"

    //    Лейбл слева
    private let labelLeft: UILabel = {
        let label = UILabel()
        label.numberOfLines = Metrics.labelNumberOfLines

        return label
    }()

    // Вью слева, в который положу вью с изображением, вид с закругленными краями
    private let iconContainer: UIView = {
        let iconContainer = UIView()
        iconContainer.clipsToBounds = true
        iconContainer.layer.cornerRadius = Metrics.iconContainerCornerRadius
        iconContainer.layer.masksToBounds = true

        return iconContainer
    }()

    // Вью с изображением, которую положу во вью слева
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    // Лейбл справа
    private let rightLabel: UILabel = {
        let rightLabel = UILabel()

        return rightLabel
    }()

    // Собрал ячейку и установил лейбл левый и лейбл правый, установил стрелочку справа
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(labelLeft)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(rightLabel)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator

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
                                     width: size,
                                     height: size)

        let imageSize: CGFloat = size / Metrics.imageSizeConfigurationRatio
        iconImageView.frame = CGRect(x: (size - imageSize) / Metrics.iconImageViewFrameRatio,
                                     y: (size - imageSize) / Metrics.iconImageViewFrameRatio,
                                     width: imageSize,
                                     height: imageSize)

        labelLeft.frame = CGRect(
            x: Metrics.labelXframe + iconContainer.frame.size.width,
            y: 0,
            width: contentView.frame.size.width - Metrics.labelFrameWidthPosition - iconContainer.frame.size.width,
            height: contentView.frame.size.height)

        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: Metrics.rightLabelAnchorConstant),
            rightLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    // Переиспользование ячейки
    override func prepareForReuse() {
        super.prepareForReuse()

        labelLeft.text = nil
        iconImageView.image = nil
        iconContainer.backgroundColor = nil
        rightLabel.text = nil
    }

    // Настройки содержания элементов в ячейке
    public func configure(with model: SettingsCell) {
        labelLeft.text = model.leftLable
        iconImageView.image = model.image
        iconContainer.backgroundColor = model.iconBackGroundColor
        rightLabel.text = model.rightLabel
        rightLabel.textColor = model.rightLabelBackGroundColor

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
        static let rightLabelAnchorConstant: CGFloat = -40
    }
}




