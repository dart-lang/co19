// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Every invocation and tearoff of a constructor defined in an
/// extension has a corresponding fully resolved form with all type arguments
/// (if any) fully determined as described in the static semantics above. The
/// dynamic semantics of invocations and tearoffs which are not originally
/// provided in fully resolved form are entirely defined by the dynamic
/// semantics of the corresponding fully resolved form.
///
/// @description Checks that an invocation of a constructor declared in an
/// extension, which is not in the fully resolved form, is evaluated as the
/// corresponding fully resolved invocation. Test that arguments are evaluated
/// once in the order they are specified, then the body of the constructor is
/// executed with the type arguments of the fully resolved invocation and
/// default values of the parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';

String log = "";

T arg<T>(T v, String name) {
  log += "$name;";
  return v;
}

class C<X, Y> {
  final Type t;
  C._(this.t);
}

mixin M<X, Y> {
  Type get t;
}

class MO<X, Y> with M<X, Y> {
  final Type t;
  MO._(this.t);
}

mixin class MC<X, Y> {
  Type t = Null;
  MC._();
}

extension type ET<X, Y>._(Type t) {}

extension ExtC<T> on C<T, T> {
  factory fromList(List<T> _, {int y = 0}) {
    log += "fromList($y);";
    return C<T, T>._(T);
  }
  factory(List<T> _, [int y = 0]) {
    log += "new($y);";
    return C<T, T>._(T);
  }
}

extension ExtM<T> on M<T, T> {
  factory fromList(List<T> _, {int y = 0}) {
    log += "fromList($y);";
    return MO<T, T>._(T);
  }
  factory(List<T> _, [int y = 0]) {
    log += "new($y);";
    return MO<T, T>._(T);
  }
}

extension ExtMC<T> on MC<T, T> {
  factory fromList(List<T> _, {int y = 0}) {
    log += "fromList($y);";
    return MC<T, T>._()..t = T;
  }
  factory(List<T> _, [int y = 0]) {
    log += "new($y);";
    return MC<T, T>._()..t = T;
  }
}

extension ExtET<T> on ET<T, T> {
  factory fromList(List<T> _, {int y = 0}) {
    log += "fromList($y);";
    return ET<T, T>._(T);
  }
  factory(List<T> _, [int y = 0]) {
    log += "new($y);";
    return ET<T, T>._(T);
  }
}

main() {
  log = "";
  var c1 = C.fromList(arg([1], "a"), y: arg(2, "b"));
  Expect.equals("a;b;fromList(2);", log);
  Expect.equals(int, c1.t);
  log = "";
  C<num, num> c2 = C(arg([1], "a"), arg(2, "b"));
  Expect.equals("a;b;new(2);", log);
  Expect.equals(num, c2.t);
  log = "";
  var c3 = C<num, int>.fromList(arg([1], "a"));
  Expect.equals("a;fromList(0);", log);
  Expect.equals(int, c3.t);
  log = "";
  var c4 = C<Object, num>.new(arg([1], "a"));
  Expect.equals("a;new(0);", log);
  Expect.equals(num, c4.t);

  log = "";
  var m1 = M.fromList(arg([1], "a"), y: arg(2, "b"));
  Expect.equals("a;b;fromList(2);", log);
  Expect.equals(int, m1.t);
  log = "";
  M<num, num> m2 = M(arg([1], "a"), arg(2, "b"));
  Expect.equals("a;b;new(2);", log);
  Expect.equals(num, m2.t);
  log = "";
  var m3 = M<num, int>.fromList(arg([1], "a"));
  Expect.equals("a;fromList(0);", log);
  Expect.equals(int, m3.t);
  log = "";
  var m4 = M<Object, num>.new(arg([1], "a"));
  Expect.equals("a;new(0);", log);
  Expect.equals(num, m4.t);

  log = "";
  var mc1 = MC.fromList(arg([1], "a"), y: arg(2, "b"));
  Expect.equals("a;b;fromList(2);", log);
  Expect.equals(int, mc1.t);
  log = "";
  MC<num, num> mc2 = MC(arg([1], "a"), arg(2, "b"));
  Expect.equals("a;b;new(2);", log);
  Expect.equals(num, mc2.t);
  log = "";
  var mc3 = MC<num, int>.fromList(arg([1], "a"));
  Expect.equals("a;fromList(0);", log);
  Expect.equals(int, mc3.t);
  log = "";
  var mc4 = MC<Object, num>.new(arg([1], "a"));
  Expect.equals("a;new(0);", log);
  Expect.equals(num, mc4.t);

  log = "";
  var et1 = ET.fromList(arg([1], "a"), y: arg(2, "b"));
  Expect.equals("a;b;fromList(2);", log);
  Expect.equals(int, et1.t);
  log = "";
  ET<num, num> et2 = ET(arg([1], "a"), arg(2, "b"));
  Expect.equals("a;b;new(2);", log);
  Expect.equals(num, et2.t);
  log = "";
  var et3 = ET<num, int>.fromList(arg([1], "a"));
  Expect.equals("a;fromList(0);", log);
  Expect.equals(int, et3.t);
  log = "";
  var et4 = ET<Object, num>.new(arg([1], "a"));
  Expect.equals("a;new(0);", log);
  Expect.equals(num, et4.t);
}
