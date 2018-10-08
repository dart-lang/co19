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
  document.body.setInnerHtml('''
      <pre id="error-log"></pre>
      <span id="container" style="color: green">
      </span>
      <span id="status" style="color: red">
         FAIL
      </span>
      ''', treeSanitizer: new NullTreeSanitizer());

  // verify all standard cases
  document.getElementById("container").insertAdjacentText("beforeBegin", " 1 (black)");
  document.getElementById("container").insertAdjacentText("afterBegin", " 2 (green)");
  document.getElementById("container").insertAdjacentText("beforeEnd", " 3 (green)");
  document.getElementById("container").insertAdjacentText("afterEnd", " 4 (black)");

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
    document.getElementById("container").insertAdjacentText("blah", "text");
  }) && passes;

  passes = assertThrows(() {
    // should throw TypeError
    (document.getElementById("container") as dynamic).insertAdjacentText();
  }) && passes;

  passes = assertThrows(() {
    // should throw TypeError
    (document.getElementById("container") as dynamic).insertAdjacentText("afterBegin");
  }) && passes;

  if (passes) {
    document.getElementById("status").style.color = "green";
    document.getElementById("status").innerHtml = "<br><br>PASS";
  }
}
