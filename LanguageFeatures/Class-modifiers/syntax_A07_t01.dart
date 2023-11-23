// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Many combinations don't make sense:
/// ...
/// - mixin as a modifier cannot be applied to a mixin-application class
///   declaration (the class C = S with M; syntax for declaring a class). The
///   remaining modifiers can.
///
/// @description Check that it is a compile-time error if `mixin` modifier is
/// added to a mixin-application class declaration
/// @author sgrekhov22@gmail.com

class C {}

mixin M1 {}

mixin class M2 {}

mixin class MixinClass1 = C with M1;
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClass2 = C with M2;
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(MixinClass1);
  print(MixinClass2);
}
