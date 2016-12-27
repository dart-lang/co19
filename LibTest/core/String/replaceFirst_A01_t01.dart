/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a new string where the first occurrence of [from] in this
 * string is replaced with [to].
 * @description Checks that this function replace only the first pattern
 * occurrence and does it correctly
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  String str = "<first pattern> and <second pattern>";
  RegExp pattern = new RegExp("<.*?>", multiLine: false, caseSensitive: true);
  Expect.isTrue(str.replaceFirst(pattern, "") == " and <second pattern>");

  Expect.isTrue("".replaceFirst("", "EmptyString") == "EmptyString");
  Expect.isTrue("".replaceFirst("a", "b") == "");
  Expect.isTrue("a".replaceFirst("a", "a") == "a");

  Expect.isTrue("<>".replaceFirst(pattern, "") == "");

  Expect.isTrue("There are no patterns".replaceFirst(pattern, "") ==
      "There are no patterns");

  Expect.isTrue("<Nested <patterns>>".replaceFirst(pattern, "") == ">");
}
