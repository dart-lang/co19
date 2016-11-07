/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test passes if it doesn't crash (or ASSERT).
 */
import "dart:html";

main() {
  var f = document.createDocumentFragment();
  var s = document.createElement('div');
  f.append(s);
  try { s.insertAdjacentHtml('afterend', "aaa"); } catch (_) {};
}
