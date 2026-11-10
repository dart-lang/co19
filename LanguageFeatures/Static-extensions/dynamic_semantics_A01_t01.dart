// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The dynamic semantics of static members of an extension is the
/// same as the dynamic semantics of other static functions.
///
/// @description Checks that static members declared in an extension and
/// accessed via the extension or via its on-declaration behave as other static
/// members. Test that static variables are initialized lazily and only once,
/// test getters, setters, default values of parameters, tearoffs and dynamic
/// invocations.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';

class C {}

mixin M {}

mixin class MC {}

enum E {
  e0;
}

extension type ET(int _) {}

extension ExtC on C {
  static String log = "";
  static int counter = 0;
  static final int lazy = init();
  static int init() {
    log += "init;";
    return 42;
  }
  static int get getter => counter;
  static set setter(int v) {
    counter = v;
  }
  static String method(int a, [int b = 2, int c = 3]) => "$a$b$c";
  static String named({int a = 1, required int b}) => "$a$b";
}


extension ExtM on M {
  static String log = "";
  static int counter = 0;
  static final int lazy = init();
  static int init() {
    log += "init;";
    return 42;
  }
  static int get getter => counter;
  static set setter(int v) {
    counter = v;
  }
  static String method(int a, [int b = 2, int c = 3]) => "$a$b$c";
  static String named({int a = 1, required int b}) => "$a$b";
}


extension ExtMC on MC {
  static String log = "";
  static int counter = 0;
  static final int lazy = init();
  static int init() {
    log += "init;";
    return 42;
  }
  static int get getter => counter;
  static set setter(int v) {
    counter = v;
  }
  static String method(int a, [int b = 2, int c = 3]) => "$a$b$c";
  static String named({int a = 1, required int b}) => "$a$b";
}


extension ExtE on E {
  static String log = "";
  static int counter = 0;
  static final int lazy = init();
  static int init() {
    log += "init;";
    return 42;
  }
  static int get getter => counter;
  static set setter(int v) {
    counter = v;
  }
  static String method(int a, [int b = 2, int c = 3]) => "$a$b$c";
  static String named({int a = 1, required int b}) => "$a$b";
}


extension ExtET on ET {
  static String log = "";
  static int counter = 0;
  static final int lazy = init();
  static int init() {
    log += "init;";
    return 42;
  }
  static int get getter => counter;
  static set setter(int v) {
    counter = v;
  }
  static String method(int a, [int b = 2, int c = 3]) => "$a$b$c";
  static String named({int a = 1, required int b}) => "$a$b";
}

main() {
  Expect.equals("", ExtC.log);
  Expect.equals(42, C.lazy);
  Expect.equals("init;", ExtC.log);
  Expect.equals(42, ExtC.lazy);
  Expect.equals("init;", C.log);
  C.setter = 1;
  Expect.equals(1, ExtC.getter);
  ExtC.setter = 2;
  Expect.equals(2, C.getter);
  Expect.equals(2, C.counter);
  C.counter++;
  Expect.equals(3, ExtC.counter);
  Expect.equals("123", C.method(1));
  Expect.equals("143", ExtC.method(1, 4));
  Expect.equals("12", C.named(b: 2));
  Expect.equals("32", ExtC.named(a: 3, b: 2));
  Expect.identical(ExtC.method, C.method);
  Expect.equals("156", (C.method as dynamic)(1, 5, 6));
  Expect.throws(() => (C.method as dynamic)("1"));
  Expect.throws(() => (ExtC.named as dynamic)(a: 1));

  Expect.equals("", ExtM.log);
  Expect.equals(42, M.lazy);
  Expect.equals("init;", ExtM.log);
  Expect.equals(42, ExtM.lazy);
  Expect.equals("init;", M.log);
  M.setter = 1;
  Expect.equals(1, ExtM.getter);
  ExtM.setter = 2;
  Expect.equals(2, M.getter);
  Expect.equals(2, M.counter);
  M.counter++;
  Expect.equals(3, ExtM.counter);
  Expect.equals("123", M.method(1));
  Expect.equals("143", ExtM.method(1, 4));
  Expect.equals("12", M.named(b: 2));
  Expect.equals("32", ExtM.named(a: 3, b: 2));
  Expect.identical(ExtM.method, M.method);
  Expect.equals("156", (M.method as dynamic)(1, 5, 6));
  Expect.throws(() => (M.method as dynamic)("1"));
  Expect.throws(() => (ExtM.named as dynamic)(a: 1));

  Expect.equals("", ExtMC.log);
  Expect.equals(42, MC.lazy);
  Expect.equals("init;", ExtMC.log);
  Expect.equals(42, ExtMC.lazy);
  Expect.equals("init;", MC.log);
  MC.setter = 1;
  Expect.equals(1, ExtMC.getter);
  ExtMC.setter = 2;
  Expect.equals(2, MC.getter);
  Expect.equals(2, MC.counter);
  MC.counter++;
  Expect.equals(3, ExtMC.counter);
  Expect.equals("123", MC.method(1));
  Expect.equals("143", ExtMC.method(1, 4));
  Expect.equals("12", MC.named(b: 2));
  Expect.equals("32", ExtMC.named(a: 3, b: 2));
  Expect.identical(ExtMC.method, MC.method);
  Expect.equals("156", (MC.method as dynamic)(1, 5, 6));
  Expect.throws(() => (MC.method as dynamic)("1"));
  Expect.throws(() => (ExtMC.named as dynamic)(a: 1));

  Expect.equals("", ExtE.log);
  Expect.equals(42, E.lazy);
  Expect.equals("init;", ExtE.log);
  Expect.equals(42, ExtE.lazy);
  Expect.equals("init;", E.log);
  E.setter = 1;
  Expect.equals(1, ExtE.getter);
  ExtE.setter = 2;
  Expect.equals(2, E.getter);
  Expect.equals(2, E.counter);
  E.counter++;
  Expect.equals(3, ExtE.counter);
  Expect.equals("123", E.method(1));
  Expect.equals("143", ExtE.method(1, 4));
  Expect.equals("12", E.named(b: 2));
  Expect.equals("32", ExtE.named(a: 3, b: 2));
  Expect.identical(ExtE.method, E.method);
  Expect.equals("156", (E.method as dynamic)(1, 5, 6));
  Expect.throws(() => (E.method as dynamic)("1"));
  Expect.throws(() => (ExtE.named as dynamic)(a: 1));

  Expect.equals("", ExtET.log);
  Expect.equals(42, ET.lazy);
  Expect.equals("init;", ExtET.log);
  Expect.equals(42, ExtET.lazy);
  Expect.equals("init;", ET.log);
  ET.setter = 1;
  Expect.equals(1, ExtET.getter);
  ExtET.setter = 2;
  Expect.equals(2, ET.getter);
  Expect.equals(2, ET.counter);
  ET.counter++;
  Expect.equals(3, ExtET.counter);
  Expect.equals("123", ET.method(1));
  Expect.equals("143", ExtET.method(1, 4));
  Expect.equals("12", ET.named(b: 2));
  Expect.equals("32", ExtET.named(a: 3, b: 2));
  Expect.identical(ExtET.method, ET.method);
  Expect.equals("156", (ET.method as dynamic)(1, 5, 6));
  Expect.throws(() => (ET.method as dynamic)("1"));
  Expect.throws(() => (ExtET.named as dynamic)(a: 1));
}
