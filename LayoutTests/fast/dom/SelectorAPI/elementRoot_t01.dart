/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that querySelector and querySelectorAll don't 
 * search outside their root node.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var root = document.createElement('div');
  var correctNode = document.createElement('div');
  root.append(correctNode);
  document.body.append(root);
  var noChild = document.createElement('div');
  document.body.append(noChild);

  shouldBe(root.querySelector('div'), correctNode);
  shouldBe(root.querySelectorAll('div').length, 1);
  shouldBe(root.querySelectorAll('div')[0], correctNode);

  shouldBeNull(noChild.querySelector('div'));
  shouldBe(noChild.querySelectorAll('div').length, 0);
}
