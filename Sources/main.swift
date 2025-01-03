//
//  main.swift
//  A simple script to output a random value from a file. 
//
//  Created by f0xb17 on 01/03/2025.
//  Copyright © 2025 f0xb17. All rights reserved.
//

import Foundation

/// An enumeration representing file-related errors.
enum FileError: Error {
    /// Error when the file is not found.
    case fileNotFound(description: String)
    /// Error when the provided path is invalid.
    case invalidPath(description: String)
    /// Error when there is a failure in reading the file.
    case readingFailed(description: String)
}

/// Returns a random value within the range of 0 to the given size.
/// - Parameter size: The upper limit for the random value.
/// - Returns: A random integer value within the range.
func returnRandomValue(_ size: Int) -> Int {
    return Int.random(in: 0...size) % size
}

/// Reads the contents of the file at the given path and returns the lines as an array of strings.
/// - Parameter path: The path to the file.
/// - Throws: `FileError.invalidPath` if the path is empty.
///           `FileError.readingFailed` if there is an error reading the file.
/// - Returns: An array of non-empty lines from the file.
func readFile(_ path: String) throws -> [String] {
    do {
        guard !path.isEmpty else {  
            throw FileError.invalidPath(description: "Path is empty.")
        }
        let fileURL = URL(fileURLWithPath: path)
        let normalizedPath = fileURL.standardizedFileURL.path
        return try String(contentsOfFile: normalizedPath, encoding: .utf8)
                        .components(separatedBy: "\n")
                        .filter { !$0.isEmpty }
    } catch {
        throw FileError.readingFailed(description: "Failed to read file at \(path).")
    }
}

/// Reads a file from the given path, selects a random value from its contents, and prints the value.
/// - Parameter filePath: The path to the file to be read.
func main(_ filePath: String) {
    do {
        let values = try readFile(filePath)
        let randomValue = returnRandomValue(values.count)
        print(values[randomValue])
    } catch {
        print(error)
    }
}

// Call the main function with an empty string as the file path.
main("")
