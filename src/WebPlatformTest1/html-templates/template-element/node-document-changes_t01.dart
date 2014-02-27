/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion When a template element's node document changes, the template 
 * element's content DocumentFragment must be adopted into the new node 
 * document's template contents owner document
 */

import 'dart:html';
import "../../../Utils/expect.dart";
import '../testcommon.dart';

main() {
  test(() {
    var doc1 = newHTMLDocument();
    var template = doc1.createElement('template');

    assert_equals(template.ownerDocument, doc1, 'Wrong template node owner document');
    assert_not_equals(template.content.ownerDocument, doc1,
      'Wrong template content owner document');

    var doc2 = newHTMLDocument();
    var template2 = doc2.createElement('template');
    doc2.body.append(template);

    assert_equals(template.ownerDocument, template2.ownerDocument,
      'Template node owner document should be changed');
    assert_equals(template.content.ownerDocument, template2.content.ownerDocument,
      'Template content owner document should be changed');

  }, 'Changing of template element\'s node document. ' +
  'Test that ownerDocument of an empty template and its content changes');


  test(() {
    var doc1 = newHTMLDocument();
    doc1.body.innerHTML = '<template id="tmpl"><div>Div content</div> And some more text</template>';

    var template = doc1.querySelector('#tmpl');

    assert_equals(template.ownerDocument, doc1,
      'Wrong template node owner document');
    assert_not_equals(template.content.ownerDocument, doc1,
      'Wrong template content owner document');

    var doc2 = newHTMLDocument();
    var template2 = doc2.createElement('template');
    doc2.body.append(template);

    assert_equals(template.ownerDocument, template2.ownerDocument,
      'Template node owner document should be changed');
    assert_equals(template.content.ownerDocument, template2.content.ownerDocument,
      'Template content owner document should be changed');

    assert_equals(template.content.querySelector('div').ownerDocument,
      template2.content.ownerDocument,
      'Template content descendants owner document should be changed');

  }, 'Changing of template element\'s node document. ' +
  'Test that ownerDocument of a not empty template and its content changes');


  test(() {
    var doc1 = newHTMLDocument();
    doc1.body.innerHTML = ''
    + '<template id="tmpl"><div>Div content</div> And some more text'
    + '<template id="tmpl2"><div>Template content</div></template>'
    + '</template>';

  var template = doc1.querySelector('#tmpl');

  assert_equals(template.ownerDocument, doc1, 'Wrong template node owner document');
  assert_not_equals(template.content.ownerDocument, doc1,
    'Wrong template content owner document');

  var nestedTemplate = template.content.querySelector('#tmpl2');

  assert_equals(nestedTemplate.ownerDocument, template.content.ownerDocument,
    'Wrong nested template node owner document');
  assert_equals(nestedTemplate.content.ownerDocument, template.content.ownerDocument,
    'Wrong nested template content owner document');

  var doc2 = newHTMLDocument();
  var template2 = doc2.createElement('template');
  doc2.body.append(template);

  assert_equals(template.ownerDocument, template2.ownerDocument,
      'Template node owner document should be changed');
  assert_equals(template.content.ownerDocument, template2.content.ownerDocument,
      'Template content owner document should be changed');
  assert_equals(template.content.querySelector('div').ownerDocument,
      template2.content.ownerDocument,
      'Template content descendants owner document should be changed');

  assert_equals(nestedTemplate.ownerDocument,
      template2.content.ownerDocument,
      'Nested template node owner document should be changed');
  assert_equals(nestedTemplate.content.ownerDocument,
      template2.content.ownerDocument,
      'Nested template content owner document should be changed');
  assert_equals(nestedTemplate.content.querySelector('div').ownerDocument,
      template2.content.ownerDocument,
      'Owner document of the nested template content descendants should be changed');

  }, 'Changing of template element\'s node document. ' +
  'Test that ownerDocument of nested template and its content changes');
}
