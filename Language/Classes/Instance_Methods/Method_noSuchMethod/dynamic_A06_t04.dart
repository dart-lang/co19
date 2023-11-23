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
/// • im.namedArguments evaluates to an unmodifiable map whose dynamic type
/// implements Map<Symbol, Object>, with the same keys and values as the map
/// resulting from evaluation of <Symbol, Object>{#x1: x1, . . . , #xm: xm}.
///
/// @description Checks that `im.namedArguments` is an unmodifiable map whose
/// dynamic type implements `Map<Symbol, Object?>`, with the same keys and
/// values as the map resulting from evaluation of
/// `<Symbol, Object?>{#x1: x1, . . . , #xm: xm}`.
/// @author sgrekhov22@gmail.com
/// @issue 53656

import "../../../../Utils/expect.dart";

late List<Object?> positional;
late Map<Symbol, Object?> named;

class C {
  Map<Symbol, Object?> m1(int i, String s1, {double? d, String s2 = "s2"});
  Map<Symbol, Object?> m2({required int n, String s2 = "s2"});
  Map<Symbol, Object?> get g;
  void set s(String s);

  dynamic noSuchMethod(Invocation i) {
    named = i.namedArguments;
    positional = i.positionalArguments;
    return i.namedArguments;
  }
}

mixin M {
  Map<Symbol, Object?> m1(int i, String s1, {double? d, String s2 = "s2"});
  Map<Symbol, Object?> m2({required int n, String s2 = "s2"});
  Map<Symbol, Object?> get g;
  void set s(String s);

  dynamic noSuchMethod(Invocation i) {
    named = i.namedArguments;
    positional = i.positionalArguments;
    return i.namedArguments;
  }
}

class MA = Object with M;

enum E {
  e1, e2;
  Map<Symbol, Object?> m1(int i, String s1, {double? d, String s2 = "s2"});
  Map<Symbol, Object?> m2({required int n, String s2 = "s2"});
  Map<Symbol, Object?> get g;
  void set s(String s);

  dynamic noSuchMethod(Invocation i) {
    named = i.namedArguments;
    positional = i.positionalArguments;
    return i.namedArguments;
  }
}

main() {
  Expect.mapEquals({#d: null, #s2: "s2"}, C().m1(1, "2"));
  Expect.throws(() {
    named[#x1] = "x";
  });
  Expect.listEquals([1, "2"], positional);
  Expect.mapEquals({#d: 3.14, #s2: "x"}, C().m1(1, "2", d: 3.14, s2: "x"));
  Expect.listEquals([1, "2"], positional);
  Expect.mapEquals({#n: 1, #s2: "s2"}, C().m2(n: 1));
  Expect.isTrue(positional.isEmpty);
  Expect.mapEquals({#n: 1, #s2: "x"}, C().m2(n: 1, s2: "x"));
  Expect.throws(() {
    named[#x1] = "x";
  });
  Expect.isTrue(positional.isEmpty);
  Expect.mapEquals({}, C().g);
  Expect.throws(() {
    named[#x1] = "x";
  });
  Expect.isTrue(positional.isEmpty);
  C().s = "Lily was here";
  Expect.isTrue(named.isEmpty);
  Expect.throws(() {
    named[#x1] = "x";
  });
  Expect.listEquals(["Lily was here"], positional);

  Expect.mapEquals({#d: null, #s2: "s2"}, MA().m1(1, "2"));
  Expect.throws(() {
    named[#x1] = "x";
  });
  Expect.listEquals([1, "2"], positional);
  Expect.mapEquals({#d: 3.14, #s2: "x"}, MA().m1(1, "2", d: 3.14, s2: "x"));
  Expect.listEquals([1, "2"], positional);
  Expect.mapEquals({#n: 1, #s2: "s2"}, MA().m2(n: 1));
  Expect.isTrue(positional.isEmpty);
  Expect.mapEquals({#n: 1, #s2: "x"}, MA().m2(n: 1, s2: "x"));
  Expect.throws(() {
    named[#x1] = "x";
  });
  Expect.isTrue(positional.isEmpty);
  Expect.mapEquals({}, MA().g);
  Expect.throws(() {
    named[#x1] = "x";
  });
  Expect.isTrue(positional.isEmpty);
  MA().s = "Lily was here";
  Expect.isTrue(named.isEmpty);
  Expect.throws(() {
    named[#x1] = "x";
  });
  Expect.listEquals(["Lily was here"], positional);

  Expect.mapEquals({#d: null, #s2: "s2"}, E.e1.m1(1, "2"));
  Expect.throws(() {
    named[#x1] = "x";
  });
  Expect.listEquals([1, "2"], positional);
  Expect.mapEquals({#d: 3.14, #s2: "x"}, E.e1.m1(1, "2", d: 3.14, s2: "x"));
  Expect.listEquals([1, "2"], positional);
  Expect.mapEquals({#n: 1, #s2: "s2"}, E.e1.m2(n: 1));
  Expect.isTrue(positional.isEmpty);
  Expect.mapEquals({#n: 1, #s2: "x"}, E.e1.m2(n: 1, s2: "x"));
  Expect.throws(() {
    named[#x1] = "x";
  });
  Expect.isTrue(positional.isEmpty);
  Expect.mapEquals({}, E.e1.g);
  Expect.throws(() {
    named[#x1] = "x";
  });
  Expect.isTrue(positional.isEmpty);
  E.e1.s = "Lily was here";
  Expect.isTrue(named.isEmpty);
  Expect.throws(() {
    named[#x1] = "x";
  });
  Expect.listEquals(["Lily was here"], positional);
}
