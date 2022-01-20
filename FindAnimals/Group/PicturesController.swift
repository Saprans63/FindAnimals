

import UIKit

class PicturesController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let vegetables = VegetableData.vegetables
    
  
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Animals"
        initViews()
        
    }
    
    func initViews() {
        self.view.addSubview(collectionView)
       // self.view.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        collectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 12).isActive = true
        
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(VegetablesItemCell.self, forCellWithReuseIdentifier: "VegetablesItemCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }
  
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vegetables.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VegetablesItemCell", for: indexPath) as! VegetablesItemCell
        
        cell.vegetableLabel.text = vegetables[indexPath.item].vegetableyName
        cell.vegetableImage.image = UIImage(named: vegetables[indexPath.item].vegetablepictureName)
        cell.layer.cornerRadius = 30
        cell.layer.borderColor = UIColor.green.cgColor
        cell.layer.borderWidth = 3
        cell.backgroundColor = .gray
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - 20, height: self.view.frame.height / 3)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 3, bottom: 3, right: 15)
    }
    

}

class VegetablesItemCell: UICollectionViewCell {
    
    
    lazy var vegetableImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let vegetableLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = UIColor.black
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        addSubview(vegetableLabel)
        vegetableLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        vegetableLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        vegetableLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        vegetableLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        
        addSubview(vegetableImage)
        vegetableImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        vegetableImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        vegetableImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        vegetableImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        vegetableImage.bottomAnchor.constraint(equalTo: self.vegetableLabel.topAnchor, constant: -10).isActive = true
                
    }
    
    
}
struct VegetableItem {
    let vegetableyName: String
    let vegetablepictureName: String
}


