//
//  TrafficSignTableViewEdit.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/23.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation
import UIKit

// Sign TableView Editing moddification
// NOTE: only handl for one section tableView editing

enum SignTableViewEditingCommand {
    case InitItems(items: [TrafficSignItemViewModel])
    case MoveItem(fromIndex: IndexPath, toIndex: IndexPath)
    
    // the following isn't used
//    case AppendItems(items: [TrafficSignItemViewModel])
//    case DeleteItems(indexs: [IndexPath])
//    case CopyItems(indexs: [IndexPath])
//    case ToTopItems(indexs: [IndexPath])
//    case ToButtomItems(indexs: [IndexPath])
}

struct SignTableViewState {
    var sections: [TrafficSignSection]
    var isAddSuccess: Bool // will not use
    
    init(sections: [TrafficSignSection], isAdded: Bool) {
        self.sections = sections
        self.isAddSuccess = isAdded
    }
    
    func execute(command: SignTableViewEditingCommand) -> SignTableViewState {
        switch command {
        case .InitItems(let initItems):
            var sectionsVar = self.sections
            sectionsVar[0] = TrafficSignSection(original: sectionsVar[0], items: initItems)
            return SignTableViewState(sections: sectionsVar, isAdded: false)
            
        case .MoveItem(let moveEvent):
            var sectionsVar = self.sections
            var fromItems = sectionsVar[moveEvent.fromIndex.section].items
            var toItems = sectionsVar[moveEvent.toIndex.section].items
            
            if moveEvent.fromIndex.section == moveEvent.toIndex.section {
                toItems.insert(toItems.remove(at: moveEvent.fromIndex.row), at: moveEvent.toIndex.row)
                let toSection = TrafficSignSection(original: sectionsVar[moveEvent.toIndex.section], items: toItems)
                sectionsVar[moveEvent.fromIndex.section] = toSection
                return SignTableViewState(sections: sectionsVar, isAdded: false)
            } else { // skip handling, due to there are only one section
                let item = fromItems.remove(at: moveEvent.fromIndex.row)
                toItems.insert(item, at: moveEvent.toIndex.row)
                let fromSection = TrafficSignSection(original: sectionsVar[moveEvent.fromIndex.section], items: fromItems)
                let toSection = TrafficSignSection(original: sectionsVar[moveEvent.toIndex.section], items: toItems)
                sectionsVar[moveEvent.fromIndex.section] = fromSection
                sectionsVar[moveEvent.toIndex.section] = toSection
                return SignTableViewState(sections: sectionsVar, isAdded: false)
            }
            
            // the following isn't used
//        case .AppendItems(let appendItems):
//            var sectionsVar = self.sections
//            var origItems = sectionsVar[0].items
//            var addSuccess = false
//            for item in appendItems {
//                if origItems.count < 200 { // 200 is the limit
//                    origItems.append(item)
//                    addSuccess = true
//                } else {
//                    // show error message
//                    //                    addSuccess = false
//                    break
//                }
//            }
//            sectionsVar[0] = TrafficSignSection(original: sectionsVar[0], items: origItems)
//            return SignTableViewState(sections: sectionsVar, isAdded: addSuccess)
//
//        case .DeleteItems(let indexPaths):
//            var sectionsVar = self.sections
//            var items = sectionsVar[0].items
//            let indexs = getSortedPosition(indexs: indexPaths)
//            for index in indexs.reversed() {
//                items.remove(at: index)
//            }
//            sectionsVar[0] = TrafficSignSection(original: sectionsVar[0], items: items)
//            return SignTableViewState(sections: sectionsVar, isAdded: false)
//
//        case .CopyItems(let indexPaths):
//            var sectionsVar = self.sections
//            var origItems = sectionsVar[0].items
//            var copyItems: [TrafficSignItemViewModel] = []
//            let indexs = getSortedPosition(indexs: indexPaths)
//            for index in indexs {
//                // copy by value
//                let copyItem = sectionsVar[0].items[index]
//                let signItem = TrafficSignItemViewModel(title: copyItem.title, image: copyItem.image)
//                copyItems.append(signItem)
//            }
//            for addItem in copyItems {
//                if origItems.count < 200 { // 200 is the limit
//                    origItems.append(addItem)
//                } else {
//                    // show error message
//                    break
//                }
//            }
//            sectionsVar[0] = TrafficSignSection(original: sectionsVar[0], items: origItems)
//            return SignTableViewState(sections: sectionsVar, isAdded: false)
//
//        case .ToTopItems(let indexPaths):
//            var sectionsVar = self.sections
//            var origItems = sectionsVar[0].items
//            var movedItems: [TrafficSignItemViewModel] = []
//            for index in indexPaths { // get the moved items
//                movedItems.append(sectionsVar[0].items[index.row])
//            }
//            let indexs = getSortedPosition(indexs: indexPaths)
//            for index in indexs.reversed() { // remove the items
//                origItems.remove(at: index)
//            }
//            for item in movedItems.reversed() { // insert the items to the top
//                origItems.insert(item, at: 0)
//            }
//            sectionsVar[0] = TrafficSignSection(original: sectionsVar[0], items: origItems)
//            return SignTableViewState(sections: sectionsVar, isAdded: false)
//        case .ToButtomItems(let indexPaths):
//            var sectionsVar = self.sections
//            var origItems = sectionsVar[0].items
//            var movedItems: [TrafficSignItemViewModel] = []
//            for index in indexPaths {// get the moved items
//                movedItems.append(sectionsVar[0].items[index.row])
//            }
//            let indexs = getSortedPosition(indexs: indexPaths)
//            for index in indexs.reversed() { // remove the items
//                origItems.remove(at: index)
//            }
//            for item in movedItems {
//                origItems.append(item) // in sert the items to buttom
//            }
//            sectionsVar[0] = TrafficSignSection(original: sectionsVar[0], items: origItems)
//            return SignTableViewState(sections: sectionsVar, isAdded: false)
        }
    }
}

extension SignTableViewEditingCommand {
    static func initItem(signItem items: [TrafficSignItemViewModel]) -> SignTableViewEditingCommand {
        return SignTableViewEditingCommand.InitItems(items: items)
    }
//    static func addItem(signItem items: [TrafficSignItemViewModel]) -> SignTableViewEditingCommand {
//        return SignTableViewEditingCommand.AppendItems(items: items)
//    }
//    static func deleteItem(indexs: [IndexPath]) -> SignTableViewEditingCommand {
//        return SignTableViewEditingCommand.DeleteItems(indexs: indexs)
//    }
//    static func copyItem(indexs: [IndexPath]) -> SignTableViewEditingCommand {
//        return SignTableViewEditingCommand.CopyItems(indexs: indexs)
//    }
//    static func toTopItem(indexs: [IndexPath]) -> SignTableViewEditingCommand {
//        return SignTableViewEditingCommand.ToTopItems(indexs: indexs)
//    }
//    static func toBottonItem(indexs: [IndexPath]) -> SignTableViewEditingCommand {
//        return SignTableViewEditingCommand.ToButtomItems(indexs: indexs)
//    }
}

func + <T>(lhs: [T], rhs: T) -> [T] {
    var copy = lhs
    copy.append(rhs)
    return copy
}

func + <T>(lhs: [T], rhs: [T]) -> [T] {
    var copy = lhs
    for r in rhs {
        copy.append(r)
    }
    return copy
}

fileprivate func getSortedPosition(indexs: [IndexPath]) -> [Int] {
    var result: [Int] = []
    for index in indexs {
        result.append(index.row)
    }
    result = result.sorted()
    return result
}
