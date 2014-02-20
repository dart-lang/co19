/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description The body should have 0 for both offsetLeft and offsetTop.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var body = document.body;
  body.style.position = 'relative';
  body.style.width = '200px';
  body.style.margin = '0 auto';

  Expect.isNull(body.offsetParent);
  Expect.equals(0, body.offsetLeft);
  Expect.equals(0, body.offsetTop);
}

