/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a new string where all occurrences of [from] in this
 * string are replaced with [to].
 * @description Checks that this function replaces all pattern occurrences correctly
 * @author msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

main() {
  String str = "<first pattern> and <second pattern>";
  RegExp pattern = new RegExp("<.*?>", multiLine: false, caseSensitive: true);
  Expect.isTrue(str.replaceAll(pattern, "") == " and ");

  Expect.isTrue("".replaceAll("", "EmptyString") == "EmptyString");
  Expect.isTrue("".replaceAll("a", "b") == "");

  Expect.isTrue("<>".replaceAll(pattern, "") == "");

  Expect.isTrue("There are no patterns".replaceAll(pattern, "") == "There are no patterns");
  Expect.isTrue("<Nested <one> <two>>".replaceAll(pattern, "") == " >");

  Expect.isTrue("baaaaaa".replaceAll("a", "b") == "bbbbbbb");
  Expect.isTrue("bb".replaceAll("b", "b") == "bb");
}
