/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.10: The production CharacterEscape :: f evaluates by
 * returning the character \u000C
 * @description Checks that \f evaluates to \u000C.
 * @3rdparty sputnik-v1:S15.10.2.10_A1.4_T1.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  RegExp re = new RegExp("\\f");
  Expect.isTrue(null != re.firstMatch("\u000C"));
  re = new RegExp("\\f\\f");
  Expect.isTrue(null != re.firstMatch("\u000C\u000Casf"));
}
