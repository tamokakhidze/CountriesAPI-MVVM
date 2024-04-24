import UIKit

extension UILabel {
    func setLineHeight(_ totalLineHeight: CGFloat) {
        let lineSpacing = totalLineHeight - self.font.lineHeight
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        
        let attributedString = NSMutableAttributedString(string: self.text ?? "")
        attributedString.addAttribute(
            .paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: attributedString.length)
        )
        
        self.attributedText = attributedString
    }
}
