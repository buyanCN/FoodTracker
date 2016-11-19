

import UIKit

class RatingControl: UIView {
    var rating=0{
        didSet{
            setNeedsLayout()
        }
    }
    var ratingButtons=[UIButton]()
    let spacing = 5
    let starCount = 5

    // initialization
    override func layoutSubviews() {
        print("layoutSubViews")
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        for(index, button) in ratingButtons.enumerated(){
            buttonFrame.origin.x = CGFloat(index*(buttonSize+spacing))
            button.frame = buttonFrame
        }
        updateButtonSelectionStates()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        print("init")
        let filledStarImage = UIImage(named:"filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0...starCount-1{
            let button = UIButton()
            button.setImage(emptyStarImage, for: .normal)
            button.setImage(filledStarImage, for: .selected)
            button.setImage(filledStarImage, for: [.highlighted, .selected])
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchDown)
            ratingButtons.append(button)
            addSubview(button)
        }
    }
    
    override public var intrinsicContentSize: CGSize{
        get{
            let buttonSize = Int(frame.size.height)
            let width = (buttonSize*starCount)+(spacing*(starCount-1))
            return CGSize(width: width, height: buttonSize)
        }
    }
    
    func ratingButtonTapped(button : UIButton){
        rating = ratingButtons.index(of: button)! + 1
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates(){
        for(index, button) in ratingButtons.enumerated(){
            button.isSelected = index < rating
        }
    }
}
