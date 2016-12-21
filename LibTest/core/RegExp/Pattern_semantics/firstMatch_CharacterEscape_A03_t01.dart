/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.10: The production CharacterEscape :: v evaluates by
 * returning the character \u000B
 * @description Checks that \v evaluates to \u000B.
 * @3rdparty sputnik-v1:S15.10.2.10_A1.3_T1.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  RegExp re = new RegExp("\\v");
  Expect.isTrue(null != re.firstMatch("\u000B"));
  re = new RegExp("\\v\\v");
  Expect.isTrue(null != re.firstMatch("\u000B\u000Basf"));
}
