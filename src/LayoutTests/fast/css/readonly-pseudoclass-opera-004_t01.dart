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
       textarea:read-only { background:lime }
       textarea { background:red }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>This test checks for :read-only right behavior. Fails if FAILURE is shown below.</p>
      <p><textarea id="victim" readonly></textarea></p>
      <hr>
      <ol id="console"></ol>
      ''', treeSanitizer: new NullTreeSanitizer());

  var t = document.getElementById("victim");
  shouldBe(getComputedStyle(t, null).getPropertyValue('background-color'), "rgb(0, 255, 0)");
}
