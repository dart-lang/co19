/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This tests that setting invalid header names, values and using
 * an invalid method causes HttpRequest to throw the appropriate exceptions.
 */
import "dart:html";
import "../../../Utils/expect.dart";

bool checkExc(e) {
//   print("checkExc:");
//   print("  e=${e.toString()}; type=${e.runtimeType}");
   return (e is DomException) 
      && (e.toString().contains("SyntaxError"));
}

void testInvalidMethod() {
    var req = new HttpRequest();

    Expect.throws(() {
        req.open('test\r\nfoobar', window.location.href, async:true);
    },
    checkExc,
    "testInvalidMethod");
}

void testInvalidHeaderName() {
    var req = new HttpRequest();
    req.open('GET', window.location.href, async:true);
    
    Expect.throws(() {
        req.setRequestHeader("host:", "example.com");
    },
    checkExc,
    "testInvalidHeaderName");
}

void testInvalidHeaderValues() {
    var req = new HttpRequest();
    req.open('GET', window.location.href, async:true);
    
    Expect.throws(() {
        req.setRequestHeader("X-Hack", "Test\r\nHost: www.example.com\r\n\r\nGET / HTTP/1.1");
    },
    checkExc,
    "testInvalidHeaderValues 1");

    Expect.throws(() {
        req.setRequestHeader("X-Hack", "Test\nHost: www.example.com\n\nGET / HTTP/1.1");
    },
    checkExc,
    "testInvalidHeaderValues 2");

    Expect.throws(() {
        req.setRequestHeader("X-Hack", "Test\rHost: www.example.com\r\rGET / HTTP/1.1");
    },
    checkExc,
    "testInvalidHeaderValues 3");
}

void main() {
    testInvalidMethod();
    testInvalidHeaderName();
    testInvalidHeaderValues();
}
