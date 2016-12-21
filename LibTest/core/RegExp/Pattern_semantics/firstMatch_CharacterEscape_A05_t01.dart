/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.10: The production CharacterEscape :: r evaluates by
 * returning the character \u000D
 * @description Checks that \r evaluates to \u000D.
 * @3rdparty sputnik-v1:S15.10.2.10_A1.5_T1.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  RegExp re = new RegExp("\\r");
  Expect.isTrue(null != re.firstMatch("\u000D"));
  re = new RegExp("\\r\\r");
  Expect.isTrue(null != re.firstMatch("\u000D\u000Dasf"));
}
