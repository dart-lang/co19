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
 * declaration except for instance variables and constructors.
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
  static void set staticSetter(String v) {staticVar = v;};
  static String staticMethod(String s) => s;
  static String staticVar = "Run, Forrest, run";
}

main() {
  List<String> list = ["Lily", "was", "here"];

  Expect.equals(6, list.getter);
  Expect.listEquals([["Lily"], ["was", "here"]], list.split(1));
  Expect.listEquals(["here", "was", "Lily"], -list.split);
  list.setter = 13;
  Expect.equals(13, list.length);

  Expect.listEquals(["List"], List.staticGetter);
  Expect.listEquals(["Lily was here"], List.staticMethod("Lily was here"));
  Expect.equals("Run, Forrest, run", List.staticVar);
  List.staticSetter = "Lily was here";
  Expect.equals("Lily was here", List.staticVar);
}
