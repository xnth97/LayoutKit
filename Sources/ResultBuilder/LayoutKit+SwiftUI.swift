//
//  LayoutKit+SwiftUI.swift
//  LayoutKit-iOS
//
//  Created by Yubo Qin on 6/14/22.
//

import UIKit

public class HStack<V: View>: StackLayout<V> {

    public init(spacing: CGFloat = 8,
                distribution: StackLayoutDistribution = .fillFlexing,
                alignment: Alignment = .fill,
                flexibility: Flexibility? = nil,
                viewReuseId: String? = nil,
                @LayoutBuilder builder: () -> [Layout],
                config: ((V) -> Void)? = nil) {
        super.init(axis: .horizontal,
                   spacing: spacing,
                   distribution: distribution,
                   alignment: alignment,
                   flexibility: flexibility,
                   viewReuseId: viewReuseId,
                   sublayouts: builder(),
                   config: config)
    }

    public convenience init(spacing: CGFloat = 8,
                            distribution: StackLayoutDistribution = .fillFlexing,
                            alignment: Alignment = .fill,
                            flexibility: Flexibility? = nil,
                            viewReuseId: String? = nil,
                            @LayoutBuilder builder: () -> [Layout]) {
        self.init(spacing: spacing,
                  distribution: distribution,
                  alignment: alignment,
                  flexibility: flexibility,
                  viewReuseId: viewReuseId,
                  builder: builder,
                  config: nil)
    }

}

public class VStack<V: View>: StackLayout<V> {

    public init(spacing: CGFloat = 0,
                distribution: StackLayoutDistribution = .fillFlexing,
                alignment: Alignment = .fill,
                flexibility: Flexibility? = nil,
                viewReuseId: String? = nil,
                @LayoutBuilder builder: () -> [Layout],
                config: ((V) -> Void)? = nil) {
        super.init(axis: .vertical,
                   spacing: spacing,
                   distribution: distribution,
                   alignment: alignment,
                   flexibility: flexibility,
                   viewReuseId: viewReuseId,
                   sublayouts: builder(),
                   config: config)
    }

    public convenience init(spacing: CGFloat = 0,
                            distribution: StackLayoutDistribution = .fillFlexing,
                            alignment: Alignment = .fill,
                            flexibility: Flexibility? = nil,
                            viewReuseId: String? = nil,
                            @LayoutBuilder builder: () -> [Layout]) {
        self.init(spacing: spacing,
                  distribution: distribution,
                  alignment: alignment,
                  flexibility: flexibility,
                  viewReuseId: viewReuseId,
                  builder: builder,
                  config: nil)
    }

}

public class ZStack<V: View>: OverlayLayout<V> {

    public init(alignment: Alignment = .fill,
                flexibility: Flexibility = .flexible,
                viewReuseId: String? = nil,
                @LayoutBuilder builder: () -> [Layout],
                config: ((V) -> Void)? = nil) {
        super.init(primaryLayouts: builder(),
                   alignment: alignment,
                   flexibility: flexibility,
                   viewReuseId: viewReuseId,
                   config: config)
    }

    public convenience init(alignment: Alignment = .fill,
                            flexibility: Flexibility = .flexible,
                            viewReuseId: String? = nil,
                            @LayoutBuilder builder: () -> [Layout]) {
        self.init(alignment: alignment,
                  flexibility: flexibility,
                  viewReuseId: viewReuseId,
                  builder: builder,
                  config: nil)
    }

}

// MARK: - Modifiers

extension Layout {

    // MARK: - Padding

    public func padding<V: View>(insets: EdgeInsets,
                                 alignment: Alignment = .fill,
                                 flexibility: Flexibility? = nil,
                                 viewReuseId: String? = nil,
                                 config: ((V) -> Void)? = nil) -> InsetLayout<V> {
        return InsetLayout(
            insets: insets,
            alignment: alignment,
            flexibility: flexibility,
            viewReuseId: viewReuseId,
            sublayout: self,
            config: config)
    }

    public func padding<V: View>(inset: CGFloat,
                                 alignment: Alignment = .fill,
                                 flexibility: Flexibility? = nil,
                                 viewReuseId: String? = nil,
                                 config: ((V) -> Void)? = nil) -> InsetLayout<V> {
        let insets = EdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        return InsetLayout(
            insets: insets,
            alignment: alignment,
            flexibility: flexibility,
            viewReuseId: viewReuseId,
            sublayout: self,
            config: config)
    }

    // MARK: - Frame

    public func frame<V: View>(minWidth: CGFloat? = nil,
                               maxWidth: CGFloat? = nil,
                               minHeight: CGFloat? = nil,
                               maxHeight: CGFloat? = nil,
                               alignment: Alignment? = nil,
                               flexibility: Flexibility? = nil,
                               viewReuseId: String? = nil,
                               config: ((V) -> Void)? = nil) -> SizeLayout<V> {
        return SizeLayout(
            minWidth: minWidth,
            maxWidth: maxWidth,
            minHeight: minHeight,
            maxHeight: maxHeight,
            alignment: alignment,
            flexibility: flexibility,
            viewReuseId: viewReuseId,
            sublayout: self,
            config: config)
    }

    public func frame<V: View>(width: CGFloat,
                               height: CGFloat,
                               alignment: Alignment? = nil,
                               flexibility: Flexibility? = nil,
                               viewReuseId: String? = nil,
                               sublayout: Layout? = nil,
                               config: ((V) -> Void)? = nil) -> SizeLayout<V> {
        return SizeLayout(
            width: width,
            height: height,
            alignment: alignment,
            flexibility: flexibility,
            viewReuseId: viewReuseId,
            sublayout: self,
            config: config)
    }

}
