//
//  User.swift
//  Hossein
//
//  Created by Diana Saidova on 2022-04-04.
//

import Foundation

class User {
    var firstName: String
    var lastName: String
    var username: String
    var password: String
    var question: String
    var answer: String
    
    init (firstName: String, lastName: String, username: String, password: String, question: String, answer: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.password = password
        self.username = username
        self.question = question
        self.answer = answer
    }
    static func loadUsers() -> [User] { return
        [   User(firstName: "Hossein", lastName: "Haji", username: "hosseinhs", password: "something",      question: "What is your name?", answer: "Hossein"),
            User(firstName: "Reza", lastName: "Soleil", username: "rezasol", password: "something", question: "What is your name?", answer: "Reza"),
            User(firstName: "Ashkan", lastName: "Money", username: "ashkanmo", password: "something", question: "What is your name?", answer: "Ashkan")]

    }
    static func add(someuser: User) -> [User] {
        var users: [User]
        users = User.loadUsers()
        users.append(someuser)
        
        return users
    }
    
}

