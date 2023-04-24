// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Sealed class cannot be constructed, extended, implemented or
/// mixed in but is exhaustive
///
/// @description Checks that `sealed class` is exhaustive
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

sealed class C {}
class ExtendsC1 extends C {}
class ExtendsC2 extends C {}

String test1(C c) => switch (c) {
      ExtendsC1 _ => "ExtendsC1",
      ExtendsC2 _ => "ExtendsC2"
    };

String test2(SealedClass c) => switch (c) {
      ExtendsSealedClass _ => "ExtendsSealedClass",
      ImplementsSealedClass _ => "ImplementsSealedClass",
      MixinOnSealed _ => "SealedExtendsInterfaceClass1"
    };

main() {
  test1(ExtendsC1());
  test2(extendsSealedClass);
}
