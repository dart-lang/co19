/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If parser is in 'in body' insertion mode and meets FRAMESET
 * token it should be ignored.
 */

import 'dart:html';
import "../../../../../Utils/expect.dart";
import '../../testcommon.dart';

class NoCheck implements NodeTreeSanitizer {
  void sanitizeTree(Node node) {} // does nothing
}

main() {
  test('Test FRAMESET element assigned to template innerHtml', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');
    
    template.innerHtml =
      '<frameset cols="25%,*,25%">'
      '<frame src="frame_a.htm">'
      '<frame src="frame_b.htm">'
      '<frame src="frame_c.htm">'
      '</frameset>';

    doc.body.append(template);

    Expect.equals(0, template.content.childNodes.length,
        'Template cannot contain FRAMESET element');
    });

  test("Test FRAMESET element and some valid element before it, assigned to the template's innerHtml", () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    template.innerHtml =
      '<div id="div1">Some text</div>'
      '<frameset cols="25%,*,25%">'
      '<frame src="frame_a.htm">'
      '<frame src="frame_b.htm">'
      '<frame src="frame_c.htm">'
      '</frameset>';

    doc.body.append(template);

    Expect.equals(1, template.content.childNodes.length,
        'Template cannot contain FRAMESET element');

    Expect.isNotNull(template.content.querySelector('#div1'),
        'Template should contain valid element');
  });

  test("Test FRAMESET element and some valid element after it, assigned to the template's innerHtml", () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    template.innerHtml =
      '<frameset cols="25%,*,25%">'
      '<frame src="frame_a.htm">'
      '<frame src="frame_b.htm">'
      '<frame src="frame_c.htm">'
      '</frameset><div id="div1">Some text</div>';

    doc.body.append(template);

    Expect.equals(1, template.content.childNodes.length,
        'Template cannot contain FRAMESET element');

    Expect.isNotNull(template.content.querySelector('#div1'),
        'Template should contain valid element');
  });

  test("Test FRAMESET tag inside template tag assigned to another template's innerHtml", () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    template.innerHtml =
      '<template id="t2">'
      '<frameset cols="25%,*,25%">'
      '<frame src="frame_a.htm">'
      '<frame src="frame_b.htm">'
      '<frame src="frame_c.htm">'
      '</frameset></template>';

    doc.body.append(template);

    Expect.equals(1, template.content.childNodes.length,
        'Template should contain nested template');

    Expect.isNotNull(template.content.querySelector('#t2'),
        'Template should contain nested element');

    var nestedTemplate = template.content.querySelector('#t2');

    Expect.equals(0, nestedTemplate.content.childNodes.length,
        'Template cannot contain FRAMESET element');
  });
}