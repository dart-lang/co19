/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Select element scrolling when in transformed container
 */
import "dart:html";
import "../../testcommon.dart" as tc;
import "../../testharness.dart";
import "../../../Utils/expect.dart";

const String htmlEL1 = r'''
<style type="text/css" media="screen">
  body {
     margin: 0;
   }

   .container {
     display: inline-block;
     position: relative;
     left: 0;
     top: 0;
     width: 200px;
     height: 350px;
     overflow: hidden;
     background-color: blue;
   }
   
   .scrolled {
     position: relative;
     left: 0;
     top: 0;
     font-size: 14px;
     background-color: red;
     color: white;
   }

   .padding {
     height: 500px;
   }

   .offset {
     -webkit-transform: translateY(-300px);
   }

   .scaled {
     color: white;
     background-color: red;
     height: 20px;
     -webkit-transform: scaleY(2.0);
   }
</style>
''';

const String htmlEL2 = r'''
<p id="message">
  Testing the scrolling behaviour of elements when in a normal and transformed container.
  On the left is the normal container. On the right are containers containing transformed elements.
  To test this manually, click on the two select elements. The menu popup should
  appear directly over the element - the content should not move.<br>
  The third and fourth containers tests that scrollIntoView(false) works properly in the presence of a scaled element.  Because the element is at the bottom of the container, scrollIntoView should give the same result regardless of flag.
</p>

<div class="container" id="a">
  <div class="scrolled">
    <p>
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    </p>
    <p>
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    </p>
    <select>
      <option>one</option>
      <option>two</option>
      <option>three</option>
      <option>four</option>
    </select>
  </div>
</div>

<div class="container" id="b">
  <div class="scrolled offset">
    <p>
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    </p>
    <p>
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    </p>
    <select>
      <option>one</option>
      <option>two</option>
      <option>three</option>
      <option>four</option>
    </select>
  </div>
</div>

<div class="container" id="c">
  <div class="padding"></div>
  <div class="scaled" id="c-inner">
    <p>This text should not be cut off</p>
  </div>
</div>

<div class="container" id="d">
  <div class="padding"></div>
  <div class="scaled" id="d-inner">
    <p>This text should not be cut off</p>
  </div>
</div>
''';

void runTest(e) {
    var triggers = document.querySelectorAll(".scrollTrigger");
    for (var i=0; i < triggers.length; i++) {
      triggers[i].scrollIntoView(ScrollAlignment.BOTTOM);
    }
    document.getElementById("c-inner").scrollIntoView(ScrollAlignment.TOP);
    document.getElementById("d-inner").scrollIntoView(ScrollAlignment.BOTTOM);

    var selectElements = document.querySelectorAll("select");
    for (var i=0; i < selectElements.length; i++) {
      selectElements[i].focus();
    }

    var id1, id2, element1, element2, scrollTop1, scrollTop2;

    // The test results should be (for scrollTop)
    // a != b
    // b == 0
    // c == d

    id1 = "a";
    id2 = "b";
    var id3 = "c";
    var id4 = "d";
    element1 = document.getElementById(id1);
    element2 = document.getElementById(id2);
    var element3 = document.getElementById(id3);
    var element4 = document.getElementById(id4);
    scrollTop1 = element1.scrollTop;
    scrollTop2 = element2.scrollTop;
    var scrollTop3 = element3.scrollTop;
    var scrollTop4 = element4.scrollTop;
    Expect.notEquals(element1.scrollTop, element2.scrollTop);
    Expect.equals(0, scrollTop2);
    Expect.equals(scrollTop3, scrollTop4);
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    tc.addOnLoadListener((_) {
      runTest(_);
    });
}
