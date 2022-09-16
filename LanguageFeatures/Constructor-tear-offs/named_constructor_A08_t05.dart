// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An instantiated tear-off is constant and canonicalized if the
/// instantiating types are constant, and not even equal if they are not.
///
/// @description Checks that invocation of a constructor tearoff is never a
/// constant expression
/// (see https://github.com/dart-lang/sdk/issues/46925#issuecomment-900420499)
/// @author iarkh@unipro.ru
/// @issue 46899
/// @issue 46900
/// @issue 46925

class MyClass {
  final a;
  const MyClass(int i, int j) : a = (i + j);
  const MyClass.constr() : a = 0;
}

main() {
  const v1 = MyClass.new;
  const c1 = v1(3, 14);
//           ^^
// [analyzer] unspecified
// [cfe] unspecified

  const v2 = MyClass.constr;
  const c2 = v2();
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
}
