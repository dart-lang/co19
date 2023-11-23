// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider an invocation of the extension type member m on the
/// receiver expression e according to the extension type declaration V with the
/// actual type arguments T1, ..., Ts. If the invocation includes an actual
/// argument part (possibly including some actual type arguments) then call it
/// args. If the invocation does not include an actual argument part, but it
/// does include a list of actual type arguments, call it typeArgs. Finally,
/// assume that V declares the type variables X1, ..., Xs.
///
/// Note that if the name of m is a name in the interface of Object (that is,
/// toString, ==, hashCode, runtimeType, or noSuchMethod), the denoted member is
/// necessarily a non-extension type member, which determines the static
/// analysis and dynamic semantics.
///
/// @description Checks that members of an `Object` are treated as all other
/// non-extension type members. Test dynamic behavior of `==` operator
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

String log = "";

class A {
}

class B implements A {
  @override
  bool operator ==(covariant A other) {
    log += "B.==";
    return true;
  }
}

class C {}

extension type ET1(B b) implements A {}

extension type ET2(B b) implements ET1, B {}

void main() {
  var e2 = ET2(B());
  ET1 e1 = e2;

  e2 == A();
  Expect.equals("B.==", log);
  log = "";
  e2 == B();
  Expect.equals("B.==", log);
  log = "";
  Expect.throws(() {e2 == Object();});
  Expect.throws(() {e2 == C();});

  e1 == A();
  Expect.equals("B.==", log);
  log = "";
  e1 == B();
  Expect.equals("B.==", log);
  log = "";
  Expect.throws(() {e1 == Object();});
  Expect.throws(() {e1 == C();});
}
