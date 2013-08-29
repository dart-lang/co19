/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E removeAt(int index)
 * Throws an ArgumentError if index is not an int.
 * @description Checks that an ArgumentError is thrown if index is not an int.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

void check(List a, var index) {
  try {
    a.removeAt(index);
    Expect.fail("ArgumentError expected");
  } on ArgumentError catch(ok) {
  }  catch(e) {
    print('unexpected error type:${e. runtimeType}("$e")');
    rethrow;
  }
}

main() {
  List a0=[1,3,3,4,5,6];
  check(a0, true);
  check(a0, 0.0);
  check(a0, "3");
  check(a0, [3]);
}
