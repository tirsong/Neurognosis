//
//  CustomPageViewController.swift
//  Test
//
//  Created by Yanying Huo on 4/1/22.
//

import UIKit

class CustomPageViewController: UIPageViewController {

    var individualPageViewControllerList = [UIViewController]()
      override func viewDidLoad() {
        super.viewDidLoad()

        individualPageViewControllerList = [
          ViewController1.getInstance(index: 0),
          ViewController1.getInstance(index: 1),
          ViewController1.getInstance(index: 2),
          ViewController1.getInstance(index: 3),
        ]

        setViewControllers([individualPageViewControllerList[0]], direction: .forward, animated: true, completion: nil)
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

extension CustomPageViewController: UIPageViewControllerDataSource {
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    let indexOfCurrentPageViewController = individualPageViewControllerList.index(of: viewController)!
    if indexOfCurrentPageViewController == 0 {
     return nil // To show there is no previous page
    } else {
      // Previous UIViewController instance
      return individualPageViewControllerList[indexOfCurrentPageViewController - 1]
    }
  }

  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    let indexOfCurrentPageViewController = individualPageViewControllerList.index(of: viewController)!
    if indexOfCurrentPageViewController == individualPageViewControllerList.count - 1 {
      return nil // To show there is no next page
    } else {
      // Next UIViewController instance
      return individualPageViewControllerList[indexOfCurrentPageViewController + 1]
    }
  }
}
