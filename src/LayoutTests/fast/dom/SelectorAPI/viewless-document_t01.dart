/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that querySelector, querySelectorAll and 
 * matchesSelector (matches) don't crash when used in a viewless 
 * document.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  //var testDoc = document.implementation.createDocument("http://www.w3.org/1999/xhtml", "html");
  var testDoc = document.implementation.createHtmlDocument('');
  testDoc.documentElement.append(testDoc.createElement("body"));
  testDoc.body.append(testDoc.createElement("p")).id = "p1";
  testDoc.getElementById("p1").append(testDoc.createElement("span")).id = "s1";
  testDoc.body.append(testDoc.createElement("span")).id = "s2";
  testDoc.body.append(testDoc.createElement("div")).className = "d1";

  var p1 = testDoc.getElementById("p1");
  var s1 = testDoc.getElementById("s1");
  var s2 = testDoc.getElementById("s2");
  var d1 = testDoc.body.lastChild;

  shouldBe(testDoc.querySelector('p'), p1);
  shouldBe(testDoc.querySelectorAll('span').length, 2);
  shouldBe(testDoc.querySelectorAll('span')[1], s2);
  shouldBe(testDoc.querySelector('.d1'), d1);
  shouldBe(testDoc.querySelectorAll('p span').length, 1);

  shouldBeTrue(p1.matches('p'));
  shouldBeTrue(s1.matches('p span'));
  shouldBeTrue(s2.matches('#s2'));
  shouldBeTrue(d1.matches('.d1'));
}
