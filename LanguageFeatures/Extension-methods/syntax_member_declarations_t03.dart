// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion an extension declaration is a top-level declaration with a grammar
/// similar to:
/// <extension> ::=
///   `extension' <identifier>? <typeParameters>? `on' <type> `?'? `{'
///     memberDeclaration*
///   `}'
/// ...
/// The member declarations can be any non-abstract static or instance member
/// declaration except for instance variables and constructors, and they cannot
/// have the same name as a member declared by Object (==, hashCode, toString,
/// runtimeType or noSuchMethod)
///
/// @description Check that it is a compile error if extension declares members
/// with the same name as a member declared by Object (==, hashCode, toString,
/// runtimeType or noSuchMethod)
/// @author sgrekhov@unipro.ru



extension ExtendedList<T> on List<T> {
  dynamic noSuchMethod (Invocation invocation) => null;
//        ^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EXTENSION_DECLARES_MEMBER_OF_OBJECT
// [cfe] This extension member conflicts with Object member 'noSuchMethod'.
  bool operator == (dynamic other) => true;
//              ^^
// [analyzer] COMPILE_TIME_ERROR.EXTENSION_DECLARES_MEMBER_OF_OBJECT
// [cfe] This extension member conflicts with Object member '=='.
  int get hashCode => 42;
//        ^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EXTENSION_DECLARES_MEMBER_OF_OBJECT
// [cfe] This extension member conflicts with Object member 'hashCode'.
  Type get runtimeType => this.runtimeType;
//         ^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EXTENSION_DECLARES_MEMBER_OF_OBJECT
// [cfe] This extension member conflicts with Object member 'runtimeType'.
  String toString() => "Run, Forrest, run";
//       ^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EXTENSION_DECLARES_MEMBER_OF_OBJECT
// [cfe] This extension member conflicts with Object member 'toString'.
}

main() {
  List<String> list = ["Lily", "was", "here"];
}
