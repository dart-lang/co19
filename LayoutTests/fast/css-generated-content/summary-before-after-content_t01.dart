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
          .before summary:before {
            content: "+";
            display: block;
          }
          .after summary:after {
            content: "+";
            display: block;
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <details>
          <summary>Should allow generated content inside summary</summary>
      </details>
      ''', treeSanitizer: new NullTreeSanitizer());

  var details = document.querySelector('details');

  assertHeightChangedWithClassName(className)
  {
    var oldHeight = details.offsetHeight;
    details.className = className;
    var newHeight = details.offsetHeight;
    document.body.append(new Text(className + ' '));
    document.body.append(new Text(newHeight > oldHeight ? 'PASS' : 'FAIL'));
    document.body.append(document.createElement('br'));
    shouldBeTrue(newHeight > oldHeight);
    details.className = '';
  }

  assertHeightChangedWithClassName('before');
  assertHeightChangedWithClassName('after');
}
