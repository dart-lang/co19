// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything. This means you can have multiple local declarations named `_` in
/// the same namespace without a collision error. The initializer, if there is
/// one, is still executed, but the value is not accessible.
///
/// @description Checks that no entry named `_` is introduced into the enclosing
/// scope by a wildcarded declaration. Test type parameters of type aliases.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

class C<T> {}
typedef CAlias<_> = C<_>;
//                    ^
// [analyzer] unspecified
// [cfe] unspecified

mixin M<T> {}
typedef MAlias<_> = M<_>;
//                    ^
// [analyzer] unspecified
// [cfe] unspecified

enum E<T> {e1;}
typedef EAlias<_> = E<_>;
//                    ^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET<_>(int id) {}
typedef ETAlias<_> = ET<_>;
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C);
  print(M);
  print(E);
  print(ET);
}
