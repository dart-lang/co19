/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Test URLs that have an anchor.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testharness.dart";
import "resources/utilities.dart";

List cases = [ 
  ["hello, world", "hello, world"],
  ["\xc2\xa9", "\xc2\xa9"],
//  ["\ud800\udf00ss", "\ud800\udf00ss"],
  ["%41%a", "%41%a"],
//  ["\\ud800\\u597d", "\\uFFFD\\u597D"],
  ["a\\uFDD0", "a\\uFDD0"],
  ["asdf#qwer", "asdf#qwer"],
  ["#asdf", "#asdf"],
  ["a\nb\rc\td", "abcd"],
];

void main() {
    
    for (var i = 0; i < cases.length; ++i) {
      String actual=canonicalize('http://www.example.com/#${cases[i][0]}');
      String expected='http://www.example.com/#${cases[i][1]}';
      test((){
          Expect.equals(expected, actual);
      }, "$i");
    }
    checkTestFailures();
}
