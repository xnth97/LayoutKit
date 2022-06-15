// Copyright 2016 LinkedIn Corp.
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

// ANY CHANGES TO THIS FILE SHOULD ALSO BE MADE IN `Documentation/docs/layouts.md`

import UIKit
import LayoutKit

/// A small version of a LinkedIn profile.
open class MiniProfileLayout: InsetLayout<View> {

    public init(imageName: String, name: String, headline: String, isOnline: Bool = true, isCreator: Bool = true) {
        let layout = VStack(distribution: .leading) {
            ZStack(alignment: .topLeading) {
                SizeLayout<UIImageView>(size: CGSize(width: 80, height: 80)) { imageView in
                    imageView.image = UIImage(named: imageName)
                    imageView.layer.cornerRadius = 40
                    imageView.layer.masksToBounds = true
                }
                if isOnline {
                    LabelLayout(text: "Online")
                }
            }
            VStack {
                HStack {
                    LabelLayout(text: name, font: UIFont.systemFont(ofSize: 20.0, weight: .bold))
                    LabelLayout(text: "1st", font: UIFont.systemFont(ofSize: 18.0, weight: .light))
                }
                LabelLayout(text: headline)
                if isCreator {
                    HStack {
                        LabelLayout(text: "Talks about")
                        for topic in ["ios", "swift", "uikit"] {
                            LabelLayout(text: "#\(topic)")
                        }
                    }
                }
            }
            HStack(distribution: .fillEqualSpacing) {
                for buttonText in ["Connect", "Follow", "Message"] {
                    ButtonLayout(type: .system, title: buttonText)
                }
            }
        }

        super.init(
            insets: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
            sublayout: layout)
    }
}
