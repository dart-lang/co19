// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive
///
/// @description Check that it is a compile-time error if the matched value type
/// of a switch expression or statement is a sealed class and the set of cases
/// is not exhaustive
/// @author sgrekhov22@gmail.com

sealed class S<T> {}

mixin M<T> on S<T> {}

class C<T> extends S<T> {}

class F<T> implements M<T> {}

int test1(S s) {
  switch (s) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case C _: return 1;
    case M<int> _: return 2;
  }
}

int test2(S s) {
  switch (s) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case C<int>(): return 1;
    case M<int> _: return 2;
  }
}

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
  print(test1);
  print(test2);
}
