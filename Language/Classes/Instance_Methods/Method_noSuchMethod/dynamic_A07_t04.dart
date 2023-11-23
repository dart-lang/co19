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
/// • im.typeArguments evaluates to an unmodifiable list whose dynamic type
/// implements List<Type>, containing the same objects as the list resulting
/// from evaluation of <Type>[X1, . . . , Xr].
///
/// @description Checks that `im.typeArguments` is an unmodifiable list whose
/// dynamic type implements `List<Type>`, containing the same objects as the
/// list resulting from evaluation of `<Type>[X1, . . . , Xr]`.
/// @author sgrekhov22@gmail.com

import "../../../../Utils/expect.dart";

late List<Type> log;

class C {
  List<Type> m1<T1, T2 extends num>();
  List<Type> m2();
  List<Type> get g;
  void set s(String s);

  dynamic noSuchMethod(Invocation i) {
    log = i.typeArguments;;
    return i.typeArguments;
  }
}

mixin M {
  List<Type> m1<T1, T2 extends num>();
  List<Type> m2();
  List<Type> get g;
  void set s(String s);

  dynamic noSuchMethod(Invocation i) {
    log = i.typeArguments;;
    return i.typeArguments;
  }
}

class MA = Object with M;

enum E {
  e1, e2;
  List<Type> m1<T1, T2 extends num>();
  List<Type> m2();
  List<Type> get g;
  void set s(String s);

  dynamic noSuchMethod(Invocation i) {
    log = i.typeArguments;;
    return i.typeArguments;
  }
}

main() {
  Expect.listEquals([dynamic, num], C().m1());
  Expect.throws(() {
    log.add(bool);
  });
  Expect.listEquals([String, int], C().m1<String, int>());
  Expect.throws(() {
    log.add(bool);
  });
  Expect.listEquals([], C().g);
  Expect.throws(() {
    log.add(bool);
  });
  C().s = "Lily was here";
  Expect.isTrue(log.isEmpty);
  Expect.throws(() {
    log.add(bool);
  });

  Expect.listEquals([dynamic, num], MA().m1());
  Expect.throws(() {
    log.add(bool);
  });
  Expect.listEquals([String, int], MA().m1<String, int>());
  Expect.throws(() {
    log.add(bool);
  });
  Expect.listEquals([], MA().g);
  Expect.throws(() {
    log.add(bool);
  });
  MA().s = "Lily was here";
  Expect.isTrue(log.isEmpty);
  Expect.throws(() {
    log.add(bool);
  });

  Expect.listEquals([dynamic, num], E.e1.m1());
  Expect.throws(() {
    log.add(bool);
  });
  Expect.listEquals([String, int], E.e1.m1<String, int>());
  Expect.throws(() {
    log.add(bool);
  });
  Expect.listEquals([], E.e1.g);
  Expect.throws(() {
    log.add(bool);
  });
  E.e1.s = "Lily was here";
  Expect.isTrue(log.isEmpty);
  Expect.throws(() {
    log.add(bool);
  });
}
