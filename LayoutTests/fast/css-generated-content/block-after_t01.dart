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

main() {
  var style = new Element.html('''
      <style>
      div {
          margin: 0px;
          padding: 0px;
          border: none;
      }
      div.a:after { 
          content: 'This sentence should be after "First." and "Second."'; 
          color: red; 
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>Bug <a href="https://bugs.webkit.org/show_bug.cgi?id=32288">32288</a> - :after selector displays in wrong place with nested div</p>
      <div class="a" id="container">
          <div id="first">First.</div>
          <div id="second">Second.</div>  
      </div>
      <p id="result"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var first = document.getElementById("first");
  var second = document.getElementById("second");

  //Test whether the first and second lines are laid out sequentially.
  //If there is something between them then it must be the css generated
  //content which means this bug is not fixed.

  shouldBe(second.offsetTop, first.offsetTop + first.offsetHeight);
}
