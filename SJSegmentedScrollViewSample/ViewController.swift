
//  ViewController.swift
//  SJSegmentedScrollViewSample


import UIKit
import SJSegmentedScrollView

class ViewController: SJSegmentedViewController {
    
    var selectedSegment: SJSegmentTab?
    
    override func viewDidLoad() {
        if let storyboard = self.storyboard {
            
            //let headerController = storyboard.instantiateViewController(withIdentifier: "PresentHeader")
            
            let firstViewController = storyboard
                .instantiateViewController(withIdentifier: "FirstTableViewController")
            firstViewController.title = "Jokes"
            
            let secondViewController = storyboard
                .instantiateViewController(withIdentifier: "SecondViewController")
            secondViewController.title = "Memes"
            
        
            //headerViewController = headerController
            segmentControllers = [firstViewController,
                                  secondViewController]
            headerViewHeight = 200
            selectedSegmentViewHeight = 5.0
            headerViewOffsetHeight = 0.0//31.0
            segmentTitleColor = .gray
            selectedSegmentViewColor = .red
            segmentShadow = SJShadow.light()
            showsHorizontalScrollIndicator = false
            showsVerticalScrollIndicator = false
            segmentBounces = false
            delegate = self
        }
        
        super.viewDidLoad()
        
    }

 
    override func viewWillAppear(_ animated: Bool) {
    
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        self.navigationItem.leftBarButtonItem?.isEnabled = true
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.red
    }
    
    func addTapped(){
        print("Button Clicked")
    }

    
    func getSegmentTabWithImage(_ imageName: String) -> UIView {
        
        let view = UIImageView()
        view.frame.size.width = 100
        view.image = UIImage(named: imageName)
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .white
        return view
    }
}

extension ViewController: SJSegmentedViewControllerDelegate {
    
    func didMoveToPage(_ controller: UIViewController, segment: SJSegmentTab?, index: Int) {
        
        if selectedSegment != nil {
            selectedSegment?.titleColor(.lightGray)
        }
        
        if segments.count > 0 {
            
            selectedSegment = segments[index]
            selectedSegment?.titleColor(.red)
            
        }
    }
}

