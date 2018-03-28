import UIKit

class KeyboardToolbarView: UIView {

    @IBOutlet private weak var rightStackView: UIStackView!
    @IBOutlet private weak var leftStackView: UIStackView!
    
    var onClickNext: (() -> Void)?
    var onClickPrevios: (() -> Void)?
    var onClickDone: (() -> Void)?
    
    var color: UIColor? {
        didSet {
            self.backgroundColor = color
        }
    }
    
    var nextButtonImage: UIImage?
    var previosButtonImage: UIImage?
    var rightButtonImage: UIImage?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureView()
    }
    
    private func configureView() {
        self.leftStackView.alignment = .center
        self.leftStackView.spacing = 2
        self.leftStackView.distribution = .fillEqually
        
        self.rightStackView.alignment = .center
        self.rightStackView.spacing = 10
        self.rightStackView.distribution = .fill
    }
    
    public func initDefaultStackView() {
        let nextButton = UIButton()
        let previosButton = UIButton()
        let doneButton = UIButton()
        
        nextButton.addTarget(self, action: #selector(pressNextButton), for: .touchUpInside)
        nextButton.setImage(#imageLiteral(resourceName: "down-arrow"), for: .normal)
        
        previosButton.addTarget(self, action: #selector(pressPreviosButton), for: .touchUpInside)
        previosButton.setImage(#imageLiteral(resourceName: "up-arrow"), for: .normal)
        
        doneButton.addTarget(self, action: #selector(pressDoneButton), for: .touchUpInside)
        doneButton.setTitle("Готово", for: .normal)
        
        self.leftStackView.addArrangedSubview(nextButton)
        self.leftStackView.addArrangedSubview(previosButton)
        self.rightStackView.addArrangedSubview(doneButton)
    }
    
    public func initCustomStackViewWith(nextButton: UIButton, previosButton: UIButton, rightButton: UIButton) {
        nextButton.addTarget(self, action: #selector(pressNextButton), for: .touchUpInside)
        nextButton.setImage(self.nextButtonImage, for: .normal)
        
        previosButton.addTarget(self, action: #selector(pressPreviosButton), for: .touchUpInside)
        previosButton.setImage(self.nextButtonImage, for: .normal)
        
        rightButton.addTarget(self, action: #selector(pressDoneButton), for: .touchUpInside)
        rightButton.setImage(self.nextButtonImage, for: .normal)
        
        
        self.leftStackView.addArrangedSubview(nextButton)
        self.leftStackView.addArrangedSubview(previosButton)
        self.rightStackView.addArrangedSubview(rightButton)
    }
    
    
    // MARK: - Actions
    @objc private func pressNextButton() {
        self.onClickNext?()
    }
    
    @objc private func pressPreviosButton() {
        self.onClickPrevios?()
    }
    
    @objc private func pressDoneButton() {
        self.onClickDone?()
    }
}
