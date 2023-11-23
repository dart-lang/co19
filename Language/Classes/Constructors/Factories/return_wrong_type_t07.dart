// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile error if a factory returns a non-null object whose
/// type is not a subtype of its actual return type.
///
/// @description Checks that returning null from factory constructor M produces
/// an error.
/// @author ilya


class A {
  factory A() => null;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  factory A.foo() => null;
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new A();
  new A.foo();
}
