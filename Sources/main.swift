//
//  main.swift
//  A simple script to output a random value from a file. 
//
//  Created by f0xb17 on 01/03/2025.
//  Copyright © 2025 f0xb17. All rights reserved.
//

import Foundation

enum FileError: Error {
    case fileNotFound
    case invalidPath
    case readingFailed
}

func returnRandomValue(_ size: Int) -> Int {
  return Int.random(in: 0...size) % size
}

func readFile(_ path: String) throws -> [String] {
  do {
    guard !path.isEmpty else {
      throw FileError.invalidPath
    }
    let fileURL = URL(fileURLWithPath: path)
    let normalizedPath = fileURL.standardizedFileURL.path
    return try String(contentsOfFile: normalizedPath, encoding: .utf8)
                      .components(separatedBy: "\n")
                      .filter { !$0.isEmpty }
  } catch {
    throw FileError.readingFailed
  }
}
