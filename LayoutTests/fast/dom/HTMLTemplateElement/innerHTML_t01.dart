/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description The test asserts that template contents are serialized with
 * innerHtml and its children are ignored.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var expected = '''
<div>Contents 1
<template>Contents 2</template>
</div>''';

  document.body.innerHtml = '<template id="template">$expected</template>';

  firstElementChild(node) => node.childNodes.firstWhere((x) => x is Element);

  var template = document.getElementById('template');
  template.append(document.createElement('span'))
    .text = 'should not serialize';
  var innerTemplate = firstElementChild(template.content.firstChild);
  innerTemplate.append(document.createElement('span'))
    .text = 'should not serialize either';

  template.innerHtml = template.innerHtml;

  //shouldBe(template.childNodes.length, 1); // The only child should be the span that was added above.

  shouldBe(template.innerHtml, expected);
}
