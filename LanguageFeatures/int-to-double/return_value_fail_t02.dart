// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of a double valued integer literal is [double]
/// @description Checks that the static type of a double valued integer literal
/// is [double]. Test that it is a compile error if expected type is not
/// precisely `double`
/// @author sgrekhov@unipro.ru

class C<X extends double> {
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

X foo1<X extends double>() => 42;
//                            ^^
// [analyzer] unspecified
// [cfe] unspecified
X foo2<X extends double>() => 0x42;
//                            ^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  C<double> c = new C<double>();
  foo<double>();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
  foo<double>();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}
