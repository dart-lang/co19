// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion The static type of a double valued integer literal is [double]
/// @description Checks that the static type of a double valued integer literal
/// is [double]. Test that it is a compile error if int is not assignable to
/// type X
/// @author sgrekhov@unipro.ru

class C<X extends num> {
  X get instanceGetter1 => 42;
//                         ^^
// [analyzer] unspecified
// [cfe] unspecified
  X get instanceGetter2 => 0x42;
//                         ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  X instanceMethod1() => 42;
//                       ^^
// [analyzer] unspecified
// [cfe] unspecified
  X instanceMethod2() => 0x42;
//                       ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

X foo1<X extends num>() => 42;
//                         ^^
// [analyzer] unspecified
// [cfe] unspecified
X foo2<X extends num>() => 0x42;
//                         ^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  C<double> c = new C<double>();
  foo1<double>();
  foo2<double>();
}
