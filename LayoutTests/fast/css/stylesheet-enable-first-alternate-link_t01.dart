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
import "pwd.dart";

main() {
  var index = document.getElementsByTagName("link").length; // skip test framework's ones

  var f = new DocumentFragment.html('''
      <link rel="stylesheet" href="$root/resources/red.css" media="all" title="Default Style Sheet" type="text/css" />
      <link rel="alternate stylesheet" href="$root/resources/green.css" media="all" title="green" type="text/css" />
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=65140">65140</a>: REGRESSION (r84327-r84329): CSS stylesheets fail to load on www.flagstar.com login page</p>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());
  
  dynamic red = document.getElementsByTagName("link")[index];
  red.disabled = true;
  dynamic green = document.getElementsByTagName("link")[index+1];
  green.disabled = true;
  green.disabled = false;

  test(_) {
    var console = document.getElementById("console");
    shouldBe(getComputedStyle(console, null).backgroundColor, "rgb(0, 128, 0)");
    asyncEnd();
  }

  asyncStart();
  window.addEventListener("load", test, false);
}
