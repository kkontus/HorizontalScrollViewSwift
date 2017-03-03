//
//  CustomScrollView.swift
//  ScrollView
//
//  Created by Kristijan Kontus on 02/03/2017.
//  Copyright © 2017 com.kkontus. All rights reserved.
//

import UIKit

class CustomScrollViewController: UIViewController, UIScrollViewDelegate {
    private var scrollView: UIScrollView!
    private var contentView: UIView!
    private var scrollViewHorizontal: UIScrollView!
    private var contentViewMock: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor = UIColor.red
        
        // scrollview
        createScrollView()
        // content view inside scrollview
        createContentView()
        // content view inside scrollview
        createHorizontalScrollView()
        // content view inside scrollview
        createContentViewMock()
        
        // add collection view or any other view to the horizontal scrollview
        scrollViewHorizontal.addSubview(contentViewMock)
        // add horizontal scrollview to the content view
        contentView.addSubview(scrollViewHorizontal)
        // add content view to scrollview
        scrollView.addSubview(contentView)
        // add scrollview to root view
        self.view.addSubview(scrollView)
        
        // constraints
        addLayoutConstraintsForScrollView(scrollView)
        addLayoutConstraintsForContentView(contentView)
        addLayoutConstraintsForScrollViewHorizontal(scrollViewHorizontal)
        addLayoutConstraintsForContentViewMock(contentViewMock)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let backButton: UIBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.closeView))
        self.navigationItem.setLeftBarButton(backButton, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func closeView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func createScrollView() {
        scrollView = UIScrollView(frame: CGRect.zero)
        scrollView.backgroundColor = UIColor.green
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.delegate = self
        scrollView.bounces = true
    }
    
    func createContentView() {
        contentView = UIView(frame: CGRect.zero)
        contentView.backgroundColor = UIColor.purple
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func createHorizontalScrollView() {
        scrollViewHorizontal = UIScrollView(frame: CGRect.zero)
        scrollViewHorizontal.backgroundColor = UIColor.yellow
        scrollViewHorizontal.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollViewHorizontal.delegate = self
        scrollViewHorizontal.bounces = true
    }
    
    func createContentViewMock() {
        contentViewMock = UIView(frame: CGRect.zero)
        contentViewMock.backgroundColor = UIColor.blue
        contentViewMock.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    // MAIN SCROLL VIEW
    private func addLayoutConstraintsForScrollView(_ newItem: UIView) {
        // when using autolayout constraints in the code, we MUST ALWAYS SET translatesAutoresizingMaskIntoConstraints = false
        newItem.translatesAutoresizingMaskIntoConstraints = false
        
        let topContraint = NSLayoutConstraint(item: newItem, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 10)
        let leadingContraint = NSLayoutConstraint(item: newItem, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 10)
        let trailingContraint = NSLayoutConstraint(item: self.view, attribute: .trailing, relatedBy: .equal, toItem: newItem, attribute: .trailing, multiplier: 1.0, constant: 10)
        let bottomContraint = NSLayoutConstraint(item: self.bottomLayoutGuide, attribute: .top, relatedBy: .equal, toItem: newItem, attribute: .bottom, multiplier: 1.0, constant: 10)
        
        self.view.addConstraints([topContraint, leadingContraint, trailingContraint, bottomContraint])
    }
    
    // CONTENT VIEW INSIDE MAIN SCROLL VIEW
    private func addLayoutConstraintsForContentView(_ newItem: UIView) {
        // when using autolayout constraints in the code, we MUST ALWAYS SET translatesAutoresizingMaskIntoConstraints = false
        newItem.translatesAutoresizingMaskIntoConstraints = false
        
        let topContraint = NSLayoutConstraint(item: newItem, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .top, multiplier: 1.0, constant: 0)
        let leadingContraint = NSLayoutConstraint(item: newItem, attribute: .leading, relatedBy: .equal, toItem: scrollView, attribute: .leading, multiplier: 1.0, constant: 0)
        //        let trailingContraint = NSLayoutConstraint(item: newItem, attribute: .trailing, relatedBy: .equal, toItem: scrollView, attribute: .trailing, multiplier: 1.0, constant: 0)
        //        let bottomContraint = NSLayoutConstraint(item: newItem, attribute: .bottom, relatedBy: .equal, toItem: scrollView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let trailingContraint = NSLayoutConstraint(item: scrollView, attribute: .trailing, relatedBy: .equal, toItem: newItem, attribute: .trailing, multiplier: 1.0, constant: 0)
        let bottomContraint = NSLayoutConstraint(item: scrollView, attribute: .bottom, relatedBy: .equal, toItem: newItem, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        let equalWidthConstraint = NSLayoutConstraint(item: newItem, attribute: .width, relatedBy: .equal, toItem: scrollView, attribute: .width, multiplier: 1.0, constant: 0)
        let equalHeightConstraint = NSLayoutConstraint(item: newItem, attribute: .height, relatedBy: .equal, toItem: scrollView, attribute: .height, multiplier: 1.0, constant: 0)
        
        // JUST FOR TESTING
        //let widthConstraint = NSLayoutConstraint(item: newItem, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 800)
        
        scrollView.addConstraints([topContraint, leadingContraint, trailingContraint, bottomContraint, equalWidthConstraint, equalHeightConstraint])
    }
    
    // HORIZONTAL SCROLL VIEW CONTENT VIEW
    private func addLayoutConstraintsForScrollViewHorizontal(_ newItem: UIView) {
        // when using autolayout constraints in the code, we MUST ALWAYS SET translatesAutoresizingMaskIntoConstraints = false
        newItem.translatesAutoresizingMaskIntoConstraints = false
        
        let topContraint = NSLayoutConstraint(item: newItem, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: 0)
        let leadingContraint = NSLayoutConstraint(item: newItem, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 0)
        //        let trailingContraint = NSLayoutConstraint(item: newItem, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1.0, constant: 0)
        //        let bottomContraint = NSLayoutConstraint(item: newItem, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let trailingContraint = NSLayoutConstraint(item: contentView, attribute: .trailing, relatedBy: .equal, toItem: newItem, attribute: .trailing, multiplier: 1.0, constant: 0)
        let bottomContraint = NSLayoutConstraint(item: contentView, attribute: .bottom, relatedBy: .equal, toItem: newItem, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        contentView.addConstraints([topContraint, leadingContraint, trailingContraint, bottomContraint])
    }
    
    // ANY CUSTOM VIEW INSIDE HORIZONTAL SCROLL VIEW
    private func addLayoutConstraintsForContentViewMock(_ newItem: UIView) {
        // when using autolayout constraints in the code, we MUST ALWAYS SET translatesAutoresizingMaskIntoConstraints = false
        newItem.translatesAutoresizingMaskIntoConstraints = false
        
        let topContraint = NSLayoutConstraint(item: newItem, attribute: .top, relatedBy: .equal, toItem: scrollViewHorizontal, attribute: .top, multiplier: 1.0, constant: 0)
        let leadingContraint = NSLayoutConstraint(item: newItem, attribute: .leading, relatedBy: .equal, toItem: scrollViewHorizontal, attribute: .leading, multiplier: 1.0, constant: 0)
        let trailingContraint = NSLayoutConstraint(item: scrollViewHorizontal, attribute: .trailing, relatedBy: .equal, toItem: newItem, attribute: .trailing, multiplier: 1.0, constant: 0)
        let bottomContraint = NSLayoutConstraint(item: scrollViewHorizontal, attribute: .bottom, relatedBy: .equal, toItem: newItem, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        
        let widthConstraint = NSLayoutConstraint(item: newItem, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 1000)
        let equalHeightConstraint = NSLayoutConstraint(item: newItem, attribute: .height, relatedBy: .equal, toItem: scrollViewHorizontal, attribute: .height, multiplier: 1.0, constant: 0)
        
        
        scrollViewHorizontal.addConstraints([topContraint, leadingContraint, trailingContraint, bottomContraint, widthConstraint, equalHeightConstraint])
    }
    
}

