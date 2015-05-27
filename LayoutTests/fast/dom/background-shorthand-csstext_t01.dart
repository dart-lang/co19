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
    <div id="div1" style="background-repeat: repeat-x, repeat-y; background-color:white"></div>
    <div id="div2" style="background: 50% 50% blue"></div>
    <div id="div3" style="background: rgb(255, 255, 255) none repeat scroll"></div>

    <p>This page tests whether or not the background shorthand properly omits
    initial values.
    <hr>

    <div id='console' style="background-color:white; border:2px solid black"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  document.body.setAttribute("style", "background: green; color:white");

  shouldBe(document.body.style.background, 'green');
  shouldBe(document.getElementById('div1').style.background, 'repeat-x, repeat-y white');
  shouldBe(document.getElementById('div2').style.background, '50% 50% blue');
  shouldBe(document.getElementById('div3').style.background, 'none repeat scroll rgb(255, 255, 255)');
}
