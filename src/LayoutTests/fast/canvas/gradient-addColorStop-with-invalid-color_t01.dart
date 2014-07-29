/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks invalid colors on gradients.
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var gradient = createContext2d("canvas").createLinearGradient(0, 0, 150, 0);

  shouldThrow(() => gradient.addColorStop(0, ''));
  shouldThrow(() => gradient.addColorStop(0, '#cc'));
  shouldThrow(() => gradient.addColorStop(0, 'rgb(257, 0)'));
  shouldThrow(() => gradient.addColorStop(0, 'rgb(257, 0, 5, 0)'));
}
