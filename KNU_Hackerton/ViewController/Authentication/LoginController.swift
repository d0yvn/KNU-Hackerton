//
//  LoginViewController.swift
//  iOS_APP
//
//  Created by doyun on 2021/12/21.
//

import UIKit
//import KakaoSDKCommon
//import KakaoSDKAuth
//import KakaoSDKUser
//import GoogleSignIn

class LoginController: UIViewController {
    
    
    private let label : UILabel = {
        let label = UILabel()
        label.text = "My Talent"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .italicSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
        
    }()
    private let kakaoButton : UIButton = {
        let image = UIImage(named: "kakao_login")
        let button = Utilites().inputLoginButton(image: image)
        button.addTarget(self, action: #selector(kakaoLoginTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let naverButton : UIButton = {
        let image = UIImage(named: "navar_login")
        let button = Utilites().inputLoginButton(image: image)
        button.addTarget(self, action: #selector(naverLoginTapped), for: .touchUpInside)
        return button
    }()
    
//    private let googleButton: GIDSignInButton = {
//        let button = GIDSignInButton()
//        button.colorScheme = .light
//        button.style = .wide
//        button.addTarget(self, action: #selector(googleLoginTapped), for: .touchUpInside)
//        return button
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - selector
    @objc func kakaoLoginTapped() {
        SNSLoginServices.shared.kakaoLogin()
    }
    
    @objc func naverLoginTapped() {
        SNSLoginServices.shared.naverLogin()
    }
    
    @objc func googleLoginTapped() {
    }
    
    //MARK: - helper
    func configureUI(){
        
        let padding = view.width/9
        view.backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [kakaoButton,naverButton])
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        // 타이틀 설정
        view.addSubview(label)
        label.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,
                     bottom : stackView.topAnchor, right: view.rightAnchor,
                     paddingTop: view.height/13, paddingLeft: view.width/5,
                     paddingBottom: 10, paddingRight: view.width/5)
        
        // 로그인 버튼.
        stackView.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: padding, paddingBottom : padding, paddingRight: padding,height: view.height/5)
        
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

