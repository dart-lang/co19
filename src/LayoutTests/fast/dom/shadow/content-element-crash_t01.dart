/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description PASS unless crash.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="target"></div>
     <div></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var target = document.getElementById("target");
  var shadow = target.createShadowRoot();
  shadow.innerHtml = "<div> <content></content> </div>";

  //dart disallows innerHtml on style... 
  //var style = document.createElement("style");
  //style.innerHtml = " p { display: none; } "; // Contents doesn't matter.
  var style = new Element.html('<style> p { display: none; }</style>',
    treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
}
