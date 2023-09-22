// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if an extension type declares a
/// member whose basename is the basename of an instance member declared by
/// Object as well.
///
/// @description Checks that it is a compile-time error if an extension type
/// declares a member whose name is declared by `Object` as well. Test the case
/// when extension type declares overrides of members of `Object`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type IntET(int id) implements int {}

extension type TypeET(Type id) implements Type {}

extension type BoolET(bool id) implements bool {}

extension type ET1(int id) {
  IntET get hashCode => IntET(0);
//          ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  TypeET get runtimeType => TypeET(int);
//           ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  dynamic noSuchMethod(Invocation invocation, [int add = 0]) => null;
//        ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  String toString([String s = ""]) => s;
//       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  BoolET operator ==(Object other) => BoolET(false);
//                ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type V2<T>(T id) {
  @override
  IntET get hashCode => IntET(0);
//          ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  @override
  TypeET get runtimeType => TypeET(V2<T>);
//           ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  @override
  dynamic noSuchMethod(Invocation invocation, {T? t}) => null;
//        ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  @override
  String toString({String s = ""}) => "V2<$T>($id)" + s;
//       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  @override
  BoolET operator ==(V2<T> other) => BoolET(false);
//                ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET1);
  print(ET2);
}
