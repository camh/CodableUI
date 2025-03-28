//
//  TestView.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/26/25.
//

import SwiftUI
import CodableUI

struct BasicView: View {
	
@State private var buttonAction: ActionCodable?

var body: some View {
	ButtonCodable {
		ActionCodable(name: "show_more")
	} label: {
		TextCodable("Show more")
	}
	.onChange(of: buttonAction) { old, new in
		print(new)
	}
	.environment(\.codableActionHandler) { [$buttonAction] action  in
		$buttonAction.wrappedValue = action
	}
}
}

//@ViewBuilderCodable
//var content: ViewCodable {
//	HStackCodable {
//		ImageCodable(systemName: "globe")
//		TextCodable("Hello, world!")
//	}
//	.padding(20)
//	.background(.white(0.8))
//}

#Preview {
	BasicView()
}
