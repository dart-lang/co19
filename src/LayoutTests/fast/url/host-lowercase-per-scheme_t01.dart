/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Canonical URL should have a lowercase hostname for server based protocols.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testharness.dart";
import "resources/utilities.dart";

var protocolTestSet = [
    ['ws', true],
    ['wss', true],
    ['ftp', true],
    ['wss', true],
    ['http', true],
    ['file', true],
    ['https', true],
    ['ghost', false]];

var urls = ['lowercase', 'CamelCase', 'UnicodeFête'];
var urlExpectationsLowercase = ['lowercase', 'camelcase', 'xn--unicodefte-t7a'];
var urlExpectationsUppercase = ['lowercase', 'CamelCase', 'UnicodeF%C3%AAte'];

void main() {
    
    for (var protocolIndex = 0; protocolIndex < protocolTestSet.length; ++protocolIndex) {
        String protocol = protocolTestSet[protocolIndex][0];
        String hostnameShouldBeLowercase = protocolTestSet[protocolIndex][1];
    
        for (int urlIndex = 0; urlIndex < urls.length; ++urlIndex) {
            String url = '$protocol://${urls[urlIndex]}/';
            String src = canonicalize(url);
            String expected;
            if (hostnameShouldBeLowercase)
                expected = '$protocol://${urlExpectationsLowercase[urlIndex]}/';
            else
                expected = '$protocol://${urlExpectationsUppercase[urlIndex]}/';
    
            shouldBe(src, expected, "protocolIndex=$protocolIndex, urlIndex=$urlIndex");
        }
    }    
    checkTestFailures();
}
