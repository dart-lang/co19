/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Template may contain any element, except the html element,
 * the head element, the body element, or the frameset element.
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../testcommon.dart';

class NoCheck implements NodeTreeSanitizer {
  void sanitizeTree(Node node) {} // does nothing
}

main() {
  var elements = HTML5_ELEMENTS.toSet()
    .difference(['body','html','head','frameset'].toSet());

  for (var value in elements) {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');
    var element = doc.createElement(value);
    template.content.append(element);
    doc.body.append(template);

    Expect.isNotNull(template.content.querySelector(value),
        'Case1: error when child is $value');
  }

  for (var value in elements) {
    var doc = newHtmlDocument();

    if (isVoidElement(value)) {
      doc.body.setInnerHtml('<template><$value></template>',
          treeSanitizer: new NoCheck());
    } else {
      doc.body.setInnerHtml('<template><$value></$value></template>',
          treeSanitizer: new NoCheck());
    }

    var template = doc.querySelector('template');
    var element = template.content.querySelector(value);

    Expect.isNotNull(element,
        'Case2: error when child is $value');
  }
}