/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks to see if changing the font of a select
 * element causes it to resize to accomodate the larger text.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p><select id="select" style="font-size: 9px">
      <option>This is an option with some text in it.</option>
      </select></p>
      ''', treeSanitizer: new NullTreeSanitizer());

  var widthBefore = document.getElementById("select").offsetWidth;
  document.getElementById("select").setAttribute("style", "font-size: 32px");
  var widthAfter = document.getElementById("select").offsetWidth;

  shouldBeTrue(widthAfter - widthBefore > 20);
}
