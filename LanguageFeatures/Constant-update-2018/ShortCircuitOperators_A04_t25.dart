// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Finally, the conditional [?]/[:] operator only evaluates one of
/// its branches, depending on whether the condition expression evaluates to
/// [true] or [false]. The other branch must also be a potentially constant
/// expression.
///
/// @description Checks that conditional operator [?]/[:] in constant expression
/// throws a compile error if the result is of incorrect type.
///
/// Please note that Dart 2.9 _does_ admit an implicit downcast, so
/// constructions like `const int i = true ? 0 : "123"` throw a compile error in
/// dart 2.14 and passes without errors in dart 2.9.
///
/// @author iarkh@unipro.ru

const String s = "constant string";
const dynamic d = "another string";

class MyClass1 {
  final int res;
  const MyClass1() : res = (false ? s : 0);    // OK for Dart 2.9
}

class MyClass2 {
  final int res;
  const MyClass2() : res = (false ? d : 0);
}

class MyClass3 {
  final int res;
  const MyClass3() : res = (false ? 0 : s);
}

class MyClass4 {
  final int res;
  const MyClass4() : res = (false ? 0 : "bad str");    // OK for Dart 2.9
}

class MyClass5 {
  final int res;
  const MyClass5() : res = (false ? 15 : d);
}

main() {
  const c1 = MyClass1();

  const c2 = MyClass2();

  const c3 = MyClass3();
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c5 = MyClass5();
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
