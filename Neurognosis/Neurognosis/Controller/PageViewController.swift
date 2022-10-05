//
//  PageViewController.swift
//  Neurognosis
//
//  Created by Yanying Huo on 4/1/22.
//

import UIKit

class PageViewController: UIPageViewController {
    
    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    let initialPage = 0
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setup()
        style()
        layout()

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension PageViewController {
    
    func setup() {
        dataSource = self
        delegate = self
        
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)

        // create an array of viewController
        let page1 = ViewController1()
        let page2 = ViewController2()
        let page3 = ViewController3()

        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        // set initial viewController to be displayed
        // Note: We are not passing in all the viewControllers here. Only the one to be displayed.
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
    }
    
    func style() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemGray2
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
    }
    
    func layout() {
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 1),
        ])
    }
}

// MARK: - Actions

extension PageViewController {
    
    // How we change page when pageControl tapped.
    // Note - Can only skip ahead on page at a time.
    @objc func pageControlTapped(_ sender: UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
    }
}

// MARK: - DataSources

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == 0 {
            return pages.last               // wrap to last
        } else {
            return pages[currentIndex - 1]  // go previous
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }

        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]  // go next
        } else {
            return pages.first              // wrap to first
        }
    }
}

// MARK: - Delegates

extension PageViewController: UIPageViewControllerDelegate {
    
    // How we keep our pageControl in sync with viewControllers
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        
        pageControl.currentPage = currentIndex
    }
}

class ViewController1: UIViewController {
    
    let image = UIImageView()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 1, green: 0.988, blue: 0.925, alpha: 1)
        
        image.frame = CGRect(x: 0, y: 100, width: 390, height: 350)
        image.image = UIImage(named: "Image-2")
        
        label.frame = CGRect(x: 20, y: 490, width: 355, height: 116)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.38
        label.attributedText = NSMutableAttributedString(string: "Find out whether or not you have the ALS disease by filling out a simple questionnaire.", attributes: [NSAttributedString.Key.kern: -0.5, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.font = UIFont(name: "Helvetica Neu", size: 14)
        label.textColor = UIColor(red: 0.133, green: 0.486, blue: 0.616, alpha: 1)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 5
        
        
        view.addSubview(image)
        view.addSubview(label)
    }
}

class ViewController2: UIViewController {
    
    let image = UIImageView()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 1, green: 0.988, blue: 0.925, alpha: 1)
        
        image.frame = CGRect(x: 0, y: 100, width: 390, height: 350)
        image.image = UIImage(named: "Image-4")
        
        label.frame = CGRect(x: 20, y: 490, width: 355, height: 116)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.38
        label.attributedText = NSMutableAttributedString(string: "Our app is backed by a sequential pattern mining algorithm for early diagnosis of ALS. In our development using Optum’s EMR-agnostic database, we utilized Electronic Health Records, first standardizing our data and making it more efficient to implement into our machine learning algorithm", attributes: [NSAttributedString.Key.kern: -0.5, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.font = UIFont(name: "Helvetica Neu", size: 14)
        label.textColor = UIColor(red: 0.133, green: 0.486, blue: 0.616, alpha: 1)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 5
        
        
        view.addSubview(image)
        view.addSubview(label)
    }
}

class ViewController3: UIViewController {
    let image = UIImageView()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 1, green: 0.988, blue: 0.925, alpha: 1)
        
        image.frame = CGRect(x: 0, y: 100, width: 390, height: 350)
        image.image = UIImage(named: "Image-5")
        
        label.frame = CGRect(x: 20, y: 490, width: 355, height: 116)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.38
        label.attributedText = NSMutableAttributedString(string: "Our SVM algorithm is able to provide both the highest sensitivity and specificity, potentially shortening the diagnosis time of ALS by up to 169.2 days.", attributes: [NSAttributedString.Key.kern: -0.5, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.font = UIFont(name: "Helvetica Neu", size: 14)
        label.textColor = UIColor(red: 0.133, green: 0.486, blue: 0.616, alpha: 1)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 5
        
        
        view.addSubview(image)
        view.addSubview(label)
    }
}
