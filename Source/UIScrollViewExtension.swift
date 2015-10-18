//
//  PullToRefreshConst.swift
//  PullToRefreshSwift
//
//  Created by Yuji Hato on 12/11/14.
//
import Foundation
import UIKit

private let pullToRefreshTag = 810

public extension UIScrollView {

    private var pullToRefreshView: PullToRefreshView? {
        get {
            let pullToRefreshView = viewWithTag(pullToRefreshTag)
            return pullToRefreshView as? PullToRefreshView
        }
    }

    public func addPullToRefresh(refreshCompletion : () -> ()) {
        self.addPullToRefresh(PullToRefreshOption(), refreshCompletion: refreshCompletion)
    }
    
    public func addPullToRefresh(options: PullToRefreshOption, refreshCompletion : () -> ()) {
        let refreshViewFrame = CGRectMake(0, -options.height, self.frame.size.width, options.height)
        let refreshView = PullToRefreshView(options: options, frame: refreshViewFrame, refreshCompletion: refreshCompletion)
        refreshView.tag = pullToRefreshTag
        addSubview(refreshView)
    }

    public func startPullToRefresh() {
        pullToRefreshView?.state = .Refreshing
    }
    
    public func stopPullToRefresh() {
        pullToRefreshView?.state = .Normal
    }
    
    // If you want to PullToRefreshView fixed top potision, Please call this function in scrollViewDidScroll
    public func fixedPullToRefreshViewForDidScroll() {
        
        if let view = pullToRefreshView{
            if view.options.fixedTop {
                if self.contentOffset.y < -view.options.height {
                    var frame = view.frame
                    frame.origin.y = self.contentOffset.y
                    view.frame = frame
                } else {
                    var frame = view.frame
                    frame.origin.y = -view.options.height
                    view.frame = frame
                }
            }
            
        }
    }
}
