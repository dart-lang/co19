// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of the named constructor tear-off expression is
/// the same as the static type of the corresponding constructor function
/// tear-off.
///
/// @description Checks that it is a compile-time error to attempt to tear-off
/// a constructor using `(C<T>).constructorName` syntax.
/// @author iarkh@unipro.ru

class C<T> {
  T? i;
  T? j;

  C();
  C.constr1(T i) {}
  C.constr2(int i, String s, x) {}
  C.constr3({int i = 1, required T j}) {}
  C.constr4(this.i, this.j);
}

main() {
  C<int>.new;
  (C.new)<int>;

  C<Never>.constr1;
  (C<Never>).constr1;
//           ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  (C.constr1)<Never>;

  C<Null>.constr2;
  (C<Null>).constr2;
//          ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  (C.constr2)<Null>;

  C<List>.constr3;
  (C<List>).constr3;
//          ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  (C.constr3)<List>;

  C<Object?>.constr4;
  (C<Object?>).constr4;
//             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  (C.constr4)<Object?>;
}
