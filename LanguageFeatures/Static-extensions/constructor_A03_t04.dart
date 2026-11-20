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
/// @description Checks that it is a compile-time error to declare a factory
/// constructor in an extension declaration whose on-type is a type variable,
/// including a type variable with a bound and a type alias whose expansion is a
/// type variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C {}

typedef Id<X> = X;

extension Ext1<T> on T {
  factory foo() => throw 0;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext2<T extends C> on T {
  factory() => throw 0;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension<T extends Object> on T {
  factory foo() => throw 0;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext4<T> on Id<T> {
  factory foo() => throw 0;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext5<T extends C> on T? {
  factory foo() => throw 0;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
