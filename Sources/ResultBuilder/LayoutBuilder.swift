//
//  LayoutBuilder.swift
//  LayoutKit-iOS
//
//  Created by Yubo Qin on 6/14/22.
//

import Foundation

@resultBuilder
public struct LayoutBuilder {

    public static func buildBlock(_ components: Layout...) -> [Layout] {
        return components
    }

    public static func buildBlock(_ components: [Layout]...) -> [Layout] {
        return components.flatMap { $0 }
    }

    public static func buildOptional(_ component: [Layout]?) -> [Layout] {
        return component ?? []
    }

    public static func buildEither(first component: [Layout]) -> [Layout] {
        return component
    }

    public static func buildEither(second component: [Layout]) -> [Layout] {
        return component
    }

    public static func buildArray(_ components: [[Layout]]) -> [Layout] {
        return components.flatMap { $0 }
    }

    public static func buildExpression(_ expression: Layout) -> [Layout] {
        return [expression]
    }

}
