// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In addition to the member invocations specified above, it is also
/// possible to invoke a static member of the enclosing declaration based on
/// lexical lookup. This case is applicable when an expression in an extension
/// declaration resolves to an invocation of a static member of the enclosing
/// extension.
///
/// @description Checks that a static member of an extension can be invoked if
/// an expression in an extension declaration resolves to an invocation of a
/// static member of the enclosing extension. Test a static setter invocation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';

String log = "";

class C {
  static void set foo(String v) {
    log = "C:$v";
  }

  void test() {
    foo = "a";
    Expect.equals("C:a", log);
  }
}

mixin M {
  static void set foo(String v) {
    log = "M:$v";
  }

  void test() {
    foo = "b";
    Expect.equals("M:b", log);
  }
}

extension type ET(int _) {
  static void set foo(String v) {
    log = "ET:$v";
  }

  void test() {
    foo = "c";
    Expect.equals("ET:c", log);
  }
}

enum E {
  e0;
  static void set foo(String v) {
    log = "E:$v";
  }

  void test() {
    foo = "d";
    Expect.equals("E:d", log);
  }
}

extension ExtC on C {
  static void set foo(String v) {
    log = "ExtC:$v";
  }

  void testExtension() {
    foo = "a";
    Expect.equals("ExtC:a", log);
  }
}

extension ExtM on M {
  static void set foo(String v) {
    log = "ExtM:$v";
  }

  void testExtension() {
    foo = "b";
    Expect.equals("ExtM:b", log);
  }
}

extension ExtET on ET {
  static void set foo(String v) {
    log = "ExtET:$v";
  }

  void testExtension() {
    foo = "c";
    Expect.equals("ExtET:c", log);
  }
}

extension ExtE on E {
  static void set foo(String v) {
    log = "ExtE:$v";
  }

  void testExtension() {
    foo = "d";
    Expect.equals("ExtE:d", log);
  }
}

class MA = Object with M;

main() {
  C().test();
  MA().test();
  ET(0).test();
  E.e0.test();

  C().testExtension();
  MA().testExtension();
  ET(0).testExtension();
  E.e0.testExtension();
}
