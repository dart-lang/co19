// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Case ⟨Static or library variable⟩. If `d` declares a static or
/// library variable, the implicitly induced getter of `id` executes as follows:
/// - Non-constant variable with an initializer. In the case where `d` has an
///   initializing expression and is not constant, the implicitly induced getter
///   of `id` is a late-initialized getter. This determines the semantics of an
///   invocation.
///
/// @description Checks the implicit getter of a static or library variable is
/// late-initialized and evaluated only once.
/// @author msyabro

import "../../../Utils/expect.dart";

String log = "";

writeLog(String i) {
  log += "$i";
  return i;
}

var a = writeLog("a");
String b = writeLog("b");
final c = writeLog("c");
final String d = writeLog("d");

class C {
  static var a = writeLog("a");
  static String b = writeLog("b");
  static final c = writeLog("c");
  static final String d = writeLog("d");
}

mixin M {
  static var a = writeLog("a");
  static String b = writeLog("b");
  static final c = writeLog("c");
  static final String d = writeLog("d");
}

enum E {
  e0;
  static var a = writeLog("a");
  static String b = writeLog("b");
  static final c = writeLog("c");
  static final String d = writeLog("d");
}

class A {}

extension Ext on A {
  static var a = writeLog("a");
  static String b = writeLog("b");
  static final c = writeLog("c");
  static final String d = writeLog("d");
}

extension type ET(int _) {
  static var a = writeLog("a");
  static String b = writeLog("b");
  static final c = writeLog("c");
  static final String d = writeLog("d");
}

main() {
  Expect.equals("", log);

  Expect.equals("a", a);
  Expect.equals("a", log);
  Expect.equals("a", a);
  Expect.equals("a", log);

  Expect.equals("b", b);
  Expect.equals("ab", log);
  Expect.equals("b", b);
  Expect.equals("ab", log);

  Expect.equals("c", c);
  Expect.equals("abc", log);
  Expect.equals("c", c);
  Expect.equals("abc", log);

  Expect.equals("d", d);
  Expect.equals("abcd", log);
  Expect.equals("d", d);
  Expect.equals("abcd", log);

  log = "";
  Expect.equals("a", C.a);
  Expect.equals("a", log);
  Expect.equals("a", C.a);
  Expect.equals("a", log);

  Expect.equals("b", C.b);
  Expect.equals("ab", log);
  Expect.equals("b", C.b);
  Expect.equals("ab", log);

  Expect.equals("c", C.c);
  Expect.equals("abc", log);
  Expect.equals("c", C.c);
  Expect.equals("abc", log);

  Expect.equals("d", C.d);
  Expect.equals("abcd", log);
  Expect.equals("d", C.d);
  Expect.equals("abcd", log);

  log = "";
  Expect.equals("a", M.a);
  Expect.equals("a", log);
  Expect.equals("a", M.a);
  Expect.equals("a", log);

  Expect.equals("b", M.b);
  Expect.equals("ab", log);
  Expect.equals("b", M.b);
  Expect.equals("ab", log);

  Expect.equals("c", M.c);
  Expect.equals("abc", log);
  Expect.equals("c", M.c);
  Expect.equals("abc", log);

  Expect.equals("d", M.d);
  Expect.equals("abcd", log);
  Expect.equals("d", M.d);
  Expect.equals("abcd", log);

  log = "";
  Expect.equals("a", E.a);
  Expect.equals("a", log);
  Expect.equals("a", E.a);
  Expect.equals("a", log);

  Expect.equals("b", E.b);
  Expect.equals("ab", log);
  Expect.equals("b", E.b);
  Expect.equals("ab", log);

  Expect.equals("c", E.c);
  Expect.equals("abc", log);
  Expect.equals("c", E.c);
  Expect.equals("abc", log);

  Expect.equals("d", E.d);
  Expect.equals("abcd", log);
  Expect.equals("d", E.d);
  Expect.equals("abcd", log);

  log = "";
  Expect.equals("a", Ext.a);
  Expect.equals("a", log);
  Expect.equals("a", Ext.a);
  Expect.equals("a", log);

  Expect.equals("b", Ext.b);
  Expect.equals("ab", log);
  Expect.equals("b", Ext.b);
  Expect.equals("ab", log);

  Expect.equals("c", Ext.c);
  Expect.equals("abc", log);
  Expect.equals("c", Ext.c);
  Expect.equals("abc", log);

  Expect.equals("d", Ext.d);
  Expect.equals("abcd", log);
  Expect.equals("d", Ext.d);
  Expect.equals("abcd", log);

  log = "";
  Expect.equals("a", ET.a);
  Expect.equals("a", log);
  Expect.equals("a", ET.a);
  Expect.equals("a", log);

  Expect.equals("b", ET.b);
  Expect.equals("ab", log);
  Expect.equals("b", ET.b);
  Expect.equals("ab", log);

  Expect.equals("c", ET.c);
  Expect.equals("abc", log);
  Expect.equals("c", ET.c);
  Expect.equals("abc", log);

  Expect.equals("d", ET.d);
  Expect.equals("abcd", log);
  Expect.equals("d", ET.d);
  Expect.equals("abcd", log);
}
