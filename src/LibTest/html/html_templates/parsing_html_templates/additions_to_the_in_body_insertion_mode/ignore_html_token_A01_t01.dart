/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If parser is in 'in body' insertion mode and meets HTML
 * token it should be ignored.
 */

import 'dart:html';
import "../../../../../Utils/expect.dart";
import '../../testcommon.dart';

class NoCheck implements NodeTreeSanitizer {
  void sanitizeTree(Node node) {} // does nothing
}

main() {
  test('Test HTML element assigned to template innerHTML', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<html><body></body></html>';

    doc.body.append(template);

    Expect.equals(0, template.content.childNodes.length,
        'Template cannot contain HTML element');
  });

  test('Test HTML element and some valid element before it, assigned to template innerHtml', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    template.innerHtml =
      '<div id="div1">Some text</div><html><body></body></html>';

    doc.body.append(template);

    Expect.equals(1, template.content.childNodes.length,
        'Template cannot contain HTML element');

    Expect.isNotNull(template.content.querySelector('#div1'),
        'Template should contain valid element');
  });

  test('Test HEAD element and some valid element after it, assigned to template innerHtml', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    template.innerHtml =
      '<html><body></body></html><div id="div1">Some text</div>';

    doc.body.append(template);

    Expect.equals(1, template.content.childNodes.length,
        'Template cannot contain HTML element');

    Expect.isNotNull(template.content.querySelector('#div1'),
        'Template should contain valid element');
  });

  test("Test HTML tag inside template tag assigned to another template's innerHTML", () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    template.innerHtml =
      '<template id="t2"><html><body></body></html></template>';

    doc.body.append(template);

    Expect.equals(1, template.content.childNodes.length,
        'Template should contain nested template');

    Expect.isNotNull(template.content.querySelector('#t2'),
        'Template should contain nested element');

    var nestedTemplate = template.content.querySelector('#t2');

    Expect.equals(0, nestedTemplate.content.childNodes.length,
        'Template cannot contain HTML element');
  });

  test('Test some valid element inside HTML element', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    template.innerHtml =
      '<html><div id="div1">Some text</div></html>';

    doc.body.append(template);

    Expect.equals(1, template.content.childNodes.length,
        'Template cannot contain HTML element');

    Expect.isNotNull(template.content.querySelector('#div1'),
        'Template should contain a valid element');
  });

  test('HTML token. Test valid element inside HTML and BODY elements', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    template.innerHtml =
      '<html><body><div id="div1">Some text</div><body></html>';

    doc.body.append(template);

    Expect.equals(1, template.content.childNodes.length,
        'Template cannot contain HTML element');

    Expect.isNotNull(template.content.querySelector('#div1'),
        'Template should contain valid element');
  }); 

  test('Test valid element inside and between HTML and BODY elements', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    template.innerHtml =
      '<html><span id="span1">Span</span><body><div id="div1">Some text</div><body></html>';

    doc.body.append(template);

    Expect.equals(2, template.content.childNodes.length,
        'Template cannot contain HTML element');

    Expect.isNotNull(template.content.querySelector('#div1'),
        'Template should contain valid DIV element');

    Expect.isNotNull(template.content.querySelector('#span1'),
        'Template should contain valid SPAN element');
  });
}
