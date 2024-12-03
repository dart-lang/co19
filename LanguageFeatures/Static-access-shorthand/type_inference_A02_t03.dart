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
/// @description Checks that it’s a compile-time error if the constant shorthand
/// context does not denote a declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

main() {
  var v1 = const .new();
//               ^
// [analyzer] unspecified
// [cfe] unspecified

  final v2 = const .new(2);
//                 ^
// [analyzer] unspecified
// [cfe] unspecified

  const v3 = const .id(3);
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
}
