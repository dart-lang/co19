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
 * @description Check that the member declarations can be any non-abstract
 * static or instance member
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "../../Utils/expect.dart";

extension ExtendedList<T> on List<T> {
  int get getter => this.length * 2;
  List<T> operator-() => this.reversed.toList();
  List<List<T>> split(int at) => <List<T>>[this.sublist(0, at), this.sublist(at)];
  void set setter(int v) {this.length = v;}

  static String get staticGetter => "List";
  static void set staticSetter(String v) {staticVar = v;}
  static String staticMethod(String s) => s;
  static String staticVar = "Run, Forrest, run";
  static const staticConst = "Nothing is constant, everything is changing";
}

main() {
  List<String> list = ["Lily", "was", "here"];

  Expect.equals(6, list.getter);
  Expect.listEquals([["Lily"], ["was", "here"]], list.split(1));
  Expect.listEquals(["here", "was", "Lily"], -list);
  Expect.listEquals([["was", "here"], ["Lily"]], -list.split(1));
  list.setter = 13;
  Expect.equals(13, list.length);

  Expect.equals("List", ExtendedList.staticGetter);
  Expect.equals("Lily was here", ExtendedList.staticMethod("Lily was here"));
  Expect.equals("Run, Forrest, run", ExtendedList.staticVar);
  ExtendedList.staticSetter = "Lily was here";
  Expect.equals("Lily was here", ExtendedList.staticVar);
  Expect.equals("Nothing is constant, everything is changing", ExtendedList.staticConst);
}
