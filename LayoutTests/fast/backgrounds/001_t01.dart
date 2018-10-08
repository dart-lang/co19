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
      <style type="text/css">
      .one {background-image: url($root/resources/bg_position_larger.gif); background-position: 10px 10px;
             background-repeat: no-repeat; background-color: green; width: 50px; height: 50px;}
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      The box below should be solid green. If there are 10 pixels of red visible on the top and left, the background image is being repeated improperly.
      </p>
      <p class="one">
      </p>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    Element e = document.getElementsByClassName('one')[0];
    shouldBe(e.getComputedStyle()
      .backgroundColor, 'rgb(0, 128, 0)');
    asyncEnd();
  });
}
