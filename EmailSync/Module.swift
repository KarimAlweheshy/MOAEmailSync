//
//  Module.swift
//  EmailSync
//
//  Created by Karim Alweheshy on 2/13/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import UIKit
import Networking

open class Module: ModuleType {
    public static var capabilities: [InternalRequest.Type] = [MailSyncFetchRequest.self,
                                                              MailSyncDeleteRequest.self,
                                                              MailSyncMarkAsReadRequest.self,
                                                              MailSyncUpdateByIDRequest.self]
    
    static fileprivate let dataProvider = DataProvider()
    
    fileprivate let presentationBlock: (UIViewController) -> Void
    fileprivate let dismissBlock: (UIViewController) -> Void
    
    public required init(presentationBlock: @escaping (UIViewController) -> Void,
                         dismissBlock: @escaping (UIViewController) -> Void) {
        self.presentationBlock = presentationBlock
        self.dismissBlock = dismissBlock
    }
    
    public func execute<T>(networking: NetworkingType, request: InternalRequest, completionHandler: @escaping (Result<T>) -> Void) {
        
        if request is MailSyncFetchRequest,
            let completionBlock = completionHandler as? ((Result<[EmailResponse]>) -> Void) {
            completionBlock(.success([EmailResponse()]))
        } else if request is MailSyncDeleteRequest,
            let completionBlock = completionHandler as? ((Result<EmailResponse>) -> Void) {
            completionBlock(.success(EmailResponse()))
        } else if request is MailSyncMarkAsReadRequest,
            let completionBlock = completionHandler as? ((Result<[EmailResponse]>) -> Void) {
            completionBlock(.success([EmailResponse()]))
        } else if request is MailSyncUpdateByIDRequest,
            let completionBlock = completionHandler as? ((Result<EmailResponse>) -> Void) {
            completionBlock(.success(EmailResponse()))
        } else if let completionBlock = completionHandler as? ((Result<Any>) -> Void) {
            completionBlock(.error(ResponseError.badRequest400(error: nil)))
        }
    }
}

