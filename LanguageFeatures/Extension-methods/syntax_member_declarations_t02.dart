// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion an extension declaration is a top-level declaration with a grammar
/// similar to:
/// <extension> ::=
///   `extension' <identifier>? <typeParameters>? `on' <type> `?'? `{'
///     memberDeclaration*
///   `}'
/// ...
/// The member declarations can be any non-abstract static or instance member
/// declaration except for instance variables and constructors, and they cannot
/// have the same name as a member declared by Object (==, hashCode , toString,
/// runtimeType or noSuchMethod)
///
/// @description Check that it is a compile error if extension declares an
/// instance variable, constructor or abstract method
/// @author sgrekhov@unipro.ru



extension ExtendedList<T> on List<T> {
  int instanceVar;                  //# 01: compile-time error
  String _privateInstanceVar;       //# 02: compile-time error
  ExtendedList() {}                 //# 03: compile-time error
  ExtendedList.named(int i) {}      //# 04: compile-time error
  void abstractMethod(String v);    //# 05: compile-time error
}

main() {
  List<String> list = ["Lily", "was", "here"];
}
