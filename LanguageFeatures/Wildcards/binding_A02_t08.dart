// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything. This means you can have multiple local declarations named `_` in
/// the same namespace without a collision error.
///
/// @description Checks that it is not an error to have a multiple local
/// declarations named `_`. Test parameters of generic types.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

class C<_, _, _ extends num> {}

mixin M<_, _, _ extends num> {}

enum E<_, _, _ extends num> {
  e1;
}

extension type ET<_, _, _ extends num>(int _) {}

class A {}

extension Ext<_, _, _ extends num> on A {}

main() {
  print(C);
  print(M);
  print(E);
  print(ET);
  print(A);
}
