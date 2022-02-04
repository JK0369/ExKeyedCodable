//
//  ViewController.swift
//  ExKeyedCodable
//
//  Created by Jake.K on 2022/02/04.
//

import UIKit
import KeyedCodable

class ViewController: UIViewController {
  
  let jsonSample =
  """
{
  "user_id": "jake",
  "blog_info": {
    "name": {
      "first": "iOS 앱 개발 알아가기",
      "second.example": "SwiftUI 앱 개발 알아가기"
    }
  }
}
"""

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.useEncodingDecodingUsingKeyedCodable()
  }
  
  private func useEncodingDecoding() {
    // decoding
    guard
      let data = self.jsonSample.data(using: .utf8),
      let myModel = try? JSONDecoder().decode(MyModel.self, from: data)
    else { return }
    print(myModel.blogName)

    // encoding
    guard let data = try? JSONEncoder().encode(myModel) else { return }
    let jsonString = String(data: data, encoding: .utf8)
    print(jsonString)
  }
  
  private func useEncodingDecodingUsingKeyedCodable() {
  // decoding
  let model = try? MyModel.keyed.fromJSON(self.jsonSample)
  print(model)

  // encoding
  let jsonString = try? model?.keyed.jsonString()
  print(jsonString)
  }
}
