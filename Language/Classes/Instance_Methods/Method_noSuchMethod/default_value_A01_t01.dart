// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A noSuchMethod forwarder is a concrete member of C with the
/// signature taken from the interface of C, and with the same default value for
/// each optional parameter
///
/// @description Checks that `noSuchMethod` forwarder has the correct default
/// value for each optional parameter
/// @author sgrekhov22@gmail.com
/// @issue 53656

import "../../../../Utils/expect.dart";

String log = "";

class C {
  int m1(int v, [String s = "s1"]);
  int m2(int v, {String s = "s2"});

  dynamic noSuchMethod(Invocation inv) {
    for (int i = 0; i < inv.positionalArguments.length; i++) {
      log += "${inv.positionalArguments[i]};";
    }
    for (int i = 0; i < inv.namedArguments.length; i++) {
      log += "s=${inv.namedArguments[#s]};";
    }
    return 42;
  }
}

mixin M {
  int m1(int v, [String s = "s1"]);
  int m2(int v, {String s = "s2"});

  dynamic noSuchMethod(Invocation inv) {
    for (int i = 0; i < inv.positionalArguments.length; i++) {
      log += "${inv.positionalArguments[i]};";
    }
    for (int i = 0; i < inv.namedArguments.length; i++) {
      log += "s=${inv.namedArguments[#s]};";
    }
    return 42;
  }
}

class MA = Object with M;

enum E {
  e1, e2;
  int m1(int v, [String s = "s1"]);
  int m2(int v, {String s = "s2"});

  dynamic noSuchMethod(Invocation inv) {
    for (int i = 0; i < inv.positionalArguments.length; i++) {
      log += "${inv.positionalArguments[i]};";
    }
    for (int i = 0; i < inv.namedArguments.length; i++) {
      log += "s=${inv.namedArguments[#s]};";
    }
    return 42;
  }
}

void checkLog(String expected) {
  Expect.equals(expected, log);
  log = '';
}

main() {
  C().m1(1);
  checkLog("1;s1;");
  C().m2(2);
  checkLog("2;s=s2;");

  MA().m1(1);
  checkLog("1;s1;");
  MA().m2(2);
  checkLog("2;s=s2;");

  E.e1.m1(1);
  checkLog("1;s1;");
  E.e2.m2(2);
  checkLog("2;s=s2;");
}
