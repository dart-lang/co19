/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws [NullPointerException] if the [length] is null.
 * @description Checks that the exception is thrown as expected.
 * @author varlax
 * @reviewer msyabro
 */

main() {
  List a = new List();
  try {
    a.length = null;
    Expect.fail("Exception expected when setting ga.length to negative");
  } on NullPointerException catch(ok){}

  List<int> b = new List.from(<int>[1,3,5]);
  try {
    b.length = null;
    Expect.fail("Exception expected when setting ga.length to negative");
  } on NullPointerException catch(ok){}

  try {
    [].length = null;
    Expect.fail("Exception expected when setting ga.length to negative");
  } on NullPointerException catch(ok){}
}
