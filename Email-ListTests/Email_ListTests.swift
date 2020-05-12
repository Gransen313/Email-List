//
//  Email_ListTests.swift
//  Email-ListTests
//
//  Created by Sergey Borisov on 15.04.2020.
//  Copyright © 2020 Sergey Borisov. All rights reserved.
//

import XCTest
@testable import Email_List

class Email_ListTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    //MARK: Tests for method "isValidEmail"
    func testIsValidEmail1() throws {
        let eMail = "a@b.ru"
        XCTAssert(eMail.isValidEmail)
    }
    func testIsValidEmail2() throws {
        let eMail = "1.Z@2.A.qwerty"
        XCTAssert(eMail.isValidEmail)
    }
    func testIsValidEmail3() throws {
        let eMail = "111111111111111111111111111111@1.qw"
        XCTAssert(eMail.isValidEmail)
    }
    func testIsValidEmail4() throws {
        let eMail = "AAAAAAAAAAAAAAAAAAAAA@A.zzxcv"
        XCTAssert(eMail.isValidEmail)
    }
    func testIsValidEmail5() throws {
        let eMail = "A.A.A.1.2.3.4.5.6.7.8.9.00000000@0.com"
        XCTAssert(eMail.isValidEmail)
    }
    func testIsValidEmail6() throws {
        let eMail = "A@1.2.3.4.5.6.7.8.9.0.a.s.d.f.g.h.j.ru"
        XCTAssert(eMail.isValidEmail)
    }
    func testIsValidEmail7() throws {
        let eMail = "aa@AAWGFH213454556ffgbg.dfgdfg.co"
        XCTAssert(eMail.isValidEmail)
    }
    func testIsValidEmail8() throws {
        let eMail = "a.Z.0@a.Z.0.aaaaaa"
        XCTAssert(eMail.isValidEmail)
    }
    func testIsValidEmail9() throws {
        let eMail = "AlekseiSvistiplyasov@gmail.com"
        XCTAssert(eMail.isValidEmail)
    }
    func testIsValidEmail10() throws {
        let eMail = "elena1995@yandex.ru"
        XCTAssert(eMail.isValidEmail)
    }
    
    func testIsValidEmail11() throws {
        let eMail = "a@b.a"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail12() throws {
        let eMail = "anatoly1990@yahoo.yahoooo"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail13() throws {
        let eMail = "1@2.asdchbkbckjcnkclncljcnlwlcndcjncjl"
        XCTAssert(!eMail.isValidEmail)
    }
    
    func testIsValidEmail14() throws {
        let eMail = "АлешаSviridov@mail.ru"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail15() throws {
        let eMail = "123@мэйл.com"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail16() throws {
        let eMail = "lesha1209@gmail.сом"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail17() throws {
        let eMail = "!s@pop.co"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail18() throws {
        let eMail = "ibragimovich@gma!l.com"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail19() throws {
        let eMail = "1VOPER@ya.ru)"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail20() throws {
        let eMail = "andrey+lena@go.us"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail21() throws {
        let eMail = "ishak@loshadka-pony.by"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail22() throws {
        let eMail = "yaya31@roi.je_rry"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail23() throws {
        let eMail = "lesnikFS*@pot.reg"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail24() throws {
        let eMail = "bolek43@ANUBIS&.tr"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail25() throws {
        let eMail = "xollollex@SKIP.btc#"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail26() throws {
        let eMail = "sdsf@sdff.RU"
        XCTAssert(!eMail.isValidEmail)
    }
    
    func testIsValidEmail27() throws {
        let eMail = ".dumik@mail.mail"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail28() throws {
        let eMail = "ko..te@kopter.test"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail29() throws {
        let eMail = "Bond.@bullet.com"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail30() throws {
        let eMail = "POLK@.plov.co"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail31() throws {
        let eMail = "fds@GR..U.tt"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail32() throws {
        let eMail = "core@te..it"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail33() throws {
        let eMail = "gtr@gregr.grg."
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail34() throws {
        let eMail = "@egrege.com"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail35() throws {
        let eMail = "aeferf.ewdwe@com"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail36() throws {
        let eMail = "4r334.com@"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail37() throws {
        let eMail = "@cscsd.rfrfer@rfeer.fr"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail38() throws {
        let eMail = "sdad@sdfs@wer"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail39() throws {
        let eMail = "wewed.ssd@fref.com@"
        XCTAssert(!eMail.isValidEmail)
    }
    func testIsValidEmail40() throws {
        let eMail = "@dge@yum@"
        XCTAssert(!eMail.isValidEmail)
    }
    
    //MARK: Tests for method "isValidPassword"
    func testIsValidPassword1() throws {
        let password = "abcdef"
        XCTAssert(password.isValidPassword)
    }
    func testIsValidPassword2() throws {
        let password = "abcdefghijklmnopqrstuvwxyzabcd"
        XCTAssert(password.isValidPassword)
    }
    func testIsValidPassword3() throws {
        let password = "ABCDEF"
        XCTAssert(password.isValidPassword)
    }
    func testIsValidPassword4() throws {
        let password = "ABCDEFGHIJKLMNOPQRSTUVWXYZABCD"
        XCTAssert(password.isValidPassword)
    }
    func testIsValidPassword5() throws {
        let password = "123456"
        XCTAssert(password.isValidPassword)
    }
    func testIsValidPassword6() throws {
        let password = "123456789012345678901234567890"
        XCTAssert(password.isValidPassword)
    }
    func testIsValidPassword7() throws {
        let password = "-_?!=@123abcXYZ=@-_!?"
        XCTAssert(password.isValidPassword)
    }
    
    func testIsValidPassword8() throws {
        let password = "ka-Q3"
        XCTAssert(!password.isValidPassword)
    }
    func testIsValidPassword9() throws {
        let password = "akdjrnfi--__!!!!!!!!asmxWERTYUA"
        XCTAssert(!password.isValidPassword)
    }
    func testIsValidPassword10() throws {
        let password = ""
        XCTAssert(!password.isValidPassword)
    }
    
    func testIsValidPassword11() throws {
        let password = "aSdFgH12#"
        XCTAssert(!password.isValidPassword)
    }
    func testIsValidPassword12() throws {
        let password = "$wwf12333"
        XCTAssert(!password.isValidPassword)
    }
    func testIsValidPassword13() throws {
        let password = "kjf^98789"
        XCTAssert(!password.isValidPassword)
    }
    func testIsValidPassword14() throws {
        let password = "фывапр"
        XCTAssert(!password.isValidPassword)
    }
    func testIsValidPassword15() throws {
        let password = "НЕПАМСЛОЬ"
        XCTAssert(!password.isValidPassword)
    }
    func testIsValidPassword16() throws {
        let password = "фыв1234sdsds"
        XCTAssert(!password.isValidPassword)
    }
    func testIsValidPassword17() throws {
        let password = "kksdsl12ДВА"
        XCTAssert(!password.isValidPassword)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
//        self.measure {
            // Put the code you want to measure the time of here.
//        }
    }
}
