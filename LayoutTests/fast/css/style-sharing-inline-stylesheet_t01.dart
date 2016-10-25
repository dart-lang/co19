/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that inline stylesheet does not confuse style sharing.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      .testclass { background-color: red; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div class=testclass>first div</div>
      <style>
      .testclass { background-color: green; }
      </style>
      <div class=testclass>second div</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(getComputedStyle(document.getElementsByClassName("testclass")[1]).backgroundColor,"rgb(0, 128, 0)");
}
