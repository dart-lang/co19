/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.10: The production CharacterEscape :: t evaluates by
 * returning the character \u0009
 * @description Checks that \t evaluates to \u0009.
 * @3rdparty sputnik-v1:S15.10.2.10_A1.1_T1.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  RegExp re = new RegExp("\\t");
  Expect.isTrue(null != re.firstMatch("\u0009"));
  re = new RegExp("\\t\\t");
  Expect.isTrue(null != re.firstMatch("\u0009\u0009asf"));
}
