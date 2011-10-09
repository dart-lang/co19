/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Splits the string around matches of [pattern]. Returns
 * an array of substrings.
 * @description Check the contents of resulting array
 * @author msyabro
 */


main() {
  Array<String> ss = "1,2".split(",");
  Expect.isTrue(ss[0] == "1" && ss[1] == "2");
  
  ss = "12345".split(",");
  Expect.isTrue(ss[0] == "12345");
  
  ss = "12345,".split(",");
  Expect.isTrue(ss[0] == "12345" && ss[1] == "");
  
  ss = "1, 2, 3, 4, 5".split(new RegExp("\\d", "g"));
  Expect.isTrue(ss[0] == "" && ss[1] == ", " && ss[2] == ", " && ss[3] == ", " && ss[4] == ", " && ss[5] == "");
  
  ss = "12".split("");
  Expect.isTrue(ss[0] == "1" && ss[1] == "2");
}
