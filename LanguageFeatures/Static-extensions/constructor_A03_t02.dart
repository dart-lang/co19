// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For the purpose of identifying the on-declaration of a given
/// extension, the types `FutureOr`, `void`, `dynamic`, and `Never` are not
/// considered to be classes, mixins, enums, or extension types, and neither are
/// record types or function types, with the exception of the types `Record` and
/// `Function`, which are considered to be classes.
///
/// Also note that none of the following types are classes:
/// - A type of the form T? for any type T.
/// - A type variable.
/// - An intersection type.
/// ...
/// It is a compile-time error if an extension declaration `D` declares a
/// constructor if `D` does not have an on-declaration as defined above.
///
/// @description Checks that that it is a compile-time error to declare a
/// factory constructor in an extension declaration that has no on-declaration.
/// Test unnamed extensions.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import 'dart:async';

void getVoid() {}
class C {}

extension on FutureOr {
  factory someName() => Future.value(42);
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension on void {
  factory() => getVoid();
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension on dynamic {
  factory() => 42;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension on Never {
  factory() => 42;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension on (int,) {
  factory() => (42,);
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension on void Function() {
  factory() => getVoid;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension on C? {
  factory someName() => C();
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
}
