// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @description Regression test for the issue 33864 (Analyzer throws exception
/// if function optional argument is omitted and it's parametrized).
///
/// Seems like according to the Issue 33684 evaluation there should be a compile
/// error here, so checks that [testme] function cannot be called without the
/// type parameter specified. Test example 1.
///
/// @Issue 33864
/// @author iarkh@unipro.ru


class A<X> {}
testme<X extends A<X>>([X x]) {}

main() {
  testme();
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

