
import UIKit

class ViewController: UIViewController {
    lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "animal")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var learnButton: UIButton = {
        let button = UIButton()
        button.setTitle("Name and Foto", for: .normal)
        button.backgroundColor = UIColor(white: 1, alpha: 0.6)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 32)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(pushToFPicturesController), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var findButton: UIButton = {
        let button = UIButton()
        button.setTitle("Questions", for: .normal)
        button.backgroundColor = UIColor(white: 1, alpha: 0.6)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 32)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(pushToQuizController), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Learn Animals"
        initViews()
    }
    
    func initViews() {
        
        view.addSubview(backgroundImage)
        backgroundImage.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        backgroundImage.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        backgroundImage.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        view.addSubview(learnButton)
        
        learnButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        learnButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30).isActive = true
        learnButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30).isActive = true
        learnButton.heightAnchor.constraint(equalToConstant: self.view.frame.height / 13).isActive = true
        
        view.addSubview(findButton)
        findButton.topAnchor.constraint(equalTo: learnButton.bottomAnchor, constant: 15).isActive = true
        
        findButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30).isActive = true
        findButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30).isActive = true
        findButton.heightAnchor.constraint(equalToConstant: self.view.frame.height / 13).isActive = true
        
        
    }
    
    @objc func pushToFPicturesController() {
        let controller = PicturesController()
        navigationController?.pushViewController(controller, animated: true)
    }
  
        @objc func pushToQuizController() {
           let controller = QuizController()
          navigationController?.pushViewController(controller, animated: true)
        }
}


