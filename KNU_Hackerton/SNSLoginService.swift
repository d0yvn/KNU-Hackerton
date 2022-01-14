////
////  SNSLoginService.swift
////  COVID19
////
////  Created by doyun on 2022/01/13.
////
//
//import Foundation
//import KakaoSDKAuth
//import KakaoSDKUser
//import KakaoSDKCommon
//import NaverThirdPartyLogin
//import Alamofire
//
//class SNSLoginServices:NSObject {
//    
//    static let shared = SNSLoginServices()
//    
//    private lazy var naverLoginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
//    
//    func kakaoLogin() {
//        // 카카오톡 설치 여부 확인
//        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
//            if let error = error {
//                print(error)
//            }
//            else {
//                print("loginWithKakaoAccount() success.")
//                
//                print(oauthToken)
//                //do something
//                _ = oauthToken
//            }
//        }
//    }
//    func naverLogin() {
//        naverLoginInstance?.requestThirdPartyLogin()
//    }
//    
//    func dataFetch() {
//        
//        print("HELLO")
//        guard let isValidAccessToken = naverLoginInstance?.isValidAccessTokenExpireTimeNow() else { return }
//        
//        if !isValidAccessToken {
//            return
//        }
//        
//        
//        guard let tokenType = naverLoginInstance?.tokenType else { return }
//        guard let accessToken = naverLoginInstance?.accessToken else { return }
//        
//        let urlStr = "https://openapi.naver.com/v1/nid/me"
//        let url = URL(string: urlStr)!
//        
//        let authorization = "\(tokenType) \(accessToken)"
//        
//        print("Auth: \(authorization)")
//        let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization]).validate(statusCode: 200..<300)
//        
//        req.responseJSON { response in
//            guard let result = response.value as? [String: Any] else { return }
//            guard let object = result["response"] as? [String: Any] else { return }
//            print(result)
////            guard let name = object["name"] as? String else { return }
////            guard let email = object["email"] as? String else { return }
////            guard let id = object["id"] as? String else {return}
////
////            var dictionary :[String:AnyObject] = [:]
//        }
//        
//        
//    }
//}
//extension SNSLoginServices:NaverThirdPartyLoginConnectionDelegate {
//    //로그인 성공
//    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
//        self.dataFetch()
//    }
//    
//    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
//        self.dataFetch()
//    }
//    
//    func oauth20ConnectionDidFinishDeleteToken() {
//        naverLoginInstance?.requestDeleteToken()
//    }
//    //로그인 실패
//    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
//        print("Error:\(error.localizedDescription)")
//    }
//    
//    
//}
