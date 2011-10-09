/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a new string where the first occurrence of [from] in this string
 * is replaced with [to].
 * @description Check that function replaces correctly and only the first occurrence
 * @author msyabro
 */


main() {
  String str = "<first pattern> and <second pattern>";
  RegExp pattern = new RegExp("<.*?>", "");
  Expect.isTrue(str.replace(pattern, "") == " and <second pattern>");
  
  Expect.isTrue("".replace("", "EmptyString") == "EmptyString");
  Expect.isTrue("".replace("a", "b") == "");
  Expect.isTrue("a".replace("a", "a") == "a");
          
  Expect.isTrue("<>".replace(pattern, "") == "");
  
  Expect.isTrue("There are no patterns".replace(pattern, "") == "There are no patterns");

  Expect.isTrue("<Nested <patterns>>".replace(pattern, "") == ">");
}
