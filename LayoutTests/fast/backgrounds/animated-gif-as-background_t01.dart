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
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style type="text/css" media="screen">
        div {
          background: blue;
          background-image: url('$root/resources/red-green-animated.gif');
          height: 200px;
          width: 200px;
        }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>Div background should animate between red and green. DRT should snapshot when it is green.</p>
      <div></div>
      ''', treeSanitizer: new NullTreeSanitizer());
    
  pageLoaded(_) {
    setTimeout(() {
      shouldBe(document.body.querySelector('div').getComputedStyle()
        .backgroundColor, 'rgb(0, 0, 255)');
      asyncEnd();
    }, 200);    // Red frame of GIF has 100ms duration
  }

  asyncStart();
  window.addEventListener('load', pageLoaded, false);
}
