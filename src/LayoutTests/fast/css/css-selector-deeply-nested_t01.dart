/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test case for http://bugs.webkit.org/show_bug.cgi?id=41129
 * If browser didn't crash, the test passed.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  generate_deeply_nested_selector(nest) {
    var selector = [];
    for (var i = 0; i < nest; ++i)
      selector.add('* > ');
    // We don't add last '*' to the selector so that this CSS Selector is invalid.
    selector.add(' {background:blue}');

    //style.innerHtml= is not supported in dart
    /*var style = document.createElement('style');
    style.type = 'text/css';
    style.innerHtml = selector.join('');*/

    var style = new Element.html('''
        <style>
        ${selector.join('')}
        </style>
        ''', treeSanitizer: new NullTreeSanitizer());

    document.head.append(style);
  }

  generate_deeply_nested_selector(400000);
}
