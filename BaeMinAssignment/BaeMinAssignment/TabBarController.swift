//
//  TabBarController.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/8/25.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .baeminBackground
        addVC()
    }
    
    
    private func addVC() {
        let firstVC = BaeMinViewController()
        firstVC.tabBarItem = UITabBarItem(title: "홈", image: .home, selectedImage: .home)
        
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .baeminBackground
        secondVC.title = "Second"
        secondVC.tabBarItem = UITabBarItem(title: "장보기·쇼핑", image: .shoppingBag, selectedImage: .shoppingBag)
        
        let thirdVC = UIViewController()
        thirdVC.view.backgroundColor = .red
        thirdVC.title = "Third"
        thirdVC.tabBarItem = UITabBarItem(title: "찜", image: .heart, selectedImage: .heart)
        
        let fourthVC = UIViewController()
        fourthVC.view.backgroundColor = .yellow
        fourthVC.title = "Fourth"
        fourthVC.tabBarItem = UITabBarItem(title: "주문내역", image: .bill, selectedImage: .bill)
        
        let fifthVC = UIViewController()
        fifthVC.view.backgroundColor = .black
        fifthVC.title = "Fifth"
        fifthVC.tabBarItem = UITabBarItem(title: "마이배민", image: .myBaemin, selectedImage: .myBaemin)
        
        self.viewControllers = [firstVC, secondVC, thirdVC, fourthVC, fifthVC]
    }
}
