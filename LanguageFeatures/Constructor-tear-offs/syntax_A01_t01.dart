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
  var v1 = C<int>.new;
  var v2 = (C<int>).new;
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  var v3 = (C.new)<int>;

  var v4 = C<Never>.constr1;
  var v5 = (C<Never>).constr1;
//                    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var v6 = (C.constr1)<Never>;

  var v7 = C<Null>.constr2;
  var v8 = (C<Null>).constr2;
//                   ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var v9 = (C.constr2)<Null>;

  var v10 = C<List>.constr3;
  var v11 = (C<List>).constr3;
//                    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var v12 = (C.constr3)<List>;

  var v13 = C<Object?>.constr4;
  var v14 = (C<Object?>).constr4;
//                       ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var v15 = (C.constr4)<Object?>;
}
