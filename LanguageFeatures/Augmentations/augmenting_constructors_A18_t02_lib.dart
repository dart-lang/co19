// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Redirecting generative constructors
/// ...
/// It is a compile-time error if:
/// - The augmented constructor has any initializers.
///
/// @description Checks that it is a compile-time error to declare an augmenting
/// redirecting generative constructor if the augmented constructor has a
/// non-empty initializer list.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A18_t02.dart';

augment class C {
  augment C.foo(int x, {int y = 0}) : this(x);
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.bar({required int x}) : this.foo(x);
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
  augment const E.foo(int x, {int y = 0}) : this(x);
//                                          ^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.bar({required int x}) : this.foo(x);
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment ET.foo(int x) : this(x);
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.bar({required int x}) : this.new(x);
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified
}
