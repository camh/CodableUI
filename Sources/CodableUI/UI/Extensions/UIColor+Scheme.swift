//
//  UIColor+Scheme.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

#if canImport(SwiftUI)

#if canImport(UIKit)
import UIKit
#else
import AppKit
#endif

#if canImport(UIKit)
/// Alias of UIColor.
public typealias PlatformColor = UIColor
#else
/// Alias of NSColor.
public typealias PlatformColor = NSColor
#endif

extension PlatformColor {
#if canImport(UIKit)
	static func dynamicColor(light: PlatformColor, dark: PlatformColor) -> PlatformColor {
		return PlatformColor { traitCollection in
			return traitCollection.userInterfaceStyle == .dark ? dark : light
		}
	}
	#else
	static func dynamicColor(light: PlatformColor, dark: PlatformColor) -> PlatformColor {
		light
	}
#endif
}

#endif
