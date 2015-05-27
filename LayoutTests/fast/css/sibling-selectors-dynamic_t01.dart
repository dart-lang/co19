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
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      section {
          width: 20px;
          height: 20px;
          border: 2px solid;
      }
      .foo + section + section + section {
          background-color: red;
      }
      .bar + section + section + section {
          background-color: green;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <section class="foo"></section>
      <section></section>
      <section></section>
      <section id="last"></section>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.documentElement.offsetTop;
  document.querySelector('.foo').className = 'bar';
  document.documentElement.offsetTop;
  shouldBe(getComputedStyle(document.getElementById('last')).backgroundColor, 'rgb(0, 128, 0)');
}
