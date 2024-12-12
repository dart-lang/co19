// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Redirecting generative constructors
/// ...
/// It is a compile-time error if:
/// ...
/// - The augmented constructor has a redirection.
///
/// @description Checks that it is a compile-time error to declare an augmenting
/// redirecting generative constructor more than once.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A18_t04.dart';

augment class C {
  augment C.foo(int x) : this(x + 1); // Ok
  augment C.foo(int x) : this(x + 2); // Augmented constructor already has a redirection
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
  augment const E.foo(int x) : this(x + 1);
  augment const E.foo(int x) : this(x + 2);
//                             ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment ET.foo(int x) : this(x + 1);
  augment ET.foo(int x) : this(x + 2);
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
}
