//
//  LocalizationExtensions.swift
//  CurrencyQuotes
//
//  Created by Murat Dzhusupov on 01.11.2020.
//

import UIKit

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

extension UILabel {
    static var localizedKey:UInt8 = 0
    
    @IBInspectable public var localizationKey: String? {
        set {
            objc_setAssociatedObject(self, &UILabel.localizedKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            return objc_getAssociatedObject(self, &UILabel.localizedKey) as? String
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        if let localizationKey = self.localizationKey {
            self.text = NSLocalizedString(localizationKey, comment: "")
        }
    }
}

extension UIButton {
    static var localizedKey:UInt8 = 0
    @IBInspectable public var localizationKey: String? {
        set {
            objc_setAssociatedObject(self, &UIButton.localizedKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            return objc_getAssociatedObject(self, &UIButton.localizedKey) as? String
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        if let localizationKey = self.localizationKey {
            self.setTitle(NSLocalizedString(localizationKey, comment: ""), for: .normal)
        }
    }
}

extension UITextField {
    static var localizedKey:UInt8 = 0
    @IBInspectable public var placeHolderlocalizationKey: String? {
        set {
            objc_setAssociatedObject(self, &UIButton.localizedKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            return objc_getAssociatedObject(self, &UIButton.localizedKey) as? String
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        if let placeHolderlocalizationKey = self.placeHolderlocalizationKey {
            self.placeholder = NSLocalizedString(placeHolderlocalizationKey, comment: "")
        }
    }
}
