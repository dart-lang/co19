/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "../../testcommon.dart";
import "../../resources/testharness.dart";

main() {
  dynamic ctx = createContext2d("canvas");

  test(() {
    ctx.fillStyle = "#008000";
    ctx.fillStyle = "800000";
    assert_equals(ctx.fillStyle, "#008000");
  }, 'fillStyle should not accept quirks mode hex colors.');
}
