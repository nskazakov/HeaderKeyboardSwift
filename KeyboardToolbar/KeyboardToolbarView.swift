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
        self.leftStackView.spacing = 10
        self.leftStackView.distribution = .fill
        
        self.rightStackView.alignment = .center
        self.rightStackView.spacing = 10
        self.rightStackView.distribution = .fill
    }
    
    func initStackView(nextButton: UIButton, previosButton: UIButton, rightButton: UIButton) {
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
