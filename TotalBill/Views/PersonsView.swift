//
//  PersonsView.swift
//  PersonsView
//
//  Created by mac on 08.07.2023.
//

import UIKit

class PersonsView: UIView {
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Persons"
        label.textColor = #colorLiteral(red: 0.1792383194, green: 0.2248822749, blue: 0.2836512029, alpha: 1)
        label.font = UIFont(name: "Avenir Next", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var backgroundGrayView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9442129731, green: 0.9491840005, blue: 0.9404789805, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.tintColor = #colorLiteral(red: 0.4510066509, green: 0.4966486692, blue: 0.5633206367, alpha: 1)
        button.isEnabled = false
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 60)
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.tintColor = #colorLiteral(red: 0.4510066509, green: 0.4966486692, blue: 0.5633206367, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 60)
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)

        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var counterLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 48)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var counter = 0
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
      
        
        addSubview(titleLabel)
        addSubview(backgroundGrayView)
        backgroundGrayView.addSubview(minusButton)
        backgroundGrayView.addSubview(plusButton)
        backgroundGrayView.addSubview(counterLabel)
        
    }
    
    @objc func minusButtonTapped() {
        
        counter -= 1
        counterLabel.text = "\(counter)"
        
        if counter == 0 {
            minusButton.isEnabled = false

        }
    }
    
    @objc func plusButtonTapped() {
        counter += 1
        counterLabel.text = "\(counter)"
        minusButton.isEnabled = true 
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            backgroundGrayView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            backgroundGrayView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundGrayView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundGrayView.heightAnchor.constraint(equalToConstant: 100),
            
            minusButton.topAnchor.constraint(equalTo: backgroundGrayView.topAnchor, constant: 0),
            minusButton.leadingAnchor.constraint(equalTo: backgroundGrayView.leadingAnchor, constant: 0),
            minusButton.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 80),
            
            plusButton.topAnchor.constraint(equalTo: backgroundGrayView.topAnchor, constant: 0),
            plusButton.trailingAnchor.constraint(equalTo: backgroundGrayView.trailingAnchor, constant: 0),
            plusButton.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 80),
            
            counterLabel.centerYAnchor.constraint(equalTo: backgroundGrayView.centerYAnchor),
            counterLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 10),
            counterLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -10),


        ])
        
        
    }
}
