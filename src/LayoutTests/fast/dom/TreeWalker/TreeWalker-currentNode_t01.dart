/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests the TreeWalker.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var subTree = document.createElement('div');
  subTree.innerHtml = "<p>Lorem ipsum <span>dolor <b>sit</b> amet</span>, consectetur <i>adipisicing</i> elit, sed do eiusmod <tt>tempor <b><i>incididunt ut</i> labore</b> et dolore magna</tt> aliqua.</p>";
  document.body.append(subTree);

  //no such ctor in dart
  //var all = (node) { return true; };
  //var w = new TreeWalker(subTree, 0x01 | 0x08 | 0x10 | 0x20, all, true);
  var w = new TreeWalker(subTree, 0x01 | 0x08 | 0x10 | 0x20);

  debug("Test that TreeWalker.parent() doesn't set the currentNode to a node not under the root.");

  shouldBe(w.currentNode, subTree);
  shouldBeNull(w.parentNode());
  shouldBe(w.currentNode, subTree);

  debug("Test that we handle setting the currentNode to arbitrary nodes not under the root element.");

  w.currentNode = document.documentElement;
  shouldBeNull(w.parentNode());
  shouldBe(w.currentNode, document.documentElement);
  w.currentNode = document.documentElement;
  shouldBe(w.nextNode(), document.documentElement.firstChild);
  shouldBe(w.currentNode, document.documentElement.firstChild);
  w.currentNode = document.documentElement;
  shouldBeNull(w.previousNode());
  shouldBe(w.currentNode, document.documentElement);
  w.currentNode = document.documentElement;
  shouldBe(w.firstChild(), document.documentElement.firstChild);
  shouldBe(w.currentNode, document.documentElement.firstChild);
  w.currentNode = document.documentElement;
  shouldBe(w.lastChild(), document.documentElement.lastChild);
  shouldBe(w.currentNode, document.documentElement.lastChild);
  w.currentNode = document.documentElement;
  shouldBeNull(w.nextSibling());
  shouldBe(w.currentNode, document.documentElement);
  w.currentNode = document.documentElement;
  shouldBeNull(w.previousSibling());
  shouldBe(w.currentNode, document.documentElement);

  debug("Test how we handle the case when the traversed to node within the root, but the currentElement is not.");

  w.currentNode = subTree.previousNode;
  shouldBe(w.nextNode(), subTree);
  w.currentNode = document.body;
  shouldBe(w.lastChild(), subTree);

  // Cleanup
  subTree.remove();
}
