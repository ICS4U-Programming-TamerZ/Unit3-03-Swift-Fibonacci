import Foundation

/**
 Function to read an integer from a file.
 
 - Parameter atPath: The path of the file to read.
 - Returns: The integer read from the file, or nil if an error occurs.
 */
func readIntegerFromFile(atPath path: String) -> Int? {
    do {
        let content = try String(contentsOfFile: path)
        return Int(content.trimmingCharacters(in: .whitespacesAndNewlines))
    } catch {
        print("Error reading file: \(error)")
        return nil
    }
}

/**
 Recursive function to calculate Fibonacci number for a given index.
 
 - Parameter n: The index of the Fibonacci number to calculate.
 - Returns: The Fibonacci number at the given index.
 */
func fibonacci(_ n: Int) -> Int {
    if n <= 1 {
        return n
    }
    return fibonacci(n - 1) + fibonacci(n - 2)
}

/**
 Function to write content to a file.
 
 - Parameters:
   - fileName: The name of the file to write to.
   - content: The content to write to the file.
 */
func writeToFile(_ fileName: String, _ content: String) {
    do {
        try content.write(toFile: fileName, atomically: true, encoding: .utf8)
        print("Output written to \(fileName)")
    } catch {
        print("Error writing to file: \(error)")
    }
}

// File paths (assuming input.txt is in the same directory as your Swift code)
let inputFileName = "input.txt"
let outputFileName = "output.txt"

// Get the path to the current directory
let currentDirectory = FileManager.default.currentDirectoryPath

// Construct the full path to input.txt
let inputFilePath = currentDirectory + "/" + inputFileName

// Attempt to read integer from file
if let n = readIntegerFromFile(atPath: inputFilePath) {
    // Generate Fibonacci sequence
    var sequence = "Fibonacci sequence up to \(n):\n"
    for i in 0..<n {
        sequence += "\(fibonacci(i)) "
    }
    // Print the sequence
    print(sequence)
    // Write the sequence to output file
    writeToFile(outputFileName, sequence)
} else {
    print("Failed to read the file.")
}
