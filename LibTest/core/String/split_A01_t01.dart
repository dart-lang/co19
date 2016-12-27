/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Splits the string around matches of [pattern]. Returns a list of
 * substrings.
 * @description Checks the length of resulting list
 * @author msyabro
 */
import "../../../Utils/expect.dart";


main() {
  Expect.equals(5, "1, 2, 3, 4, 5".split(",").length);
  
  Expect.equals(4, "10011".split("1").length);

  Expect.equals(6, "1, 2, 3, 4, 5".split(new RegExp("\\d", multiLine: false,
      caseSensitive: true)).length); // empty tokens are included
  
  Expect.equals(1, "12345".split(",").length);
  
  Expect.equals(2, "12345,".split(",").length);
  
  Expect.equals(0, "".split("").length); // is it right?
  
  Expect.equals(2, "12".split("").length); // also questionable
}
