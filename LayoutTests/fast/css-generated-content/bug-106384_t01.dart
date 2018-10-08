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
    ruby:after {
        display: block;
        content: "";
    }
    </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>
          Bug 106384: Heap-use-after-free in WebCore::RenderObject::willBeRemovedFromTree.
      </p>
      ''', treeSanitizer: new NullTreeSanitizer());

  var ruby = document.createElement('ruby');
  document.body.append(ruby);
  // Cause a layout.
  document.body.offsetLeft;
  ruby.append(new Text('Passed if this test did not crash or assert.'));
}
