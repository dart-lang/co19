/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Joins all the given strings to create a new string.
 * @description Check that all strings are joined with separator between them
 * @author msyabro
 */


main() {
  String str = Strings.join(["1", "2", "3"], "");
  Expect.isTrue(str == "123");
  
  str = Strings.join(["1", "2", "3"], ",");
  Expect.isTrue(str == "1,2,3");
  
  str = Strings.join([], ",");
  Expect.isTrue(str == "");
  
  str = Strings.join([], "");
  Expect.isTrue(str == "");
  
  str = Strings.join(["1"], ",");
  Expect.isTrue(str == "1");
  
  str = Strings.join(["1", "1"], "1");
  Expect.isTrue(str == "111");
  
  str = Strings.join(["", "", ""], "1");
  Expect.isTrue(str == "11");
  
  str = Strings.join(["aa", "bb"], " long separator ");
  Expect.isTrue(str == "aa long separator bb");
}
