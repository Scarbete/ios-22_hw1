import UIKit
import SnapKit



class NotesCell: UICollectionViewCell {
    
    private lazy var mainView = UIView()
    
    static let reuseId: String = "note_cell"
    
    private lazy var mainTitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#282A32")
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    override func layoutSubviews() {
        setupCell()
    }
    
    private func setupCell() {
        setupContentView()
        setupMainView()
        setupMainTitle()
    }
    
    private func setupContentView() {
        contentView.backgroundColor = UIColor(hex: "#D9BBF9")
        contentView.layer.cornerRadius = 10
    }
    
    private func setupMainView() {
        contentView.addSubview(mainView)
        
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
    
    private func setupMainTitle() {
        mainView.addSubview(mainTitle)
        
        mainTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
    
    func setupCell(title: String) {
        mainTitle.text = title
    }
    
}
