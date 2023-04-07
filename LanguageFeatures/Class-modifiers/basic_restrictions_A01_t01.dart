// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - A declaration depends directly on a sealed declaration from another
///   library.
///
/// @description Check that it is a compile-time error if a declaration depends
/// directly on a `sealed` declaration from another library.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class ExtendsSealed extends SealedClass {}
//                          ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ImplementsSealed implements SealedClass {}
//                                ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin OnSealed on SealedClass {}
//                ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class WithSealed with SealedClass {}
//                    ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ExtendsSealed);
  print(ImplementsSealed);
  print(OnSealed);
  print(WithSealed);
}
