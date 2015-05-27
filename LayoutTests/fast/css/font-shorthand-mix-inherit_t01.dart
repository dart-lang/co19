/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for WebKit bug 20181 : font shorthand with inherit keyword
 * incorrectly parsed and rendered
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <p id="description">Test for WebKit bug <a href="https://bugs.webkit.org/show_bug.cgi?id=20181">20181</a> : font shorthand with inherit keyword incorrectly parsed and rendered</p>
      <div id="console"></div>

      <div id="tests_container">

      <div id="test"></div>

      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var test = document.getElementById("test");

  // Sanity check.
  test.style.font = "12pt/14pt sans-serif";
  shouldBe(test.style.getPropertyValue('font'), '12pt/14pt sans-serif');
  test.style.font = "";
  test.style.font = "inherit";
  shouldBe(test.style.getPropertyValue('font'), 'inherit');
  test.style.font = "";
  shouldBe(test.style.getPropertyValue('font'), '');
  test.style.font = "12pt/14pt inherit";
  shouldBe(test.style.getPropertyValue('font'), '');
  test.style.font = "12pt/14pt bold inherit";
  shouldBe(test.style.getPropertyValue('font'), '');
  test.style.font = "italic 12pt/14pt bold inherit";
  shouldBe(test.style.getPropertyValue('font'), '');
  test.style.font = "italic 12pt/14pt bold arial inherit";
  shouldBe(test.style.getPropertyValue('font'), '');
  test.style.font = "x-large/110% 'new century schoolbook', serif, inherit";
  shouldBe(test.style.getPropertyValue('font'), '');
  test.style.font = " 'inherit'";
  shouldBe(test.style.getPropertyValue('font'), '');
  test.style.font = "italic inherit 12pt/14pt bold arial inherit";
  shouldBe(test.style.getPropertyValue('font'), '');
  test.style.font = "arial inherit";
  shouldBe(test.style.getPropertyValue('font'), '');
  test.style.font = "Arial, Helvetica, inherit, sans-serif;";
  shouldBe(test.style.getPropertyValue('font'), '');
  test.style.font = "inherit, sans-serif;";
  shouldBe(test.style.getPropertyValue('font'), '');
  test.style.font = "italic inherit 12pt/14pt bold arial initial";
  shouldBe(test.style.getPropertyValue('font'), '');
  // clean up after ourselves
  var tests_container = document.getElementById("tests_container");
  tests_container.remove();
}
