// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if an extension type declares a
/// member whose basename is the basename of an instance member declared by
/// Object as well.
///
/// @description Checks that it is a compile-time error if an extension type
/// declares a member whose name is declared by `Object` as well.
/// @author sgrekhov22@gmail.com

extension type V1(int id) {
  int get hashCode => id.hashCode;
//        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Type get runtimeType => V1;
//         ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  dynamic noSuchMethod(Invocation invocation) => null;
//        ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  String toString() => "V1($id)";
//       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  bool operator ==(Object other) => false;
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type V2<T>(T id) {
  @override
  int get hashCode => id.hashCode;
//        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  @override
  Type get runtimeType => V2<T>;
//         ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
//        ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  @override
  String toString() => "V2<$T>($id)";
//       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  @override
  bool operator ==(Object other) => false;
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(V1);
  print(V2);
}
