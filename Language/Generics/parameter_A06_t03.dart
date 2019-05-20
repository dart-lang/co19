/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type parameter is considered to be a malformed type when
 * referenced by a static member.
 * @description Checks that type parameter is not malformed in not static
 * context.
 * @author ilya
 */

class C<T> {
  var x = 1 is T;
  final y;
  foo() => 1 is T;

  C() : y = 1 is T {
    1 is T;
  }
}

main() {
  new C().foo();
  new C<int>().foo();
}
