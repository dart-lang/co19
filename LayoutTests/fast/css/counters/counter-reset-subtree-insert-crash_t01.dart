/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  dynamic style = new Element.html('''
      <style>
      #el0::after {
        content: counter(c);
        counter-increment: c;
      }

      #el1 {
        content: counter(c);
        counter-increment: c;
      }

      #el2 {
        content: counter(c);
        counter-increment: c;
      }

      #el2::after {
        content: counter(c);
      }

      #el3 {
        position: absolute;
      }

      #el3::before {
        content: counter(c);
        counter-reset: c;
      }

      #el3:after {
        content: counter(c);
        counter-reset: c;
      }

      #el4 {
        counter-increment: c;
      }

      #el5 {
        content: counter(c);
        counter-increment: c;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <span id="el0">
        <div id="el1"></div>
        <div id="el2">
          <div id="el3"></div>
          <span id="el4"></span>
        </div>
        <div id="el5"></div>
      </span>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    var rules = [
      "#el2::after { counter-increment: c; } ",
      "xyz { } "
    ];
    var stylesheet = style.sheet;
    document.body.offsetTop;
    stylesheet.insertRule(rules[0], stylesheet.rules.length);
    document.body.offsetTop;
    stylesheet.insertRule(rules[1], stylesheet.rules.length);
    document.body.innerHtml = "PASS: reparenting a counter node subtree that contains resets does not cause a crash.";
    asyncEnd();
  });
}
