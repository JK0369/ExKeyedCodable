//
//  MyModel.swift
//  ExKeyedCodable
//
//  Created by Jake.K on 2022/02/04.
//

import Foundation
import KeyedCodable
/*
{
  "user_id": "jake",
  "blog_info": {
    "name": {
      "first": "iOS 앱 개발 알아가기",
      "second.example": "SwiftUI 앱 개발 알아가기"
    }
  }
}
 */
struct MyModel: Codable {
  enum CodingKeys: String, KeyedKey {
    case userID = "user_id"
    case blogName = "blog_info+name+second.example"
    
    var options: KeyOptions? {
      switch self {
      case .blogName:
        return KeyOptions(delimiter: .character("+"), flat: .none)
      default:
        return nil
      }
    }
  }
  var userID: String?
  var blogName: String?
}
