//
//  main.swift
//  A simple script to output a random value from a file. 
//
//  Created by f0xb17 on 01/03/2025.
//  Copyright © 2025 f0xb17. All rights reserved.
//

import Foundation

func returnRandomValue(_ size: Int) -> Int {
  return Int.random(in: 0...size) % size
}

for _ in 1...10 {
  print(returnRandomValue(10))
}
