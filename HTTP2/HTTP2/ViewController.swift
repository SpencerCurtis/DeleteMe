//
//  ViewController.swift
//  HTTP2
//
//  Created by Spencer Curtis on 3/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

final class Shell {
    
    private var worker: Container
    
    // MARK: - Initialization
    
    public init(worker: Container) throws{
        self.worker = worker
    }
    
    // MARK: - Public
    
    func execute(commandName: String, arguments: [String] = []) throws {
        return try bash(commandName: commandName, arguments:arguments)
    }
    
    // MARK: - Private
    
    private func bash(commandName: String, arguments: [String]) throws -> {
        
        return executeShell(command: "/bin/bash" , arguments:[ "-l", "-c", "which \(commandName)" ])
            .map(to: String.self) { data in
                guard let commandPath = String(data: data, encoding: .utf8) else {
                    throw Abort(.internalServerError)
                }
                return commandPath.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
            }.flatMap(to: Data.self) { path in
                return self.executeShell(command: path, arguments: arguments)
        }
    }
    
    private func executeShell(command: String, arguments: [String] = []) {
        
        return Future.map(on: worker) {
            
            let process = Process()
            process.launchPath = command
            process.arguments = arguments
            
            let pipe = Pipe()
            process.standardOutput = pipe
            process.launch()
            
            return pipe.fileHandleForReading.readDataToEndOfFile()
        }
    }
    
}
