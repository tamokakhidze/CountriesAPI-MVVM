import UIKit

class CountryCell: UITableViewCell {
    
    var nameLabel = UILabel()
    var titleLabel = UILabel()
    var flagImageView = UIImageView()
    var nextButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(nameLabel)
        addSubview(nextButton)
        addSubview(flagImageView)
        configureNameLabel()
        configureNextButton()
        configureFlagImageView()
        contentView.layer.cornerRadius = 26
        contentView.layer.borderWidth = 1
        contentView.backgroundColor = UIColor(named: "backgroundcolor")
        sendSubviewToBack(contentView)
        contentView.clipsToBounds = true
        contentView.layer.borderColor = UIColor(named: "textcolor")!.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureFlagImageView() {
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        flagImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        flagImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        flagImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        flagImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        flagImageView.layer.cornerRadius = 3
        flagImageView.clipsToBounds = true
    }
    
    
    func configureNameLabel() {
        nameLabel.font = UIFont(name: "FiraGO-Medium", size: 12)
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = UIColor(named: "textcolor")
        nameLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nameLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 220).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: nextButton.leadingAnchor, constant: -1).isActive = true
    }
    
    func configureTitleLabel() {
        titleLabel.font = UIFont(name: "FiraGO-Medium", size: 14)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor(named: "textcolor")
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.heightAnchor.constraint(equalToConstant: 38).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 303).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.setLineHeight(16.8)
    }
    
    func configureNextButton() {
        let image = UIImage(systemName: "chevron.right")
        nextButton.setImage(image!.withTintColor(.gray), for: .normal)
        nextButton.tintColor = UIColor(named: "textcolor")
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.heightAnchor.constraint(equalToConstant: 10.14).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 11).isActive = true
        nextButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -23).isActive = true
        }

    func configureCell(name: String?, image: String) {
        nameLabel.text = name
        guard let imgUrl = URL(string: image) else { return  }
        flagImageView.setImage(with: imgUrl)
    }
}
