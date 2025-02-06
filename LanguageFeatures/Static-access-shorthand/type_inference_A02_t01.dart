// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When inferring types for a `const .id(arguments)` or
/// `const .new(arguments)` with context type scheme C, let D be the declaration
/// denoted by the shorthand context assigned to the `<staticMemberShorthand>`,
/// which may differ from C. Then proceed with type inference in the same way as
/// if `.id`/`.new` was preceded by an identifier `D` denoting the declaration
/// D. It’s a compile-time error if the shorthand context does not denote a
/// declaration. It's a compile-time error if a static member lookup with base
/// name `id`/`new` on this declaration does not find a constant constructor.
///
/// @description Checks that if a shorthand context type schema has one of the
/// forms `const .id(arguments)`, or `const .new(arguments)`, `D` is the
/// declaration denoted by the shorthand context then then the shorthand context
/// denotes the type declaration `D`. Test a class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

import '../../Utils/expect.dart';

class C<X> {
  final Type type;
  const C() : type = X;
  const C.id(int _) : type = X;
}

typedef NullableInt = int?;
typedef NullableString = String?;

main() {
  C c1 = const .new();
  Expect.equals(dynamic, c1.type);

  C<bool> c2 = const .new();
  Expect.equals(bool, c2.type);

  C? c3 = const .new();
  Expect.equals(dynamic, c3.type);

  C<int?> c4 = const .new();
  Expect.equals(NullableInt, c4.type);

  C<int>? c5 = const .new();
  Expect.equals(int, c5.type);

  C<String?>? c6 = const .new();
  Expect.equals(NullableString, c6.type);

  C c7 = const .id(0);
  Expect.equals(dynamic, c7.type);

  C<bool> c8 = const .id(0);
  Expect.equals(bool, c8.type);

  C? c9 = const .id(0);
  Expect.equals(dynamic, c9.type);

  C<int?> c10 = const .id(0);
  Expect.equals(NullableInt, c10.type);

  C<int>? c11 = const .id(0);
  Expect.equals(int, c11.type);

  C<String?>? c12 = const .id(0);
  Expect.equals(NullableString, c12.type);
}
