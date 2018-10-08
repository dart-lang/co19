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
  var style = new Element.html('''
      <style>
          body {
              height: 2000px;
          }
          
          *::-webkit-resizer { position: fixed; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

    
  doTest(_)  {
    var svgElement = document.createElementNS("http://www.w3.org/2000/svg", "svg");
    document.body.append(svgElement);
    window.scrollBy(0, 100);
    asyncEnd();
  }

  window.addEventListener('load', doTest, false);

  asyncStart();

  document.body.setInnerHtml('''
      <p>This test should not crash</p>
      <input>
      ''', treeSanitizer: new NullTreeSanitizer());
}
