/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var canvas = document.createElement("canvas");
  var context = canvas.getContext("2d");

  shouldNotThrow(() => context.fill());
  shouldNotThrow(() => context.fill('nonzero'));
  shouldThrow(() => context.fill('randomstring'));

  shouldNotThrow(() => context.clip());
  shouldNotThrow(() => context.clip('nonzero'));
  shouldThrow(() => context.clip('randomstring'));

  shouldNotThrow(() => context.isPointInPath(0, 0));
  shouldNotThrow(() => context.isPointInPath(0, 0, 'nonzero'));
  shouldThrow(() => context.isPointInPath(0, 0, 'randomstring'));
}
