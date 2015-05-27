/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests accessing the length after accessing (length + 1)-th
 * item in HTMLCollection doesn't cache a wrong length.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var container = document.createElement('div');
  var span = document.createElement('span');
  var children = container.children;
  shouldBe(children.length, 0);
  container.append(span);
  try {children[1];} catch(_) {}
  shouldBe(children.length, 1);
  span.remove();
  shouldBe(children.length, 0);
}
