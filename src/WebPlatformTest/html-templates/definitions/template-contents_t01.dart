/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * @assertion The template contents must be a DocumentFragment
 */

import 'dart:html';
import "../../../Utils/expect.dart";
import '../testcommon.dart';

main() {
  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    doc.body.append(template);

    assert_equals(template.content.nodeType, Node.DOCUMENT_FRAGMENT_NODE,
      'Template content should be a DocumentFragment');

    Expect.isTrue(template.content is DocumentFragment,
      'Template content class should be a DocumentFragment');

  }, 'The template contents must be a DocumentFragment (empty template)');


  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<div>This is a div</div><span>This is a span</span>';

    doc.body.append(template);

    assert_equals(template.content.nodeType, Node.DOCUMENT_FRAGMENT_NODE,
      'Template content should be a DocumentFragment');

    Expect.isTrue(template.content is DocumentFragment,
      'Template content class should be a DocumentFragment');

  }, 'The template contents must be a DocumentFragment (non empty template)');



  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<div>This is a div</div>';

    doc.body.append(template);

    assert_equals(template.content.nodeType, Node.DOCUMENT_FRAGMENT_NODE,
      'Template content should be a documentFragment');

  }, 'The template contents must be a DocumentFragment (non empty template '
    + 'containing div which is an Element instance)');


  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.innerHtml = 'Some text';

    doc.body.append(template);

    assert_equals(template.content.nodeType, Node.DOCUMENT_FRAGMENT_NODE,
      'Template content should be a documentFragment');

    Expect.isTrue(template.content is DocumentFragment,
      'Template content class should be a DocumentFragment');

  }, 'The template contents must be a DocumentFragment (not empty template '
    + 'containing text node)');


  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<template id="t2">Some text</template>';

    doc.body.append(template);

    assert_equals(template.content.nodeType, Node.DOCUMENT_FRAGMENT_NODE,
      'Template content should be a documentFragment');
    Expect.isTrue(template.content is DocumentFragment,
      'Template content class should be a DocumentFragment');

    var nestedTemplate = template.content.querySelector("#t2");
    assert_equals(nestedTemplate.content.nodeType, Node.DOCUMENT_FRAGMENT_NODE,
      'Nested template content should be a documentFragment');

    Expect.isTrue(nestedTemplate.content is DocumentFragment,
      'Nested template content class should be a DocumentFragment');


  }, 'The template contents must be a DocumentFragment (nested template '
      + 'containing a text node)');
}
