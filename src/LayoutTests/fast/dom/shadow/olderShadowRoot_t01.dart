/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests ShadowRoot.olderShadowRoot property
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

  // Out of document
  var host = document.createElement('div');
  var roots = createRoots(host, 2);
  shouldBe(roots[1].olderShadowRoot, roots[0]);
  shouldBeNull(roots[0].olderShadowRoot);

  // In document
  host = document.createElement('div');
  document.body.append(host);
  roots = createRoots(host, 3);
  shouldBe(roots[2].olderShadowRoot, roots[1]);
  shouldBe(roots[1].olderShadowRoot, roots[0]);
  shouldBeNull(roots[0].olderShadowRoot);
  host.remove();

  // Out of document, in nested shadow, accessed out of order
  host = document.createElement('span');
  roots[1].append(host);
  roots = createRoots(host, 7);
  shouldBeNull(roots[0].olderShadowRoot);
  shouldBe(roots[1].olderShadowRoot, roots[0]);
  shouldBe(roots[6].olderShadowRoot, roots[5]);

  // Single root
  host = document.createElement('table');
  var root = host.createShadowRoot();
  shouldBeNull(root.olderShadowRoot);

  // Cannot access a user-agent shadow

  host = document.createElement('details');
  root = host.createShadowRoot();
  shouldBeNull(root.olderShadowRoot);

  host = document.createElement('summary');
  document.body.append(host);
  root = host.createShadowRoot();
  shouldBeNull(root.olderShadowRoot);
  host.remove();

  /*
  // Cannot set property

  host = document.createElement('span');
  roots = createRoots(host, 2);
  var donor = document.createElement('div');
  donor.root = donor.createShadowRoot();
  roots[1].olderShadowRoot = donor.root;
  shouldBe(roots[1].olderShadowRoot, roots[0]);

  host = document.createElement('details');
  document.body.append(host);
  root = host.createShadowRoot();
  donor = document.createElement('div');
  donor.root = donor.createShadowRoot();
  root.olderShadowRoot = donor.root;
  shouldBeNull('root.olderShadowRoot');
  host.remove();
  */
}
