/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that document.body.clientWidth and
 * document.body.clientHeight cause a layout on use.  The test has passed if 
 * they have positive values.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  shouldBeTrue(document.body.clientWidth > 0);
  shouldBeTrue(document.body.clientHeight > 0);
}
