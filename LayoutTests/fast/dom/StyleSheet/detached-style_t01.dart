/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Bug 45205: Test that <link> elements only have stylesheets
 * when in document.
 */
import "dart:html";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  // test framework defines its own style sheets, save the count
  var index = document.styleSheets.length;

  LinkElement link = new Element.html('''
<link rel="stylesheet" href="$root/resources/detached-style.css" type="text/css" media="screen">
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(link);

  StyleElement style = new Element.html('''
    <style>* { }</style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <p><a href="https://bugs.webkit.org/show_bug.cgi?id=45205">Bug 45205</a>:
    Test that &lt;link> elements only have stylesheets when in document.</p>
    <div id="console"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    debug("Testing &lt;link>...");
    CssStyleSheet sheet = document.styleSheets[index];
    var head = document.getElementsByTagName("head")[0];

    shouldBe(sheet.ownerNode, link);
    shouldBe(link.sheet == sheet, true);

    debug("Removing &lt;link>...");
    link.remove();

    shouldBe(link.sheet, null);
    shouldBe(sheet.ownerNode, null);
    shouldBe(sheet.cssRules[0].cssText[0], "*");

    debug("Re-adding &lt;link>...");
    head.append(link);
    shouldBe(sheet.ownerNode, null);
    shouldBe(link.sheet == sheet, false);
    shouldBe(link.sheet.ownerNode, link);

    debug("Testing &lt;style>...");
    sheet = document.styleSheets[index];

    shouldBe(sheet.ownerNode, style);
    shouldBe(style.sheet, sheet);

    debug("Removing &lt;style>...");
    style.remove();

    shouldBe(style.sheet, null);
    shouldBe(sheet.ownerNode, null);
    shouldBe(sheet.cssRules[0].cssText[0], "*");

    debug("Re-adding &lt;style>...");
    head.append(style);
    shouldBe(sheet.ownerNode, null);
    shouldBe(style.sheet == sheet, false);
    shouldBe(style.sheet.ownerNode, style);

    asyncEnd();
  });
}
