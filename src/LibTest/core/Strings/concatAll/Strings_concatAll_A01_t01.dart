/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Concatenates all the given strings to create a new string.
 * @description Check that all strings are concatenated
 * @author msyabro
 */


main() {
  String str = Strings.concatAll([]);
  Expect.isTrue(str == "");
  
  str = Strings.concatAll(["", "", ""]);
  Expect.isTrue(str == "");
  
  str = Strings.concatAll(["1", "2", "3", "4", "5"]);
  Expect.isTrue(str == "12345");
  
  str = Strings.concatAll(["string"]);
  Expect.isTrue(str == "string");
}
