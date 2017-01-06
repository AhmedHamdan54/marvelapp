//
//  CharacterViewControllerSpec.swift
//  Marvel
//
//  Created by Thiago Lioy on 05/01/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

import Quick
import Nimble
@testable import Marvel

class CharacterViewControllerSpec: QuickSpec {
    override func spec() {
        describe("a character view controller") {
            
            var controller: CharacterViewController!
            var character: Marvel.Character!
            beforeEach {
                let testBundle = Bundle(for: type(of: self))
                let mockLoader = MockLoader(file: "character", in: testBundle)
                character = mockLoader?.map(to: Character.self)
                
                controller = CharacterViewController(character: character!)
            }
            
            it("should be able to create a controller") {
                expect(controller).toNot(beNil())
            }
            
            it("should have a view of type") {
                expect(controller.view).to(beAKindOf(CharacterView.self))
            }
            
            it("should have the expected navigation title") {
                let _ = UINavigationController(rootViewController: controller)
                controller.viewWillAppear(true)
                expect(controller.navigationItem.title).to(equal(character!.name))
            }
            
            it("should trigger fatal error if init with coder") {
                expect { () -> Void in
                    let _ = CharacterViewController(coder: NSCoder())
                }.to(throwAssertion())
            }
            
        }
    }
}

