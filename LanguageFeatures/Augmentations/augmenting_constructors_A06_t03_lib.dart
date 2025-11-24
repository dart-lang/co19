// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The resulting constructor is not valid (it has a redirection as well as
///   some initializer list elements, or it has multiple super initializers,
///   etc).
///
/// @description Checks that it is a compile-time error if a merged constructor
/// is cyclic.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A06_t03.dart';

augment class C {
  augment C() : this();
//             ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.foo() : this.foo();
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
  augment const E() : this();
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.foo() : this.foo();
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment ET(int v) : this.foo(v);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.foo(int v) : this.foo(v);
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
}
