
import UIKit

var presenter = Presenter()

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func pressedButton(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let actualAnswer = presenter.questions[presenter.questionNumber].Answer

        if userAnswer == actualAnswer {
            sender.backgroundColor = UIColor.green
            presenter.score += 1
        }else {
            sender.backgroundColor = UIColor.red
            
        }
        if presenter.questionNumber + 1 < presenter.questions.count {
            presenter.questionNumber += 1
        } else{
            presenter.questionNumber = 0
        }
        Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        scoreLabel.text = ("Score = \(presenter.score)")
        questionLabel.text = presenter.questions[presenter.questionNumber].text
        progressBar.progress = Float(presenter.questionNumber + 1) / Float(presenter.questions.count)

    }
                }
      
   

