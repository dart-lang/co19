// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  It is a compile error if a class has a setter named v= with
/// argument type T and a getter named v with return type S, and S may not be
/// assigned to T.
/// TODO (sgrekhov) Assertion is obsolete and should be updated
///
/// @description Checks that it is not an error if a class has a setter named
/// `v=` with argument type T and a getter named `v` with return type `S`, and
/// `S` may not be assigned to `T` (`int` and `String`).
/// @author vasya
/// @issue 42179
/// @issue 42702

class C<T extends int, S extends String> {
  var _foo;

  set foo(T t) {
    _foo = t;
  }
  S get foo => _foo;
}

main() {
  C<int, String>().foo = 42;
}
