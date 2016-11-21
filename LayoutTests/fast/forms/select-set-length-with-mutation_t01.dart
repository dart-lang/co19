/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests setting the .length of an HTMLSelectElement with mutation
 * listeners registered.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  SelectElement sel = document.createElement('select') as SelectElement;
  document.body.append(sel);

  sel.addEventListener('DOMNodeRemoved', (_) {}, false);
  sel.addEventListener('DOMNodeInserted', (_) {}, false);

  sel.length = 200;
  shouldBe(sel.length, 200);

  sel.length = 100;
  shouldBe(sel.length, 100);

  sel.length = 180;
  shouldBe(sel.length, 180);
}
