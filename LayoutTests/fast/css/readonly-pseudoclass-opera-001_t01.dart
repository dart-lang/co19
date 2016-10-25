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
  var style = new Element.html('''
      <style>
       input:read-only { background:red }
       input { display:none }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>This test checks for :read-only right behavior on checkboxes. Fails if FAILURE is shown below.</p>
      <p><input type="checkbox" id="victim" readonly/></p>
      <hr>
      <ol id="console"></ol>
      ''', treeSanitizer: new NullTreeSanitizer());

  var i = document.getElementById("victim");
  shouldBe(getComputedStyle(i, null).getPropertyValue('display'), "none");
}
