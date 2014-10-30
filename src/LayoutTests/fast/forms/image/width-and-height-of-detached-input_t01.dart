/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Width and height properties of a detached input element should
 * return 0.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";

main() {
  var input = document.createElement('input');
  input.type = 'image';
  shouldBe(input.width, 0);
  shouldBe(input.height, 0);
}
