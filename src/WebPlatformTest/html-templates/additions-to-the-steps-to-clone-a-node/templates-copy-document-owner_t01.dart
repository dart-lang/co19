/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ownerDocument of cloned template content is set to template content owner
 */

import 'dart:html';
import "../../../Utils/expect.dart";
import '../testcommon.dart';

checkOwnerDocument(node, doc) {
    if (node != null) {
        assert_equals(node.ownerDocument, doc,
                'Wrong ownerDocument of the template copy\'s node ' + node.nodeName);
        for (var i = 0; i < node.childNodes.length; i++) {
            if (node.childNodes[i].nodeType == Node.ELEMENT_NODE) {
                checkOwnerDocument(node.childNodes[i], doc);
                if (node.childNodes[i].nodeName == 'TEMPLATE') {
                    checkOwnerDocument(node.childNodes[i].content, doc);
                }
            }
        }
    }
}

main() {

  test(() {
    var doc = newHTMLDocument();
    doc.body.innerHtml = '<template id="tmpl1">' +
    '<div id="div1">This is div inside template</div>' +
    '<div id="div2">This is another div inside template</div>' +
    '</template>';

  var template = doc.querySelector('#tmpl1');
  var copy = template.clone(true);

  assert_equals(copy.content.childNodes.length, 2,
    'Wrong number of template content\'s copy child nodes');
  checkOwnerDocument(copy.content, template.content.ownerDocument);

  }, 'ownerDocument of cloned template content is set to template content owner. '
  + 'Test cloning with children');

  test(() {
    var doc = newHTMLDocument();
    doc.body.innerHtml = '<template id="tmpl1">' +
    '<div id="div1">This is div inside template</div>' +
    '<div id="div2">This is another div inside template</div>' +
    '</template>';

  var template = doc.querySelector('#tmpl1');
  var copy = template.clone(false);

  assert_equals(copy.content.childNodes.length, 0,
    'Wrong number of template content\'s copy child nodes');
  checkOwnerDocument(copy.content, template.content.ownerDocument);

  }, 'ownerDocument of cloned template content is set to template content owner. '
  + 'Test cloning without children');

  test(() {
    var doc = newHTMLDocument();
    doc.body.innerHtml = '<template id="tmpl1">' +
    '<div id="div1">This is div inside template</div>' +
    '<div id="div2">This is another div inside template</div>' +
    '<template id="tmpl2">' +
    '<div id="div3">This is div inside nested template</div>' +
    '<div id="div4">This is another div inside nested template</div>' +
    '</template>' +
    '</template>';

  var template = doc.querySelector('#tmpl1');
  var copy = template.clone(true);

  assert_equals(copy.content.childNodes.length, 3,
    'Wrong number of template content\'s copy child nodes');
  checkOwnerDocument(copy.content, template.content.ownerDocument);

  }, 'ownerDocument of cloned template content is set to template content owner. '
  + 'Test cloning nested template');

}
