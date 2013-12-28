/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The template contents must be a DocumentFragment.
 */

import 'dart:html';
import "../../../Utils/expect.dart";
import '../testcommon.dart';

main() {
  test('Test empty template', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    doc.body.append(template);

    Expect.isTrue(template.content is DocumentFragment);
  });

  test('Test not empty template', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<div>This is a div</div><span>This is a span</span>';

    doc.body.append(template);
  
    Expect.isTrue(template.content is DocumentFragment);
  });

  test('Test not empty template containing div element', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<div>This is a div</div>';

    doc.body.append(template);
  
    Expect.isTrue(template.content is DocumentFragment);
  });

  test('Test not empty template containing text node', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    template.innerHtml = 'Some text';

    doc.body.append(template);

    Expect.isTrue(template.content is DocumentFragment);
  });

  var qwe;
  test('Test nested template containing text node', () {
    //var doc = newHtmlDocument();
    var doc = document;
    qwe = doc;
    var template = doc.createElement('template');

    template.innerHtml = '<template id="t2">Some text</template>';

    doc.body.append(template);

    Expect.isTrue(template.content is DocumentFragment);

    var nestedTemplate = template.content.querySelector("#t2");

    Expect.isTrue(nestedTemplate.content is DocumentFragment);
  });

  testInIFrame('../resources/template-contents-empty.html', (context) {
    //var doc = context.iframes[0].contentWindow.document;
    //var template = doc.querySelector('template');
    //Expect.isTrue(template.content is DocumentFragment);
  }, 'Test the empty template tag inside HTML file loaded in iframe)');
}
