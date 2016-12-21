/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.10: The production CharacterEscape :: n evaluates by
 * returning the character \u000A
 * @description Checks that \n evaluates to \u000A.
 * @3rdparty sputnik-v1:S15.10.2.10_A1.2_T1.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  RegExp re = new RegExp("\\n");
  Expect.isTrue(null != re.firstMatch("\u000A"));
  re = new RegExp("\\n\\n");
  Expect.isTrue(null != re.firstMatch("\u000A\u000Aasf"));
}
