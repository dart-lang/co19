/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract int lastIndexOf(Pattern pattern, [int start])
 * It is an error if start is negative or greater than length.
 * @description Tries to pass an index that is out of range
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

main() {
  String str = "string";
  Expect.throws((){
    str.lastIndexOf("s", -1);
  }, (e) => e is Error);
  Expect.throws((){
    str.lastIndexOf("s", 0x80000000);
  }, (e) => e is Error);
  Expect.throws((){
    str.lastIndexOf("s", str.length+1);
  }, (e) => e is Error);
  Expect.throws((){
    str.lastIndexOf("s", 0x7fffffff);
  }, (e) => e is Error);
}
