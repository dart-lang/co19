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
/// denotes the type declaration `D`. Test an extension type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

extension type const ET<X>.foo(Type type) {
  const ET.new() : type = X;
  const ET.id() : type = X;
}

typedef NullableInt = int?;
typedef NullableString = String?;

main() {
  ET et1 = const .new();
  Expect.equals(dynamic, et1.type);

  ET<bool> et2 = const .new();
  Expect.equals(bool, et2.type);

  ET? et3 = const .new();
  Expect.equals(dynamic, et3.type);

  ET<int?> et4 = const .new();
  Expect.equals(NullableInt, et4.type);

  ET<int>? et5 = const .new();
  Expect.equals(int, et5.type);

  ET<String?>? et6 = const .new();
  Expect.equals(NullableString, et6.type);

  ET et7 = const .id();
  Expect.equals(dynamic, et7.type);

  ET<bool> et8 = const .id();
  Expect.equals(bool, et8.type);

  ET? et9 = const .id();
  Expect.equals(dynamic, et9.type);

  ET<int?> et10 = const .id();
  Expect.equals(NullableInt, et10.type);

  ET<int>? et11 = const .id();
  Expect.equals(int, et11.type);

  ET<String?>? et12 = const .id();
  Expect.equals(NullableString, et12.type);
}
