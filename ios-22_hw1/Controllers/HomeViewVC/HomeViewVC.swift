import UIKit
import SnapKit



class HomeViewVC: UIViewController {
    
    private var notes: [String] = []
    private var controller: HomeController?
    
    private lazy var leftBarLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.textColor = UIColor(hex: "#0A84FF")
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    private lazy var rightBarButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "iconSetting"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var searchTF: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(
            string: "Search",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        tf.leftViewMode = .always
        tf.rightViewMode = .always
        tf.textColor = .black
        tf.layer.cornerRadius = 10
        tf.backgroundColor = UIColor(hex: "#EBEBF5")
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 36, height: tf.frame.height))
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: tf.frame.height))
        let leftButton = UIButton(type: .system)
        leftButton.frame = CGRect(x: 8, y: -11, width: 25, height: 22)
        leftButton.setImage(UIImage(named: "iconSearch"), for: .normal)
        leftButton.tintColor = UIColor(hex: "#626262")
        leftView.addSubview(leftButton)
        tf.leftView = leftView
        tf.rightView = rightView
        return tf
    }()
    
    private lazy var notesLabel: UILabel = {
        let label = UILabel()
        label.text = "Notes"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(hex: "#262626")
        return label
    }()
    
    private lazy var notesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 165, height: 100)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.register(NotesCell.self, forCellWithReuseIdentifier: NotesCell.reuseId)
        return cv
    }()
    
    private lazy var addNoteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "iconPlus"), for: .normal)
        button.backgroundColor = UIColor(hex: "#FF3D3D")
        button.layer.cornerRadius = 21
        button.tintColor = .white
        return button
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller = HomeController(view: self)
        controller?.getNotes()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        setupNavBar()
        setupSearchTF()
        setupNotesLabel()
        setupNotesCollectionView()
        setupAddNoteButton()
    }
    
    
    
    private func setupNavBar() {
        let leftBarItem = UIBarButtonItem(customView: leftBarLabel)
        let rightButton = UIBarButtonItem(customView: rightBarButton)
        self.navigationItem.leftBarButtonItem = leftBarItem
        self.navigationItem.rightBarButtonItem = rightButton
        self.navigationItem.title = "Home"
    }
    
    private func setupSearchTF() {
        view.addSubview(searchTF)
        
        searchTF.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(4)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(36)
        }
    }
    
    private func setupNotesLabel() {
        view.addSubview(notesLabel)
        
        notesLabel.snp.makeConstraints { make in
            make.top.equalTo(searchTF.snp.bottom).offset(22)
            make.horizontalEdges.equalToSuperview().inset(39)
            make.height.equalTo(42)
        }
    }
    
    private func setupNotesCollectionView() {
        view.addSubview(notesCollectionView)
        
        notesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(notesLabel.snp.bottom).offset(40)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(324)
        }
    }
    
    private func setupAddNoteButton() {
        view.addSubview(addNoteButton)
        
        addNoteButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-133)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(42)
        }
    }

    func succesNotes(notes: [String]) {
        self.notes = notes
        notesCollectionView.reloadData()
    }
    
}

extension HomeViewVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        notes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NotesCell.reuseId, for: indexPath) as! NotesCell
        cell.setupCell(title: notes[indexPath.row])
        return cell
    }
    
}
