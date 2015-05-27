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
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
       input:read-only { background:lime }
       input { background:red }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>This test checks for :read-only right behavior. Fails if FAILURE is shown below.</p>
      <p><input id="victim" readonly/></p>
      <hr>
      <ol id="console"></ol>
      ''', treeSanitizer: new NullTreeSanitizer());

  var i = document.getElementById("victim");
  shouldBe(getComputedStyle(i, null).getPropertyValue('background-color'), "rgb(0, 255, 0)");
}
