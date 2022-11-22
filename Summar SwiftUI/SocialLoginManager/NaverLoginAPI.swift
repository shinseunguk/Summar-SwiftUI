//
//  NaverLoginAPI.swift
//
//  Created by SweetDev on 2021/03/02.
//  Copyright © 2021 SweetDev. All rights reserved.
//

import Combine
import Foundation
/// 네이버 간편로그인 이후 데이터를 받아오기 위해서 사용되는 API
///

enum HTTPType: String {
    case get = "GET"
}

enum APIError: LocalizedError {
    case unknownError
    case invalidHttpStatusCode(Int)
    case components
    case urlRequest(Error)
    case parsing(Error)
    case emptyData
    case decodeError

    var errorDescription: String? {
        switch self {
        case .unknownError: return "알수 없는 에러입니다."
        case .invalidHttpStatusCode: return "status코드가 200~299가 아닙니다."
        case .components: return "components를 생성 에러가 발생했습니다."
        case .urlRequest: return "URL request 관련 에러가 발생했습니다."
        case .parsing: return "데이터 parsing 중에 에러가 발생했습니다."
        case .emptyData: return "data가 비어있습니다."
        case .decodeError: return "decode 에러가 발생했습니다."
        }
    }
}

enum NaverLoginRouter {
  case naverLogin(tokenType: String, accessToken: String)

  func asURLRequest() throws -> URLRequest {
    let result: (path: String, parameter: [String: String], body: [String: Any], header: [String: String], method: HTTPType) = {
      switch self {
      case let .naverLogin(tokenType, accessToken):
        return ("", [:], [:], ["Authorization": "\(tokenType) \(accessToken)"], .get)
      }
    }()

    guard var urlComponent = URLComponents(string: "https://openapi.naver.com/v1/nid/me" + result.path) else { throw APIError.unknownError }
    urlComponent.queryItems = result.parameter.map {
      URLQueryItem(name: $0.key, value: $0.value)
    }
      guard let url = urlComponent.url else { throw APIError.unknownError }
    var request = URLRequest(url: url)
    request.httpMethod = result.method.rawValue

    // 헤더 설정
    request.addValue(result.header["Authorization"]!, forHTTPHeaderField: "Authorization")

    return request
  }
}

/// 네이버 간편 로그인
private func _naverLogin(tokenType: String, accessToken: String, session: URLSession = URLSession.shared) throws -> URLSession.DataTaskPublisher {
  let request = try NaverLoginRouter.naverLogin(tokenType: tokenType, accessToken: accessToken).asURLRequest()
  return session.dataTaskPublisher(for: request)
}

func naverLogin(tokenType: String, accessToken: String) throws -> AnyPublisher<response_naver_login, Error>? {
  return try? _naverLogin(tokenType: tokenType, accessToken: accessToken)
        .tryMap { $0.data
        
    }
    .decode(type: response_naver_login.self, decoder: JSONDecoder())
    .eraseToAnyPublisher()
}

// 모델: https://developers.naver.com/docs/login/devguide/#3-4-5-접근-토큰을-이용하여-프로필-api-호출하기
struct response_naver_login: Codable {
  let resultcode: String
  let message: String
  let response: NaverLoginResponse
}

struct NaverLoginResponse: Codable {
  /// 동일인 식별 정보 - 동일인 식별 정보는 네이버 아이디마다 고유하게 발급되는 값입니다.
  let id: String
  /// 사용자 별명
  let nickname: String?
  /// 사용자 이름
  let name: String?
  /// 사용자 메일 주소
  let email: String
  /// F: 여성 M: 남성 U: 확인불가
  let gender: String?
  /// 사용자 연령대
  let age: String?
  /// 사용자 생일(MM-DD 형식)
  let birthday: String?
  /// 사용자 프로필 사진 URL
  let profile_image: String?
}
