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
 * @assertion Upper-boundary encapsulation:
 * The ownerDocument property of all nodes in shadow tree refers to the 
 * document of the shadow host.
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  test(() {
    var doc = document.implementation.createHtmlDocument('Test');
    doc.body.innerHtml = '<div>A<div>B</div>C<div><span>D</span></div>E</div>';
    var nodeIterator = new NodeIterator(doc.documentElement,
      NodeFilter.SHOW_ELEMENT);
    var node;
    while (node = nodeIterator.nextNode()) {
      var shadowRoot = node.createShadowRoot();
      assert_equals(shadowRoot.ownerDocument, doc);
    }
  }, 'ownerDocument property of a shadow root should be the document of the ' +
  'shadow host, regardless of the location of the shadow host.');

  test(() {
    var MAX_DEPTH = 16;
    var doc = document.implementation.createHtmlDocument('Test');
    var tail = doc.body;
    for (var depth = 1; depth <= MAX_DEPTH; ++depth) {
      var div = doc.createElement('div');
      div.id = 'depth-$depth';
      tail.append(div);
      tail = div;
    }

    for (var depth = 1; depth <= MAX_DEPTH; ++depth) {
      var host = doc.getElementById('depth-$depth');
      var shadowRoot = host.createShadowRoot();
      assert_equals(shadowRoot.ownerDocument, doc,
        'ownerDocument mismatch for #depth-$depth');
    }
  }, 'ownerDocument property of elements in a shadow tree should match ' +
  'the document of the shadow host, regardless of the element\'s location ' +
  'in a shadow tree.');
  
  test(() {
    var doc = document.implementation.createHtmlDocument('Test');
    var shadowRoot = doc.body.createShadowRoot();
    var div = doc.createElement('div');
    shadowRoot.append(div);
    assert_equals(div.ownerDocument, doc);
  }, 'Elements added to a shadow tree should automatically get a valid ' +
  'ownerDocument.');
  
  test(() {
    var doc1 = document.implementation.createHtmlDocument('Test 1');
    var doc2 = document.implementation.createHtmlDocument('Test 2');
    var shadowRoot = doc1.body.createShadowRoot();
    var div = doc2.createElement('div');
    shadowRoot.append(div);
    assert_equals(div.ownerDocument, doc1);
  }, 'ownerDocument property of an element in a shadow tree should be the ' +
  'document of the shadow host, even if the host element is created from ' +
  'another document.');

  test(() {
    var doc1 = document.implementation.createHtmlDocument('Test 1');
    var doc2 = document.implementation.createHtmlDocument('Test 2');
    var shadowRoot = doc1.body.createShadowRoot();
    doc2.body.innerHtml =
    '<div id="root">A<div>B</div>C<div><span>D</span></div>E</div>';
  shadowRoot.append(doc2.getElementById('root'));
  var nodeIterator = new NodeIterator(shadowRoot.getElementById('root'),
    0xFFFFFFFF);
  var node;
  while (node = nodeIterator.nextNode()) {
    assert_equals(node.ownerDocument, doc1);
  }
  }, 'All children nodes of a shadow root get a valid ownerDocument when ' +
  'added to a shadow tree.');

  test(() {
    var doc1 = document.implementation.createHtmlDocument('Test 1');
    var doc2 = document.implementation.createHtmlDocument('Test 2');
    var shadowRoot = doc1.body.createShadowRoot();
    doc2.body.innerHtml = '<div id="parent"><div id="child"></div></div>';
    shadowRoot.append(doc2.getElementById('child'));
    assert_equals(doc2.getElementById('parent').ownerDocument, doc2);
  }, 'ownerDocument property of a node should remain the same, even if its ' +
  'child is adopted into a shadow tree.');
}
