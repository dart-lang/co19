// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The type parameters of the augmenting declaration do not match the
///   augmented declarations's type parameters. This means there must be the
///   same number of type parameters with the exact same type parameter names
///   (same identifiers) and bounds if any (same types, even if they may not be
///   written exactly the same in case one of the declarations needs to refer to
///   a type using an import prefix).
///
/// @description Checks that it is a compile-time error if an augmenting type
/// declares type parameters with different bounds.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_types_A05_t02_lib.dart';

class A {}
class B extends A {}
class C<T extends A> {}

mixin M<T extends A> {}

enum E<T extends A> {
  e1;
}

class D {}
extension Ext<T extends A> on D {}

extension type ET<T extends A>(int _) {}

main() {
  print(C);
  print(M);
  print(E);
  print(D);
  print(ET);
}
