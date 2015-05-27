/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for Bug 31267 - :nth-child(-2n) should match no element
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      li {
          color:green;
      }
      li:nth-child(-1n) {
          color:red;
      }
      li:nth-child(-2n) {
          color:red;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <ol>
      <li>This must be green because li:nth-child(-an) must not match any elements.</li>
      <li>This must be green because li:nth-child(-an) must not match any elements.</li>
      <li>This must be green because li:nth-child(-an) must not match any elements.</li>
      <li>This must be green because li:nth-child(-an) must not match any elements.</li>
      </ol>
      <div id="result">
      Test didn't run
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  test()
  {
    var success = true;
    for (var a_param = -1; a_param >= -2; a_param--) {
      var nth_child = "li:nth-child(${a_param}n)";
      var elements = document.querySelectorAll(nth_child);
      if (elements.length != 0) {
        success = false;
        for (var i = 0; i < elements.length; i++)
          elements[i].innerHtml = "FAIL: " + nth_child + " must not match any elements.";
      }
    }

    var message = "FAIL";
    var color = "red";
    if (success) {
      message = "PASS";
      color = "green";
    }
    var result = document.getElementById("result");
    result.innerHtml = message;
    result.style.color = color;
  }

  test();
}
