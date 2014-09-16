/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 * @static-warning
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <pre id="error-log"></pre>
      <span id="container" style="color: green">
      </span>
      <span id="status" style="color: red">
         FAIL
      </span>
      ''', treeSanitizer: new NullTreeSanitizer());

  // verify all standard cases
  document.getElementById("container").insertAdjacentHtml("beforeBegin", "<span id='1''> 1 (black)</span>");
  document.getElementById("container").insertAdjacentHtml("afterBegin", "<span id='2''> 2 (green)</span>");
  document.getElementById("container").insertAdjacentHtml("beforeEnd", "<span id='3''> 3 (green)</span>");
  document.getElementById("container").insertAdjacentHtml("afterEnd", "<span id='4''> 4 (black)</span>");

  assertThrows(func) {
    var testPassed = false;
    try {
      func();
      document.getElementById("error-log").text += "Expected exception missing.\n";
    } catch (e) {
      document.getElementById("error-log").text += "Caught expected exception: " + e.toString() + "\n";
      testPassed = true;
    }
    return testPassed;
  }

  // check that exceptions are thrown as required
  var passes = true;
  passes = assertThrows(() {
    // should throw SyntaxError
    document.getElementById("container").insertAdjacentHtml("blah", "<span>html</span>");
  }) && passes;
  passes = assertThrows(() {
    // Should throw NoModificationAllowedError
    document.createElement('div').insertAdjacentHtml("afterEnd", "<span>html</span>");
  }) && passes;
  passes = assertThrows(() {
    // Should throw TypeError
    document.getElementById("container").insertAdjacentHtml();
  }) && passes;
  passes = assertThrows(() {
    // Should throw TypeError
    document.getElementById("container").insertAdjacentHtml("beforeBegin");
  }) && passes;

  if (passes) {
    document.getElementById("status").style.color = "green";
    document.getElementById("status").innerHtml = "<br><br>PASS";
  }
}
