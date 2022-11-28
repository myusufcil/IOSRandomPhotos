//
//  ViewController.swift
//  RandomPhotos
//
//  Created by muhammed cil on 28.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let uiImageView :UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button :UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFill
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(uiImageView)
        view.addSubview(button)
       
        uiImageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        uiImageView.center = view.center
        button.addTarget(self, action: #selector(didButtonTap), for: .touchUpInside)
        getRandomPhoto()
    }
    
    @objc func didButtonTap(){
        getRandomPhoto()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 30, y: view.frame.size.height - 150-view.safeAreaInsets.bottom, width: view.center.x + 50, height: 55)
    }
    
    func getRandomPhoto(){
        let urlString = "https://picsum.photos/200/300"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        uiImageView.image = UIImage(data: data)
    }


}

