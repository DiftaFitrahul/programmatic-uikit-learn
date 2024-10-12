//
//  ErrorMessage.swift
//  GithubAppUIKIT
//
//  Created by MacBook Difta on 11/10/24.
//

import Foundation

// We conform Error protocol in order to make this enum can be used in (Result)

enum GFError: String, Error{
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}
