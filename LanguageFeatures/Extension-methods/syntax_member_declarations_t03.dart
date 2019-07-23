/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion an extension declaration is a top-level declaration with a grammar
 * similar to:
 * <extension> ::=
 *   `extension' <identifier>? <typeParameters>? `on' <type> `?'? `{'
 *     memberDeclaration*
 *   `}'
 * ...
 * The member declarations can be any non-abstract static or instance member
 * declaration except for instance variables and constructors, and they cannot
 * have the same name as a member declared by Object (==, hashCode , toString,
 * runtimeType or noSuchMethod)
 *
 * @description Check that it is a compile error if extension declares members
 * with the same name as a member declared by  Object (==, hashCode , toString,
 * runtimeType or noSuchMethod)
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

extension ExtendedList<T> on List<T> {
  dynamic noSuchMethod (Invocation invocation) => null; //# 01: compile-time error
  bool operator == (dynamic other) => true;             //# 02: compile-time error
  int get hashCode => 42;                               //# 03: compile-time error
  Type get runtimeType => this.runtimeType;             //# 04: compile-time error
  String toString() => "Run, Forrest, run";             //# 05: compile-time error
}

main() {
  List<String> list = ["Lily", "was", "here"];
}
