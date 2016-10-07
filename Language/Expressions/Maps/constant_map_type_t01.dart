/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile time error if the type argument of a
 * constant map literal includes a type parameter.
 * @description Checks that it is no error if if the type argument of a
 * constant map literal includes a type variable.
 * @issue 27492
 * @author msyabro
 * @reviewer kaigorodov
 */

class C<T> {
  test() {
    const <String, T> {"1": null};
  }
}

main() {
  new C<int>().test();
}
