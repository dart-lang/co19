/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description CSS Test: :not selector with :first-letter selector
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style type="text/css">
          div
          {
              color: green;
          }
          div, *:not(:first-letter)
          {
              color: red;
          }
          div, *:not(::first-letter)
          {
              color: red;
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>The test passes if there is no red on the page.</p>
      <div>
          <div id="test">Filler Text</div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var target = document.getElementById("test");
  var val = getComputedStyle(target, null).getPropertyValue("color");
  var aExpectedValues = ["green", "#008000", "rgb(0, 128, 0)"];
  shouldBeTrue(aExpectedValues.contains(val));
}
