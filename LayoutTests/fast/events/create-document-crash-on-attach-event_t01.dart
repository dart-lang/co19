/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks for crashes in setting an event handler on a
 * document element created by document.implementation.createDocument.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var doc = document.implementation.createDocument('', '', null);
  doc.onLoad.listen((_) { });
  testPassed('Attached onload event handler to created document.');
}
