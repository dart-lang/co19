// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The type parameters of the type augmentation do not match the original
///   type's type parameters. This means there must be the same number of type
///   parameters with the same bounds and names.
///
/// @description Checks that it is a compile-time error if an augmenting type
/// declares wrong number of type parameters
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_types_A05_t01_lib.dart';

class C<T> {}

mixin M<T> {}

enum E<T> {
  e1;
}

class A {}

extension Ext<T> on A {}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
}
