/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks if offsetParent is always null when accessed
 * from the HTML <body> and from elements with CSS property position:fixed. 
 * To ensure values match layout, this test also checks offsetTop and
 * offsetLeft.
 * In addition to the HTML <body>, two elements with CSS property
 * position:fixed are tested: One within the body, and one within an element 
 * with CSS property position:absolute.
 * Finally, a static- and relative-positioned element are tested for sanity 
 * and spec adherence.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var body = document.body;
  body.setInnerHtml('''
    <div id="static" style="border:1px solid green"></div>
    <div id="relative" style="position:relative;top:-4px;left:4px;border:1px solid blue"></div>
    <div id="fixed1" style="position:fixed;top:10px;left:20px;border:1px solid red"></div>
    <div id="absolute" style="position:absolute"><div id="fixed2" style="position:fixed;top:15px;left:30px"></div></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  body.style.margin = '10px';
  body.style.border = '5px solid white';

  var statik = document.getElementById('static');
  var relative = document.getElementById('relative');
  var firstFixed = document.getElementById('fixed1');
  var secondFixed = document.getElementById('fixed2');

  Expect.equals(null, firstFixed.offsetParent, "First Fixed offsetParent");
  Expect.equals(10, firstFixed.offsetTop, "First Fixed offsetTop");
  Expect.equals(20, firstFixed.offsetLeft, "First Fixed offsetLeft");
  Expect.equals(null, secondFixed.offsetParent, "Second Fixed offsetParent");
  Expect.equals(15, secondFixed.offsetTop, "Second Fixed offsetTop");
  Expect.equals(30, secondFixed.offsetLeft, "Second Fixed offsetLeft");
  Expect.equals(null, body.offsetParent, "Body offsetParent");
  Expect.equals(0, body.offsetTop, "Body offsetTop");
  Expect.equals(0, body.offsetLeft, "Body offsetLeft");
  Expect.equals(body, statik.offsetParent, "Static offsetParent");
  Expect.equals(15, statik.offsetTop, "Static offsetTop");
  Expect.equals(15, statik.offsetLeft, "Static offsetLeft");
  Expect.equals(body, relative.offsetParent, "Relative offsetParent");
  Expect.equals(13, relative.offsetTop, "Relative offsetTop");
  Expect.equals(19, relative.offsetLeft, "Relative offsetLeft");
}
