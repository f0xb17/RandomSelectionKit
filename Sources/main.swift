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

func readFile(_ path: String) -> [String] {
  do {
    guard !path.isEmpty else {
      print("File path should not be empty!")
      return []
    }
    let fileURL = URL(fileURLWithPath: path)
    let normalizedPath = fileURL.standardizedFileURL.path
    return try String(contentsOfFile: normalizedPath, encoding: .utf8)
                      .components(separatedBy: "\n")
                      .filter { !$0.isEmpty }
  } catch {
    print("Error reading file: \(error)")
    return []
  }
}

print(readFile(""))
