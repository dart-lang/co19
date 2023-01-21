// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error to read a field or tear off a method from an
/// expression whose type is potentially nullable and not dynamic, except for the
/// methods and fields on Object.
///
/// @description Check that it is a compile-time error to read a field or tear
/// off a method from an expression whose type is potentially nullable. Test
/// the case <T extends num?>
/// @author sgrekhov@unipro.ru


class C<T extends num?> {
  T t;
  C(this.t);

  test() {
    t.abs;
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  C<int?> c = new C<int?>(3);
  c.test();
}
