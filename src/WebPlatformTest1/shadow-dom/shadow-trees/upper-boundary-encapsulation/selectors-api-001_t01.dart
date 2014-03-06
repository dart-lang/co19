/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Upper-boundary encapsulation:
 * Nodes in a shadow tree must not be accessible through selector APIs of 
 * owner document.
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  // Return a document containing the structure below:
  //
  // <body> - - - - - {shadow-root}
  //   |                    |
  //   |                    +-- <p class="test-class" id="test-id">
  //   |
  //   +-- <p class="test-class" id="test-id">
  createTestDocument() {
    var doc = document.implementation.createHtmlDocument('Test');
    var pHost = doc.createElement('p');
    pHost.className = 'test-class';
    pHost.id = 'test-id';
    doc.body.append(pHost);
    var shadowRoot = doc.body.createShadowRoot();
    var pShadow = doc.createElement('p');
    pShadow.className = 'test-class';
    pShadow.id = 'test-id';
    shadowRoot.append(pShadow);
    return new DynObject.fromMap({
      'doc': doc,
      'pHost': pHost,
      'pShadow': pShadow
    });
  }

  test(() {
    var documentObject = createTestDocument();
    var doc = documentObject.doc;
    var pHost = documentObject.pHost;
    assert_equals(doc.querySelector('p'), pHost);
    assert_equals(doc.querySelector('.test-class'), pHost);
    assert_equals(doc.querySelector('#test-id'), pHost);
  },
  'Elements in a shadow tree should not be accessible from ' +
  'owner document\'s querySelector() method.'
  );

  assert_singleton_node_list(nodeList, expectedNode) {
    assert_equals(nodeList.length, 1);
    assert_equals(nodeList[0], expectedNode);
  }

  test(() {
    var documentObject = createTestDocument();
    var doc = documentObject.doc;
    var pHost = documentObject.pHost;
    assert_singleton_node_list(doc.querySelectorAll('p'), pHost);
    assert_singleton_node_list(doc.querySelectorAll('.test-class'), pHost);
    assert_singleton_node_list(doc.querySelectorAll('#test-id'), pHost);
  },
  'Elements in a shadow tree should not be accessible from ' +
  'owner document\'s querySelectorAll() method.'
  );
}
