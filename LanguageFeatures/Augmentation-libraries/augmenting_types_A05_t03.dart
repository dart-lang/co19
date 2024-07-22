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
/// declares type parameters with different names.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_types_A05_t03_lib.dart';

class A {}
class B {}

class C<X extends A, Y> {}

mixin M<X extends A, Y> {}

enum E<X extends A, Y> {e1;}

extension Ext<X extends A, Y> on B {}

extension type ET<X extends A, Y>(int _) {}

main() {
  print(C);
  print(M);
  print(E);
  print(B);
  print(ET);
}
