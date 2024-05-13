// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything. This means you can have multiple local declarations named `_` in
/// the same namespace without a collision error.
///
/// @description Checks that it is not an error to have a multiple local
/// declarations named `_`. Test type parameters of type aliases.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

class C {}
mixin M {}
enum E {e1;}
extension type ET(int id) {}

typedef int F1<_, _, _ extends num>();
typedef F2<_, _, _ extends num> = int Function();
typedef CAlias<_, _, _ extends num> = C;
typedef MAlias<_, _, _ extends num> = M;
typedef EAlias<_, _, _ extends num> = E;
typedef ETAlias<_, _, _ extends num> = ET;

main() {
  print(F1);
  print(F2);
  print(CAlias);
  print(MAlias);
  print(EAlias);
  print(ETAlias);
}
