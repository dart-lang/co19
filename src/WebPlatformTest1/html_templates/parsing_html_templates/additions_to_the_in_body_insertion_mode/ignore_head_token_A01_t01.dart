/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If parser is in 'in body' insertion mode and meets HEAD
 * token it should be ignored.
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

class NoCheck implements NodeTreeSanitizer {
  void sanitizeTree(Node node) {} // does nothing
}

main() {
  test('Test empty HEAD element assigned to template innerHtml', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<head></head>';

    doc.body.append(template);

    Expect.equals(0, template.content.childNodes.length,
        'Template cannot contain HEAD element');

  });

  test('Test not empty HEAD element assigned to template innerHtml', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    template.setInnerHtml(
        '<head><title>test</title></head>',
        treeSanitizer: new NoCheck());

    doc.body.append(template);

    Expect.equals(1, template.content.childNodes.length,
        'Wrong number of template content children');

    Expect.isTrue(template.content.firstChild is TitleElement,
        'Template should contain children of ignored HEAD element');
  });

  test('Test HEAD element and some valid element before it, assigned to template innerHtml', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    template.setInnerHtml(
        '<div id="div1">Some text</div><head><title>test</title></head>',
        treeSanitizer: new NoCheck());

    doc.body.append(template);

    Expect.equals(2, template.content.childNodes.length,
        'Wrong number of template content children');

    Expect.isNotNull(template.content.querySelector('#div1'),
        'Template should contain valid element');

    Expect.isTrue(template.content.lastChild is TitleElement,
        'Template should contain children of ignored HEAD element');

  });

  test('Test HEAD element and some valid element after it, assigned to template innerHtml', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    template.setInnerHtml(
        '<head><title>test</title></head><div id="div1">Some text</div>',
        treeSanitizer: new NoCheck());

    doc.body.append(template);

    Expect.equals(2, template.content.childNodes.length,
        'Wrong number of template content children');

    Expect.isTrue(template.content.firstChild is TitleElement,
        'Template should contain children of ignored HEAD element');

    Expect.isNotNull(template.content.querySelector('#div1'),
        'Template should contain valid element');
  });

  test("Test HEAD tag inside template tag assigned to another template's innerHTML", () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    template.setInnerHtml(
        '<template id="t2"><head><title>test</title></head></template>',
        treeSanitizer: new NoCheck());

    doc.body.append(template);

    Expect.equals(1, template.content.childNodes.length,
        'Template should contain nested template');

    Expect.isNotNull(template.content.querySelector('#t2'),
        'Template should contain nested element');

    var nestedTemplate = template.content.querySelector('#t2');

    Expect.equals(1, nestedTemplate.content.childNodes.length,
        'Wrong number of template content children');

    Expect.isTrue(nestedTemplate.content.firstChild is TitleElement,
        'Template should contain children of ignored HEAD element');

  });
}