/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that the querySelector and querySelectorAll fast 
 * path for IDs is not overzelous.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var root = document.createElement('div');
  var correctNode = document.createElement('div');
  correctNode.setAttribute("id", "testid");
  root.append(correctNode);
  document.body.append(root);

  shouldBe(document.querySelector('div#testid'), correctNode);
  shouldBe(document.querySelector('#testid'), correctNode);
  shouldBeNull(document.querySelector('ul#testid'));
  shouldBeNull(document.querySelector('ul #testid'));
  shouldBeNull(document.querySelector('#testid[attr]'));
  shouldBeNull(document.querySelector('#testid:not(div)'));

  shouldBe(document.querySelectorAll('div#testid').length, 1);
  shouldBe(document.querySelectorAll('div#testid')[0], correctNode);
  shouldBe(document.querySelectorAll('#testid').length, 1);
  shouldBe(document.querySelectorAll('#testid')[0], correctNode);
  shouldBe(document.querySelectorAll('ul#testid').length, 0);
  shouldBe(document.querySelectorAll('ul #testid').length, 0);
  shouldBe(document.querySelectorAll('#testid[attr]').length, 0);
  shouldBe(document.querySelectorAll('#testid:not(div)').length, 0);
}

