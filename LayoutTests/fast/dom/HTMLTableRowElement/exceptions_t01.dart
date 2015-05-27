/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test should trigger exceptions on HTMLTableRowElement, and
 * verify that the messages are reasonably helpful.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var tr = document.createElement('tr');

  shouldThrow(() => tr.insertCell(-2));
  shouldThrow(() => tr.insertCell(1));
  shouldThrow(() => tr.deleteCell(-2));
  shouldThrow(() => tr.deleteCell(2));
}
