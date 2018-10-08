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

  dynamic f = new DocumentFragment.html('''
      <link rel="stylesheet" href="$root/resources/red.css" media="all" title="Default Style Sheet" type="text/css" />
      <link rel="alternate stylesheet" href="$root/resources/green.css" media="all" title="green" type="text/css" />
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  test(_) {
    dynamic red = document.getElementsByTagName("link")[index];
    red.disabled = true;
    dynamic  green = document.getElementsByTagName("link")[index+1];
    green.disabled = true;
    green.disabled = false;

    var console = document.getElementById("console");
    shouldBe(getComputedStyle(console, null).backgroundColor, "rgb(0, 128, 0)");
    asyncEnd();
  }

  asyncStart();
  window.addEventListener("load", test, false);
}
