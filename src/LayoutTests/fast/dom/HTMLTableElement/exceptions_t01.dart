/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test should trigger exceptions on HTMLTableElement
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var t = document.createElement('table');

  shouldThrow(() => t.insertRow(-2));
  shouldThrow(() => t.insertRow(1));
  shouldThrow(() => t.deleteRow(-2));
  shouldThrow(() => t.deleteRow(2));
}
