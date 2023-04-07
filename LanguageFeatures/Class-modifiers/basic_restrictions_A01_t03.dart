// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - A declaration depends directly on a sealed declaration from another
///   library.
///
/// @description Check that it is not an error if a declaration depends
/// a `sealed` declaration from another librarybut not directly
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class ExtendsSealed1 extends ExtendsSealedClass with MixinOnSealed {}

class ImplementsSealed1 implements ExtendsSealedClass {}

class ExtendsSealed2 extends ImplementsSealedClass with MixinOnSealed {}

class ImplementsSealed2 implements ImplementsSealedClass {}

main() {
  print(ExtendsSealed1);
  print(ImplementsSealed1);
  print(ExtendsSealed2);
  print(ImplementsSealed2);
}
