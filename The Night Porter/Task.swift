//
//  Task.swift
//  The Night Porter
//
//  Created by Alessandro Iori on 20/05/2020.
//  Copyright © 2020 Alessandro Iori. All rights reserved.
//

import Foundation

enum TaskType {
    case daily, weekly, monthly
}

struct Task {
    var name: String
    var type: TaskType
    var completed: Bool
    var lastCompleted: NSDate?
}
