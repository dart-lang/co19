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
      <div style="display: none">
         <span id="1">
            1 (black)
         </span>
         <span id="2">
            2 (green)
         </span>
         <span id="3">
            3 (green)
         </span>
         <span id="4">
            4 (black)
         </span>
      </div>
      <span id="status" style="color: red">
         FAIL
      </span>
      ''', treeSanitizer: new NullTreeSanitizer());

   // verify all standard cases
   document.getElementById("container").insertAdjacentElement("beforeBegin", document.getElementById("1"));
   document.getElementById("container").insertAdjacentElement("afterBegin", document.getElementById("2"));
   document.getElementById("container").insertAdjacentElement("beforeEnd", document.getElementById("3"));
   document.getElementById("container").insertAdjacentElement("afterEnd", document.getElementById("4"));

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
     document.getElementById("container").insertAdjacentElement("blah", document.getElementById("1"));
   }) && passes;
   passes = assertThrows(() {
     // should throw TypeError
     document.getElementById("container").insertAdjacentElement("beforeEnd", null);
   }) && passes;
   passes = assertThrows(() {
     // should throw TypeError
     document.getElementById("container").insertAdjacentElement("beforeEnd");
   }) && passes;
   passes = assertThrows(() {
     // should throw TypeError
     document.getElementById("container").insertAdjacentElement();
   }) && passes;

   var elt = document.createElement("div");
   passes = passes && (elt.insertAdjacentElement("beforeBegin", document.createElement("p")) == null);
   if (passes) {
     document.getElementById("status").style.color = "green";
     document.getElementById("status").innerHtml = "<br><br>PASS";
   }
}
