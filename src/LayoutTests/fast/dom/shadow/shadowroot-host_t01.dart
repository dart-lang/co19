/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests ShadowRoot.host property
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  createRoots(host, n) {
    var roots = [];
    for (var i = 0; i < n; i++) {
      roots.add(host.createShadowRoot());
    }
    return roots;
  }

  var host = document.createElement('table');
  var root = host.createShadowRoot();
  shouldBe(root.host, host);

  // For elements which has UA shadow root.
  host = document.createElement('details');
  root = host.createShadowRoot();
  shouldBe(root.host, host);

  // Multiple shadow roots.
  host = document.createElement('div');
  document.body.append(host);
  var roots = createRoots(host, 2);
  shouldBe(roots[0].host, host);
  shouldBe(roots[1].host, host);
  host.remove();

  // Out of document
  host = document.createElement('div');
  roots = createRoots(host, 2);
  shouldBe(roots[0].host, host);
  shouldBe(roots[1].host, host);

  // Out of document, in nested shadow, accessed out of order
  host = document.createElement('span');
  roots[1].append(host);
  roots = createRoots(host, 7);
  shouldBe(roots[1].host, host);
  shouldBe(roots[6].host, host);

  // Cannot set property
  // no host= setter in dart
  /*host = document.createElement('span');
  root = host.createShadowRoot();
  var donor = document.createElement('div');
  donor.createShadowRoot();
  root.host = donor;
  shouldBe(root.host, host);*/
}
