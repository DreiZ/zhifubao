//
//  XZEmotionListView.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/10.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZEmotionListView: UIView {

    var emotions : Array<XZEmotion>?
    
    lazy var topLineView : UIView = {
        let lineView = UIView()
        lineView.backgroundColor = kLineColor
        return lineView
    }()
    
    
    lazy var iScrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        return scrollView
    }()
    
    lazy var pageControl : UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.gray
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension XZEmotionListView {
    func setupUI () {
        self.iScrollView.clipsToBounds = true
        self.clipsToBounds = true

        self.addSubview(self.topLineView)
        self.topLineView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(self)
            make.height.equalTo(0.5)
        }
     
        self.addSubview(self.iScrollView)
        self.iScrollView.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLineView.snp.bottom)
            make.left.bottom.right.equalTo(self)
        }
        
        self.addSubview(self.pageControl)
        self.pageControl.snp.makeConstraints { (make) in
            make.height.equalTo(10)
            make.left.right.bottom.equalToSuperview()
        }

    }
}

extension XZEmotionListView : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNum : Int = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        
        self.pageControl.currentPage = pageNum
    }
}


extension XZEmotionListView {
    func setEmotions (_ emotionArr : Array<XZEmotion>)  {
        self.emotions = emotionArr

        self.pageControl.numberOfPages = emotionArr.count
        
        let count = (emotionArr.count + ICEmotionPageSize - 1) / ICEmotionPageSize
        
        
        var i : Int = 0
        
        while i < count {
            let pageView : XZEmotionPageView = XZEmotionPageView()
            let index = i * ICEmotionPageSize
            let left : Int = emotionArr.count - i * ICEmotionPageSize;//剩余
            let length : Int
            
            if (left >= ICEmotionPageSize) {
                length = ICEmotionPageSize;
            } else {
                length = left;
            }
            
            pageView.setEmotions(self.getArr(emotions: emotionArr, index: index, length: length))
            self.iScrollView.addSubview(pageView)
            pageView.frame = CGRect(x: CGFloat(i) * kWindowW, y: 0, width: kWindowW, height: kChatMoreViewHeight)
            pageView.snp.makeConstraints { (make) in
                make.left.equalTo(self.iScrollView.snp.left).offset(CGFloat(i) * kWindowW)
                make.width.equalTo(kWindowW)
                make.top.equalTo(self.snp.top)
                make.bottom.equalTo(self.snp.bottom)
            }
            
            i += 1
        }
    }
    
    func getArr (emotions : Array<XZEmotion> , index : Int , length : Int) -> Array<XZEmotion> {
        var arr : Array<XZEmotion> = []
        
        var i : Int = index
        for item in emotions {
            if i == index + length {
                break
            }
            arr.append(item)
            
            i += 1
        }
        
        return arr
    }
}

