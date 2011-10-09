/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The length of the string.
 * @description Check that field contains correct value
 * @author msyabro
 */


main() {
  Expect.isTrue("".length == 0);
  Expect.isTrue("\u0000".length == 1);
  
  Expect.isTrue("\"".length == 1);
  Expect.isTrue('''""'''.length == 2);
  Expect.isTrue("""''''''""".length == 6);
  $CHECK("""
  """.length == 4);//4 spaces before closing triple-quote
  
  String str = "string";
  Expect.isTrue(str.length == 6);
}
