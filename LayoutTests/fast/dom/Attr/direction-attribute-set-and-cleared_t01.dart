/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that setting the dir attribute to rtl and clearing
 * it defaults to ltr.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.dir = 'rtl';
  document.body.offsetTop;
  document.body.dir = '';
  Expect.equals('ltr', document.body.getComputedStyle().direction);
}
