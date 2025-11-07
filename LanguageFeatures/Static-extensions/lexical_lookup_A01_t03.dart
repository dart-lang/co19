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
/// static member of the enclosing extension. Test a static method invocation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';

class C {
  static String foo() => "C";

  void test() {
    Expect.equals("C", foo());
  }
}

mixin M {
  static String foo() => "M";

  void test() {
    Expect.equals("M", foo());
  }
}

extension type ET(int _) {
  static String foo() => "ET";

  void test() {
    Expect.equals("ET", foo());
  }
}

enum E {
  e0;
  static String foo() => "E";

  void test() {
    Expect.equals("E", foo());
  }
}

extension ExtC on C {
  static String foo() => "ExtC";

  void testExtension() {
    Expect.equals("ExtC", foo());
  }
}

extension ExtM on M {
  static String foo() => "ExtM";

  void testExtension() {
    Expect.equals("ExtM", foo());
  }
}

extension ExtET on ET {
  static String foo() => "ExtET";

  void testExtension() {
    Expect.equals("ExtET", foo());
  }
}

extension ExtE on E {
  static String foo() => "ExtE";

  void testExtension() {
    Expect.equals("ExtE", foo());
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
