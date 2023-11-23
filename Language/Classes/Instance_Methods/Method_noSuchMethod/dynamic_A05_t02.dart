// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For the dynamic semantics, assume that a class C has an
/// implicitly induced noSuchMethod forwarder named m, with formal type
/// parameters X1, . . . , Xr, positional formal parameters a1, . . . , ak (some
/// of which may be optional when n = 0), and named formal parameters with names
/// x1, . . . , xn
///
/// The execution of the body of m creates an instance im of the predefined im
/// class Invocation such that:
/// ...
/// • im.positionalArguments evaluates to an unmodifiable list whose dynamic
/// type implements List<Object>, containing the same objects as the list
/// resulting from evaluation of <Object>[a1, . . . , ak].
///
/// @description Checks that `im.positionalArguments` is an unmodifiable list
/// whose dynamic type implements `List<Object?>`, containing the same objects
/// as the list resulting from evaluation of <Object?>[a1, . . . , ak]
/// @author sgrekhov22@gmail.com

import "../../../../Utils/expect.dart";

late List<Object?> log;

abstract mixin class A {
  List<Object?> m(int i, String s1, [double? d, String s2 = "s2"]);
  List<Object?> get g;
  void set s(String s);
}

class C1 extends A {
  dynamic noSuchMethod(Invocation i) {
    log = i.positionalArguments;
    Expect.isTrue(i.namedArguments.isEmpty);
    return i.positionalArguments;
  }
}

class C2 with A {
  dynamic noSuchMethod(Invocation i) {
    log = i.positionalArguments;
    Expect.isTrue(i.namedArguments.isEmpty);
    return i.positionalArguments;
  }
}

mixin M on A {
  dynamic noSuchMethod(Invocation i) {
    log = i.positionalArguments;
    Expect.isTrue(i.namedArguments.isEmpty);
    return i.positionalArguments;
  }
}

class MA = A with M;

enum E with A {
  e1, e2;
  dynamic noSuchMethod(Invocation i) {
    log = i.positionalArguments;
    Expect.isTrue(i.namedArguments.isEmpty);
    return i.positionalArguments;
  }
}

main() {
  Expect.listEquals([1, "2", null, "s2"], C1().m(1, "2"));
  Expect.throws(() {
    log.add(1);
  });
  Expect.listEquals([1, "2", 3.14, "x"], C1().m(1, "2", 3.14, "x"));
  Expect.throws(() {
    log.add(1);
  });
  Expect.listEquals([], C1().g);
  Expect.throws(() {
    log.add(1);
  });
  C1().s = "Lily was here";
  Expect.listEquals(["Lily was here"], log);
  Expect.throws(() {
    log.add(1);
  });

  Expect.listEquals([1, "2", null, "s2"], C2().m(1, "2"));
  Expect.listEquals([1, "2", 3.14, "x"], C2().m(1, "2", 3.14, "x"));
  Expect.listEquals([], C2().g);
  C2().s = "Lily was here";
  Expect.listEquals(["Lily was here"], log);

  Expect.listEquals([1, "2", null, "s2"], MA().m(1, "2"));
  Expect.throws(() {
    log.add(1);
  });
  Expect.listEquals([1, "2", 3.14, "x"], MA().m(1, "2", 3.14, "x"));
  Expect.throws(() {
    log.add(1);
  });
  Expect.listEquals([], MA().g);
  Expect.throws(() {
    log.add(1);
  });
  MA().s = "Lily was here";
  Expect.listEquals(["Lily was here"], log);
  Expect.throws(() {
    log.add(1);
  });

  Expect.listEquals([1, "2", null, "s2"], E.e1.m(1, "2"));
  Expect.throws(() {
    log.add(1);
  });
  Expect.listEquals([1, "2", 3.14, "x"], E.e2.m(1, "2", 3.14, "x"));
  Expect.throws(() {
    log.add(1);
  });
  Expect.listEquals([], E.e2.g);
  Expect.throws(() {
    log.add(1);
  });
  E.e1.s = "Lily was here";
  Expect.listEquals(["Lily was here"], log);
  Expect.throws(() {
    log.add(1);
  });
}
