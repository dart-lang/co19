// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion From the Unified collection Spec:
/// A [spreadElement] starting with [...?] is a constant element if its
/// expression is constant and it evaluates to [null] or a constant [List], [Set]
/// or [Map] instance originally created by a list, set or map literal. It is a
/// potentially constant element if the expression is potentially constant
/// expression.
///
/// @description: Checks that constant set spread [...?] element can be
/// potentially constant list or set.
/// @author iarkh@unipro.ru

class MyClass {
  final String a;
  const MyClass(Object o) : a = o as String;
}

main() {
  const Set s1 = {...?(MyClass(12345) is MyClass ? [12] as List? : [])}; // ignore: unnecessary_type_check
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  const Set s2 = {...?(MyClass(12345) is MyClass ? {12} as Set? : <int>{})}; // ignore: unnecessary_type_check
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  const Set s3 = {...?(MyClass(12345) is MyClass ? {12} : null)}; // ignore: unnecessary_type_check
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  const Set s4 = {...?(MyClass(12345) is MyClass ? {null} : 1)}; // ignore: invalid_null_aware_operator,unnecessary_type_check
//                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
