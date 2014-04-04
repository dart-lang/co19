/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Upper-boundary encapsulation:
 * The nodes are accessible using shadow root's DOM tree accessor methods.
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  assert_singleton_node_list(nodeList, expectedNode) {
    assert_equals(nodeList.length, 1);
    assert_equals(nodeList[0], expectedNode);
  }

  test(() {
    var doc = document.implementation.createHtmlDocument('Test');
    var shadowRoot = doc.body.createShadowRoot();
    var image = doc.createElement('img');
    shadowRoot.append(image);

    assert_singleton_node_list(shadowRoot.getElementsByTagName('img'), image);
  },
  'Elements in a shadow tree should be accessible via shadow root\'s ' +
  'getElementsByTagName() DOM tree accessor.'
  );

  /*test(() {
    var namespace = 'http://www.w3.org/1999/xhtml';
    var doc = document.implementation.createDocument(namespace, 'html', null);
    doc.documentElement.append(doc.createElementNS(namespace, 'head'));
    var body = doc.createElementNS(namespace, 'body');
    var imageHost = doc.createElementNS(namespace, 'img');
    body.append(imageHost);
    doc.documentElement.append(body);

    var shadowRoot = body.createShadowRoot();
    var imageShadow = doc.createElementNS(namespace, 'img');
    shadowRoot.append(imageShadow);

    assert_singleton_node_list(
      shadowRoot.getElementsByTagNameNS(namespace, 'img'), imageShadow);
  },
  'Elements in a shadow tree should be accessible via shadow root\'s ' +
  'getElementsByTagNameNS() DOM tree accessor.'
  );*/

  test(() {
    var doc = document.implementation.createHtmlDocument('Test');
    var shadowRoot = doc.body.createShadowRoot();
    var div = doc.createElement('div');
    div.className = 'div-class';
    shadowRoot.append(div);

    assert_singleton_node_list(
      shadowRoot.getElementsByClassName('div-class'), div);
  },
  'Elements in a shadow tree should be accessible via shadow root\'s ' +
  'getElementsByClassName() DOM tree accessor.'
  );

  test(() {
    var doc = document.implementation.createHtmlDocument('Test');
    var shadowRoot = doc.body.createShadowRoot();
    var div = doc.createElement('div');
    div.id = 'div-id';
    shadowRoot.append(div);

    assert_equals(shadowRoot.getElementById('div-id'), div);
  },
  'Elements in a shadow tree should be accessible via shadow root\'s ' +
  'getElementById() DOM tree accessor.'
  );
}
