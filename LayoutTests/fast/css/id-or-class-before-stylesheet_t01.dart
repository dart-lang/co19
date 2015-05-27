/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that elements before inline stylesheets get their style
 * updated properly
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      #testid { background-color: red; }
      #testID2 { background-color: red; }
      .testclass { background-color: red; }
      .testClass2 { background-color: red; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id=testid>id test</div>
      <style>
      #testid { background-color: green }
      </style>
      <div class=testclass>class test</div>
      <style>
      .testclass { background-color: green; }
      </style>
      <div id=testID2>case insensitive id test</div>
      <style>
      #TESTid2 { background-color: green }
      </style>
      <div class=testClass2>case insensitive class test</div>
      <style>
      .TESTclass2 { background-color: green; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(getComputedStyle(document.getElementById("testid")).backgroundColor,"rgb(0, 128, 0)");
  shouldBe(getComputedStyle(document.getElementsByClassName("testclass")[0]).backgroundColor,"rgb(0, 128, 0)");
  shouldBe(getComputedStyle(document.getElementById("testID2")).backgroundColor,"rgb(0, 128, 0)");
  shouldBe(getComputedStyle(document.getElementsByClassName("testClass2")[0]).backgroundColor,"rgb(0, 128, 0)");
}
