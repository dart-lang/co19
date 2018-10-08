/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Should allow generated content inside details
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
          details.before:before {
            content: "+";
            display: block;
          }
          details.after:after {
            content: "+";
            display: block;
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <details>
          <summary>Should allow generated content inside details</summary>
      </details>
      ''', treeSanitizer: new NullTreeSanitizer());

  var details = document.querySelector('details');

  assertHeightChangedWithClassName(className)
  {
    var oldHeight = details.offsetHeight;
    details.className = className;
    var newHeight = details.offsetHeight;
    debug('::' + className);
    shouldBeTrue(newHeight > oldHeight);
    details.className = '';
  }

  assertHeightChangedWithClassName('before');
  assertHeightChangedWithClassName('after');
  details.remove();
}
