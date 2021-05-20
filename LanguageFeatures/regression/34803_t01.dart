// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Regression test for the issue 34803 (Dart crashes when tries to
/// compile a class with generic function parameter) - checks dart versions with
/// generic-metadata feature turned on.
/// @Issue 34803
/// @author iarkh@unipro.ru

// @dart=2.12

class A<X extends G> {}
//                ^
// [analyzer] unspecified
// [cfe] unspecified
typedef G<X> = void Function<Y extends X>();

main() {}
