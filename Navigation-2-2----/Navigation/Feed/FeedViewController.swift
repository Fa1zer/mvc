//
//  ViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import StorageService
import SnapKit

final class FeedViewController: UIViewController {
    init(model: FeedViewControllerModel){
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var model: FeedViewControllerModel
    
    private var notfication: Bool? = nil {
        didSet {
            switch notfication {
            case nil:
                label.isHidden = true
            case false:
                label.isHidden = false
                label.textColor = .systemRed
            default:
                label.isHidden = false
                label.textColor = .systemGreen
            }
        }
    }
    
    let post: Post = Post(title: "Пост")
    
    private let stackView: UIStackView = {
       let view = UIStackView()
        
        view.backgroundColor = .systemBlue
        view.axis = .vertical
        view.alignment = .top
        view.spacing = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let textField: UITextField = {
       let field = UITextField()
        
        field.backgroundColor = .white
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        field.leftViewMode = .always
        field.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        field.rightViewMode = .always
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }()
    
    private lazy var checkButton: CustomButton = {
        let button = CustomButton(title: "check word", color: .systemBlue, target: didTapCheckButton)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let label: UILabel = {
       let label = UILabel()
        
        label.backgroundColor = .white
        label.text = "Button taped"
        label.textAlignment = .center
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var postPushButtonFirst: CustomButton = {
        let button = CustomButton(title: "Push Post", color: .clear, target: didTapPushButton)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var postPushButtonSecond: CustomButton = {
        let button = CustomButton(title: "Push Post", color: .clear, target: didTapPushButton)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGreen
        
        navigationItem.title = "Feed"
        
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(stackView)
        view.addSubview(textField)
        view.addSubview(checkButton)
        view.addSubview(label)
        
        stackView.insertArrangedSubview(postPushButtonFirst, at: 0)
        stackView.insertArrangedSubview(postPushButtonSecond, at: 1)

        stackView.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.leading.trailing.equalTo(postPushButtonFirst)
            make.bottom.equalTo(postPushButtonSecond)
        })
        
        textField.snp.makeConstraints({ make in
            make.center.equalToSuperview()
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(50)
        })

        checkButton.snp.makeConstraints({ make in
            make.trailing.leading.equalTo(textField)
            make.top.equalTo(textField.snp.bottom).inset(-16)
            make.height.equalTo(50)
        })
        
        label.snp.makeConstraints({ make in
            make.trailing.leading.equalTo(checkButton)
            make.top.equalTo(checkButton.snp.bottom).inset(-16)
            make.height.equalTo(50)
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "post" else {
            return
        }
        
        guard let postViewController = segue.destination as? PostViewController else {
            return
        }
        
        postViewController.post = post
    }
    
    private func didTapPushButton() {
        navigationController?.pushViewController(PostViewController(), animated: true)
    }
    
    @objc private func didTapCheckButton() {
        notfication = model.check(word: textField.text!)
    }
}
