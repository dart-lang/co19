/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If parser is in 'in body' insertion mode and meets BODY
 * token it should be ignored.
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  test('Test empty BODY element assigned to template innerHtml', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<body></body>';

    doc.body.append(template);

    Expect.equals(0, template.content.childNodes.length,
        'Template cannot contain BODY element');
  });

  test('Test not empty BODY element assigned to template innerHtml', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<body><div>Some content</div></body>';

    doc.body.append(template);

    Expect.equals(1, template.content.childNodes.length,
        'Wrong number of template content children');
    
    Expect.equals('DIV', template.content.firstChild.nodeName,
        'Template should contain children of ignored BODY element');
  });

  test('Test BODY element and some valid element after BODY tag assigned to template innerHtml', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<body><div <div id="div1">Some content</div></body><div id="div2">Some valid content</div>';

    doc.body.append(template);

    Expect.equals(2, template.content.childNodes.length,
        'Wrong number of template content children');

    Expect.isNotNull(template.content.querySelector('#div1'),
        'Template should contain children of the ignored BODY element');

    Expect.isNotNull(template.content.querySelector('#div2'),
        'Template should contain valid element');
  });

  test('Test BODY element and some valid element before BODY tag assigned to template innerHTML', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<div id="div1">Some valid content</div><body><div id="div2">Some content</div></body>';

    doc.body.append(template);

    Expect.equals(2, template.content.childNodes.length,
        'Template cannot contain BODY element');

    Expect.isNotNull(template.content.querySelector('#div1'),
        'Template should contain valid element');

    Expect.isNotNull(template.content.querySelector('#div2'),
        'Template should contain children of the ignored BODY element');
  });

  test("Test template with not empty BODY element inside assigned to another template's innerHtml", () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<template id="t2"><body><span>Body!<span></body></template>';

    doc.body.append(template);

    Expect.equals(1, template.content.childNodes.length,
        'Template should contain nested template');

    Expect.isNotNull(template.content.querySelector('#t2'),
        'Template should contain nested element');

    var nestedTemplate = template.content.querySelector('#t2');

    Expect.equals(1, nestedTemplate.content.childNodes.length,
        'Template cannot contain BODY element');

    Expect.equals('SPAN', nestedTemplate.content.firstChild.nodeName,
        'Template cannot contain BODY element');
  });
}
    
