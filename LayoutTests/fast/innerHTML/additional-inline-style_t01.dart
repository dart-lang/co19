/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description
 * Test for http://bugs.webkit.org/show_bug.cgi?id=13091
 * REGRESSION (r20075): Wrong text style and pixel break in Apple Store Locator HUD
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var body = document.body;

  body.setInnerHtml('''
      <style>
      span { color: blue; }
      </style>
      <div id="target"><span></span></div>
      <pre id="result"></pre>
      ''', treeSanitizer: new NullTreeSanitizer());

  var result = document.getElementById("result");
  var target = document.getElementById("target");

  document.body.offsetTop;
  result.append(new Text(target.innerHtml));
  Expect.equals('<span></span>', result.text);
}

