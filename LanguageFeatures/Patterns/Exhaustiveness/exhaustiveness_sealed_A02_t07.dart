// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive
///
/// @description Check that it is a compile-time error if the matched value type
/// of a switch expression is a sealed class and the set of cases is not
/// exhaustive. Test `base mixin`
/// @author sgrekhov22@gmail.com

sealed class S<T> {}

base mixin M<T> on S<T> {}

class C<T> extends S<T> {}

base class F<T> implements M<T> {}

void main() {
  S s1 = F();
  int v1 = switch (s1) { C _ => 1, M<int>() => 2 };
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  S<num> s2 = C<int>();
  int v2 = switch (s2) { C<int>()  => 1, M<int> _ => 2 };
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
