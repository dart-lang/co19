/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description :not selector with simple selector sequence
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style type="text/css">
          div {
              color: green;
          }

          /* div#foo is not a simple selector, but a simple selector sequence.
             Hence :not(div#foo) is invalid and the entire rule must be dropped.
             The same applies for others below. */
          div, div:not(div#foo) {
              color: red;
          }
          div, div:not(div.bar) {
              color: red;
          }
          div, div:not(#foo.bar) {
              color: red;
          }
          div, div:not([name="x"]#foo) {
              color: red;
          }
          div, div:not(:nth-child(odd).bar) {
              color: red;
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <!-- Adapted from http://samples.msdn.microsoft.com/ietestcenter/css3/selectors/notSelectorSequence.htm -->
      <p>The test passes if the Filler Text below is green.</p>
      <div id="test">Filler Text</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var target = document.getElementById("test");
  var val = getComputedStyle(target, null).getPropertyValue("color");
  var aExpectedValues = ["green", "#008000", "rgb(0, 128, 0)"];
  shouldBeTrue(aExpectedValues.contains(val));
}

