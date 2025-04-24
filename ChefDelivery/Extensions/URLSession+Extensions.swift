//
//  URLSession+Extensions.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo Beltramin de Sant Ana on 12/04/25.
//

import Foundation

extension URLSession {
    static let custom: URLSession = {
        let configuration: URLSessionConfiguration = .default
        configuration.urlCache = nil
        let delegate = CustomSessionDelegate()
        return URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
    }()
}

final class CustomSessionDelegate: NSObject, URLSessionDelegate {
    
    let certificates = ["netskope"]
    
    func urlSession(_ session: URLSession,
                    didReceive challenge: URLAuthenticationChallenge,
                    completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        guard let serverTrust = challenge.protectionSpace.serverTrust else {
            return completionHandler(.performDefaultHandling, nil)
        }
        
        guard challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust else {
            return completionHandler(.performDefaultHandling, nil)
        }
        
        pinCertificates(serverTrust)
        
        let serverTrustIsValid = trustIsValid(serverTrust)
        if serverTrustIsValid {
            completionHandler(.useCredential, URLCredential(trust: serverTrust))
        } else {
            completionHandler(.cancelAuthenticationChallenge, nil)
        }
    }
    
    fileprivate func pinCertificates(_ serverTrust: SecTrust) {
        var pinnedCertificates: [SecCertificate] = []
        for certificate in certificates {
            if let certPath = Bundle.main.path(forResource: certificate, ofType: "cer") {
                if let certData = NSData(contentsOfFile: certPath) {
                    if let cert = SecCertificateCreateWithData(nil, certData) {
                        pinnedCertificates.append(cert)
                    }
                }
            }
        }
        guard pinnedCertificates.isEmpty == false else { return }
            
        SecTrustSetAnchorCertificates(serverTrust, pinnedCertificates as CFArray)
        SecTrustSetAnchorCertificatesOnly(serverTrust, false)
    }
    
    private func trustIsValid(_ trust: SecTrust) -> Bool {
        
        var error: CFError?
        let isValid = SecTrustEvaluateWithError(trust, &error)
#if DEBUG
        if let error = error {
            print("Trust evaluation error: \(error)")
        }
#endif
        
        return isValid
    }
}
