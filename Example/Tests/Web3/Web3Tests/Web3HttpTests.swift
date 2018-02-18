//
//  Web3HttpTests.swift
//  Web3_Tests
//
//  Created by Koray Koska on 14.01.18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import Web3

class Web3HttpTests: QuickSpec {

    let infuraUrl = "https://mainnet.infura.io/rFWTF4C1mwjexZVw0LoU"

    override func spec() {
        describe("http rpc requests") {

            let web3 = Web3(rpcURL: infuraUrl)

            context("web3 client version") {

                waitUntil { done in
                    web3.clientVersion { response in
                        it("should be status ok") {
                            expect(response.status.rawValue) == Web3Response<EthereumValue>.Status.ok.rawValue
                        }
                        it("should not be nil") {
                            expect(response.rpcResponse).toNot(beNil())
                        }
                        it("should be a string response") {
                            expect(response.rpcResponse?.result).toNot(beNil())
                        }

                        // Tests done
                        done()
                    }
                }
            }

            context("net version") {

                waitUntil { done in
                    web3.net.version { response in
                        it("should be status ok") {
                            expect(response.status.rawValue) == Web3Response<EthereumValue>.Status.ok.rawValue
                        }
                        it("should not be nil") {
                            expect(response.rpcResponse).toNot(beNil())
                        }
                        it("should be mainnet chain id") {
                            expect(response.rpcResponse?.result) == "1"
                        }

                        // Tests done
                        done()
                    }
                }
            }

            context("net peer count") {

                waitUntil { done in
                    web3.net.peerCount { response in
                        it("should be status ok") {
                            expect(response.status.rawValue) == Web3Response<EthereumValue>.Status.ok.rawValue
                        }
                        it("should not be nil") {
                            expect(response.rpcResponse).toNot(beNil())
                        }
                        it("should be a quantity response") {
                            expect(response.rpcResponse?.result?.quantity).toNot(beNil())
                        }

                        // Tests done
                        done()
                    }
                }
            }
        }
    }
}