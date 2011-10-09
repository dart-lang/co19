/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Splits the string around matches of [pattern]. Returns
 * an array of substrings.
 * @description Check the length of resulting array
 * @author msyabro
 * @reviewer rodionov
 * @needsreview
 */


main() {
  Array<String> splittedStrings = "1, 2, 3, 4, 5".split(",");
  Expect.isTrue(splittedStrings.length == 5);
  
  splittedStrings = "10011".split("1");
  Expect.isTrue(splittedStrings.length == 4); // empty tokens are included
  
  splittedStrings = "1, 2, 3, 4, 5".split(new RegExp("\\d", "g"));
  Expect.isTrue(splittedStrings.length == 6); // empty tokens are included
  
  splittedStrings = "12345".split(",");
  Expect.isTrue(splittedStrings.length == 1);
  
  splittedStrings = "12345,".split(",");
  Expect.isTrue(splittedStrings.length == 2);
  
  splittedStrings = "".split("");
  Expect.isTrue(splittedStrings.length == 0); //is it right?
  
  splittedStrings = "12".split("");
  Expect.isTrue(splittedStrings.length == 2); // also questionable
}
