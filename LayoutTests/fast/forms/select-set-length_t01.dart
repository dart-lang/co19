/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that setting the .length of an HTMLSelectElement
 * correctly creates and destroys options.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var sel = document.createElement('select');
  document.body.append(sel);

  shouldBe(sel.length, 0);

  sel.length = 200;
  shouldBe(sel.length, 200);

  sel.length = 100;
  shouldBe(sel.length, 100);

  sel.length = 180;
  shouldBe(sel.length, 180);
}
