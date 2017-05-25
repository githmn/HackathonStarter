//
//  Regexp.swift
//  HackathonStarter
//
//  Created by 田中　達也 on 2016/07/01.
//  Copyright © 2016年 tattn. All rights reserved.
//

import Foundation

final class Regexp {
    let internalRegexp: NSRegularExpression
    let pattern: String

    init(_ pattern: String) {
        self.pattern = pattern
        do {
            internalRegexp = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        } catch {
            print(error)
            internalRegexp = NSRegularExpression()
        }
    }

    func isMatch(_ input: String) -> Bool {
        let matches = internalRegexp.matches(in: input, options: [], range: NSRange(location: 0, length: input.characters.count))
        return matches.count > 0
    }

    func matches(_ input: String) -> [String]? {
        guard isMatch(input) else { return nil }

        let matches = internalRegexp.matches(in: input, options: [], range: NSRange(location: 0, length: input.characters.count))
        var results = [String]()
        for match in matches {
            results.append((input as NSString).substring(with: match.range))
        }
        return results
    }
}
