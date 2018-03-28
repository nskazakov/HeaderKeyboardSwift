import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var stackView: UIStackView!
    
    private let keyboardToolbar  = KeyboardToolbarView.loadFromNib()!
    
    let oneTextFieldView = UITextField()
    let twoTextFieldView = UITextField()
    let threeTextFieldView = UITextField()
    let fourTextFieldView = UITextField()
    let fiveTextFieldView = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stackView.spacing = 20
        self.keyboardToolbar.color = .lightGray
        self.oneTextFieldView.tag = 0
        self.oneTextFieldView.placeholder = "One text field"
        self.twoTextFieldView.placeholder = "Two text field"
        self.threeTextFieldView.placeholder = "Three text field"
        self.fourTextFieldView.placeholder = "Four text field"
        self.fiveTextFieldView.placeholder = "Five text field"

        self.oneTextFieldView.delegate = self
        self.twoTextFieldView.delegate = self
        self.threeTextFieldView.delegate = self
        self.fourTextFieldView.delegate = self
        self.fiveTextFieldView.delegate = self
        
        self.stackView.addArrangedSubview(oneTextFieldView)
        self.stackView.addArrangedSubview(twoTextFieldView)
        self.stackView.addArrangedSubview(threeTextFieldView)
        self.stackView.addArrangedSubview(fourTextFieldView)
        self.stackView.addArrangedSubview(fiveTextFieldView)
    }
    
    
    
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        let nextResponder = textField.superview?.viewWithTag(nextTag)
        
        if let nextField = nextResponder as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return false
    }
}

