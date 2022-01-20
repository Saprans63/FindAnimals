
import UIKit
import SnapKit

class QuizController: UIViewController {
    
    let vegetables = VegetableData.vegetables
    var correct = 0
    var incorrect = 0
    
    var questionNumber = 0
    var questionNumberOrder = [Int]()
    var seenQuestionIndex = [Int]()
    
    var answer = ""
    
    lazy var vegetableView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.borderColor = UIColor.green.cgColor
        view.layer.borderWidth = 4
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var vegetableImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "lion")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var vegetableLabel: UILabel = {
        let label = UILabel()
        label.text = "String"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var answerView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.green.cgColor
        view.layer.borderWidth = 4
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var tickButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ww"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.imageView?.contentMode = .scaleAspectFit

        button.addTarget(self, action: #selector(tickPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ww4"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var correctView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.06139305865, green: 0.7803921569, blue: 0.2382844646, alpha: 1)
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var correctImageView: UIImageView = {
      let imageView = UIImageView()
       imageView.image = UIImage(named: "sss1")
       imageView.contentMode = .scaleAspectFill
       imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
    }()
    lazy var correctLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "Correct: \(correct)"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var incorrectView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var incorrectImageView: UIImageView = {
         let imageView = UIImageView()
          imageView.image = UIImage(named: "sss2")
          imageView.contentMode = .scaleAspectFill
          imageView.translatesAutoresizingMaskIntoConstraints = false
          return imageView
       }()
    lazy var incorrectLabel: UILabel = {
        let label = UILabel()
        label.text = "Incorrect: \(incorrect)"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Quiz"
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        initViews()
        cons()
    }
    
    func initViews() {
        takeQuestionOrder()
        
        initVegetableView()
        initAnswerView()
        initCorrectView()
        initIncorrectView()
        
        initQuestions()
    }
    
    func initQuestions() {
        if questionNumber == vegetables.count {
            navigationController?.popViewController(animated: true)
        } else {
            
            correctLabel.text = "Correct: \(correct)"
            incorrectLabel.text = "Incorrect: \(incorrect)"
            
            vegetableImage.image = UIImage(named: vegetables[questionNumberOrder[questionNumber]].vegetablepictureName)
            answer = vegetables[questionNumberOrder[questionNumber]].vegetableyName
            if Int(arc4random_uniform(UInt32(3))) == 1 {
                vegetableLabel.text = vegetables[questionNumberOrder[questionNumber]].vegetableyName
            } else {
                vegetableLabel.text = vegetables[questionNumberOrder[Int(arc4random_uniform(UInt32(vegetables.count)))]].vegetableyName
            }
        }
        
    }
    
    func cons () {
        cancelButton.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.8)
            make.width.equalToSuperview().multipliedBy(0.4)
        }
        
        tickButton.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.8)
            make.width.equalToSuperview().multipliedBy(0.4)
        }
    }
    
    func initVegetableView() {
        
        self.view.addSubview(vegetableView)
        vegetableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30).isActive = true
        vegetableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30).isActive = true
        vegetableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 180).isActive = true
        vegetableView.bottomAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 120).isActive = true
        
        vegetableView.addSubview(vegetableLabel)
        vegetableLabel.leftAnchor.constraint(equalTo: self.vegetableView.leftAnchor, constant: 10).isActive = true
        vegetableLabel.rightAnchor.constraint(equalTo: self.vegetableView.rightAnchor, constant: -10).isActive = true
        vegetableLabel.bottomAnchor.constraint(equalTo: self.vegetableView.bottomAnchor, constant: -5).isActive = true
        
        vegetableView.addSubview(vegetableImage)
        vegetableImage.leftAnchor.constraint(equalTo: self.vegetableView.leftAnchor, constant: 10).isActive = true
        vegetableImage.rightAnchor.constraint(equalTo: self.vegetableView.rightAnchor, constant: -10).isActive = true
        vegetableImage.topAnchor.constraint(equalTo: self.vegetableView.topAnchor, constant: 10).isActive = true
        vegetableImage.bottomAnchor.constraint(equalTo: self.vegetableView.bottomAnchor, constant: -35).isActive = true
        
    }
    
    func initAnswerView() {
        self.view.addSubview(answerView)
        answerView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30).isActive = true
        answerView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30).isActive = true
        answerView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 6).isActive = true
        answerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -60).isActive = true
        answerView.backgroundColor = .clear
        
        answerView.addSubview(tickButton)
        tickButton.centerYAnchor.constraint(equalTo: answerView.centerYAnchor).isActive = true
        answerView.addConstraint(NSLayoutConstraint(item: tickButton, attribute: .centerX, relatedBy: .equal, toItem: self.answerView, attribute: .centerX, multiplier: 0.5, constant: 0))
        
        answerView.addSubview(cancelButton)
        cancelButton.centerYAnchor.constraint(equalTo: answerView.centerYAnchor).isActive = true
        answerView.addConstraint(NSLayoutConstraint(item: cancelButton, attribute: .centerX, relatedBy: .equal, toItem: self.answerView, attribute: .centerX, multiplier: 1.5, constant: 0))
        
        
    }
    
    func initCorrectView() {
        view.addSubview(correctView)
        correctView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30).isActive = true
        correctView.rightAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -10).isActive = true
        correctView.bottomAnchor.constraint(equalTo: vegetableView.topAnchor, constant: -15).isActive = true
        correctView.heightAnchor.constraint(equalToConstant: 60).isActive = true

        correctView.addSubview(correctImageView)
        correctImageView.contentMode = .scaleAspectFit
        correctImageView.leftAnchor.constraint(equalTo: correctView.leftAnchor, constant: 8).isActive = true
        correctImageView.centerYAnchor.constraint(equalTo: correctView.centerYAnchor).isActive = true
        correctImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        correctImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true

        
        correctView.addSubview(correctLabel)
        correctLabel.leftAnchor.constraint(equalTo: correctView.leftAnchor, constant: 25).isActive = true
        correctLabel.rightAnchor.constraint(equalTo: correctView.rightAnchor, constant: -5).isActive = true
        correctLabel.centerYAnchor.constraint(equalTo: correctView.centerYAnchor).isActive = true
        
      
        
        
    }
    func initIncorrectView() {
        self.view.addSubview(incorrectView)
        incorrectView.leftAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 10).isActive = true
        incorrectView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30).isActive = true
        incorrectView.bottomAnchor.constraint(equalTo: vegetableView.topAnchor, constant: -15).isActive = true
        incorrectView.heightAnchor.constraint(equalToConstant: 60).isActive = true

        incorrectView.addSubview(incorrectImageView)
        incorrectImageView.contentMode = .scaleAspectFit
        incorrectImageView.leftAnchor.constraint(equalTo: incorrectView.leftAnchor, constant: 8).isActive = true
        incorrectImageView.centerYAnchor.constraint(equalTo: incorrectView.centerYAnchor).isActive = true
        incorrectImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        incorrectImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true

        incorrectView.addSubview(incorrectLabel)
        incorrectLabel.leftAnchor.constraint(equalTo: incorrectView.leftAnchor, constant: 25).isActive = true
        incorrectLabel.rightAnchor.constraint(equalTo: incorrectView.rightAnchor, constant: 0).isActive = true
        incorrectLabel.centerYAnchor.constraint(equalTo: incorrectView.centerYAnchor).isActive = true

    }
    func takeQuestionOrder() {
        for _ in 0..<vegetables.count {
            questionNumberOrder.append(chooseRandomQuestion())
        }
    }
    
    func chooseRandomQuestion() -> Int {
        
        if seenQuestionIndex.count == vegetables.count { return 0 }
        
        let index = Int(arc4random_uniform(UInt32(vegetables.count)))
        
       
        if seenQuestionIndex.contains(index) {
            return chooseRandomQuestion() 
        }
        
        
        let requiredItem = index
        seenQuestionIndex.append(index)
        return requiredItem
    }
    
    
    @objc func tickPressed() {
        questionNumber += 1
        
        
        if answer == vegetableLabel.text {
            correct += 1
        } else {
            incorrect += 1
        }
        initQuestions()
    }
    
    @objc func cancelPressed() {
        questionNumber += 1
        
        
        if answer == vegetableLabel.text {
            incorrect += 1
        } else {
            correct += 1
        }
        
        initQuestions()
        
        
    }
    
}
