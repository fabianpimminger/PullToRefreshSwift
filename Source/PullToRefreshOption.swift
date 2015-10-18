//
//  PullToRefreshConst.swift
//  PullToRefreshSwift
//
//  Created by Yuji Hato on 12/11/14.
//
import UIKit

public class PullToRefreshOption {
    public var backgroundColor = UIColor.clearColor()
    public var indicatorColor = UIColor.grayColor()
    public var autoStopTime: Double = 0 // 0 is not auto stop
    public var fixedSectionHeader = false  // Update the content inset for fixed section headers
    public var height: CGFloat = 56
    
    public init() {
    }
}