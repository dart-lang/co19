/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that querySelector, querySelectorAll and 
 * matchesSelector (matches) work with elements that are not 
 * in a document yet.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var root = document.createElement('div');
  var correctNode = document.createElement('div');
  correctNode.setAttribute("id", "testId");
  root.append(correctNode);
  var noChild = document.createElement('div');

  shouldBe(root.querySelector('div'), correctNode);
  shouldBe(root.querySelector('#testId'), correctNode);

  shouldBe(root.querySelectorAll('div').length, 1);
  shouldBe(root.querySelectorAll('div')[0], correctNode);
  shouldBe(root.querySelectorAll('#testId').length, 1);
  shouldBe(root.querySelectorAll('#testId')[0], correctNode);

  shouldBeNull(noChild.querySelector('div'));
  shouldBe(noChild.querySelectorAll('div').length, 0);

  shouldBeTrue(correctNode.matches('div'));
  shouldBeTrue(correctNode.matches('#testId'));
}

