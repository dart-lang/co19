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
  var f = new DocumentFragment.html('''
    <style>
    #a:nth-last-child(-n+2) {
        -webkit-flow-into: body;
    }
    </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>This test passes if it does not crash.</p>
      <div style="display: grid;">
          <div id=a></div>
          <div style="display: inline; "></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());
}
