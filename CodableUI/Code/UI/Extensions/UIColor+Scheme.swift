//
//  UIColor+Scheme.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import UIKit

extension UIColor {
	static func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
		return UIColor { traitCollection in
			return traitCollection.userInterfaceStyle == .dark ? dark : light
		}
	}
}
