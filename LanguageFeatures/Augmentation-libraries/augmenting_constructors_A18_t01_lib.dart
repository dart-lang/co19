// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Redirecting generative constructors
/// ...
/// It is a compile-time error if:
/// - The augmented constructor has an initializer list or a body, or it has a
///   redirection.
///
/// @description Checks that it is a compile-time error to declare an augmenting
/// redirecting generative constructor if the augmented constructor has
/// initialising formals.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A18_t01.dart';

augment class C {
  augment C.foo(this.x, {this.y}) : this(x);
//              ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.bar({required this.y}) : this.foo(0);
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
  augment const E.foo(this.x, {this.y}) : this(x);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.bar(this.x, {required this.y}) : this.foo(0);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment ET.foo(this.x) : this(0);
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.bar({required this.x}) : this.new(1);
//                ^
// [analyzer] unspecified
// [cfe] unspecified
}
