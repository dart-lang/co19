// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Redirecting generative constructors
/// ...
/// It is a compile-time error if:
/// - The augmented constructor has an initializer list or a body, or it has a
///   redirection.
///
/// @description Checks that it is a compile-time error if a merged constructor
/// is cyclic.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A18_t07.dart';

augment class C {
  augment C(): this.foo();
//             ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.foo(): this.bar();
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.bar(): this();
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
  augment const E(): this.foo();
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.foo(): this.bar();
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.bar(): this();
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment ET.new(int x): this.foo(x);
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.foo(int x): this.bar(x);
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.bar(int x): this(x);
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
}
