/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for bug 7296.
 * This test checks to see whether you get exceptions when setting a property
 * with a "bad value". Setting using JavaScript property syntax and with
 * setProperty() should behave the same.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p id="e">This is the test element.</p>
    ''', treeSanitizer: new NullTreeSanitizer());

  setInitialStyleForE()
  {
    var e = document.getElementById('e');

    e.style.top = "0px";
    e.style.bottom = "";
    e.style.display = "none";
    e.style.bottom = "1px";
  }

  var e = document.getElementById('e');
 
  debug('test1');
  setInitialStyleForE();
  e.style.display = "block";
  shouldBe(e.style.cssText, "top: 0px; display: block; bottom: 1px;");

  debug('test2');
  setInitialStyleForE();
  e.style.display = "foobar";
  shouldBe(e.style.cssText, "top: 0px; display: none; bottom: 1px;");

  debug('test3');
  setInitialStyleForE();
  e.style.display = "";
  shouldBe(e.style.cssText, "top: 0px; bottom: 1px;");

  debug('test4');
  setInitialStyleForE();
  e.style.display = null;
  shouldBe(e.style.cssText, "top: 0px; bottom: 1px;");

  debug('test5');
  setInitialStyleForE();
  e.style.setProperty("display", "block", "");
  shouldBe(e.style.cssText, "top: 0px; display: block; bottom: 1px;");

  debug('test6');
  setInitialStyleForE();
  e.style.setProperty("display", "foobar", "");
  shouldBe(e.style.cssText, "top: 0px; display: none; bottom: 1px;");

  debug('test7');
  setInitialStyleForE();
  e.style.setProperty("display", "", "");
  shouldBe(e.style.cssText, "top: 0px; bottom: 1px;");

  debug('test8');
  setInitialStyleForE();
  e.style.setProperty("display", null, "");
  shouldBe(e.style.cssText, "top: 0px; bottom: 1px;");
}
