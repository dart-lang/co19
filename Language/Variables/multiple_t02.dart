// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An ⟨initializedVariableDeclaration⟩ that declares two or more
/// variables is equivalent to multiple variable declarations declaring the same
/// set of variable names, in the same order, with the same initialization,
/// type, and modifiers
///
/// @description Checks that two or more variables is equivalent to multiple
/// variable declarations declaring the same set of variable names, in the same
/// order, with the same initialization, type, and modifiers. Test late
/// variables.
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

class Log {
  static String log = "";
  static void clearLog() {
    log = "";
  }

  int val;
  Log(this.val) {
    log += "$val;";
  }
}

late var v1 = Log(1), v2 = Log(2);
late final Log v3 = Log(3), v4 = v3;

class C {
  static late var v5 = Log(5), v6 = Log(6);
  static late final Log v7 = Log(7), v8 = v7;

  late var v9 = Log(9), v10 = Log(10);
  late final Log v11 = Log(11), v12 = v11;
}

main() {
  late var v13 = Log(13), v14 = Log(14);
  late final Log v15 = Log(15), v16 = v15;

  Expect.equals("", Log.log);
  print(v1);
  Expect.equals("1;", Log.log);
  print(v2);
  Expect.equals("1;2;", Log.log);
  print(v4);
  Expect.equals("1;2;3;", Log.log);

  Log.clearLog();
  print(C.v5);
  Expect.equals("5;", Log.log);
  print(C.v6);
  Expect.equals("5;6;", Log.log);
  print(C.v8);
  Expect.equals("5;6;7;", Log.log);

  Log.clearLog();
  C c = C();
  print(c.v9);
  Expect.equals("9;", Log.log);
  print(c.v10);
  Expect.equals("9;10;", Log.log);
  print(c.v12);
  Expect.equals("9;10;11;", Log.log);

  Log.clearLog();
  print(v13);
  Expect.equals("13;", Log.log);
  print(v14);
  Expect.equals("13;14;", Log.log);
  print(v16);
  Expect.equals("13;14;15;", Log.log);
}
