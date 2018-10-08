/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
These tests check if leading line feeds characters in textarea as default values are parsed correctly.

<br>
<textarea id="no-line-feed">Madoka</textarea>

<textarea id="one-line-feed">
Sayaka</textarea>

<textarea id="two-line-feeds">

Mami</textarea>

<textarea id="one-line-feed-escaped-char-and-one-line-feed">&#x0a;
Kyoko</textarea>

<textarea id="two-line-feed-escaped-chars">&#x0a;&#x0a;Homura</textarea>
      ''', treeSanitizer: new NullTreeSanitizer());

  test(id, expected) {
    debug(id);
    TextAreaElement ta = document.getElementById(id);
    shouldBe(ta.value, expected);
  }

  test("no-line-feed", "Madoka");
  test("one-line-feed", "Sayaka");
  test("two-line-feeds", "\nMami");
  test("one-line-feed-escaped-char-and-one-line-feed", "\nKyoko");
  test("two-line-feed-escaped-chars", "\nHomura");
}
