// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Type parameters are declared in the type parameter scope of a
/// class or function. The type parameters of a generic G are in scope in the
/// bounds of all of the type parameters of G. The type parameters of a generic
/// class declaration G are also in scope in the extends and implements clauses
/// of G (if these exist) and in the body of G.
///
/// @description Checks that type parameters with the same names have correct
/// scopes
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";


class C1<T> {
  void m1<T>() {
    Expect.equals(String, typeOf<T>());
    T? t;
    Expect.isTrue(t is String?);
  }

  Type m2<T>() => T;

  T m3<T>(T t) => t;

  void test() {
    Expect.equals(int, typeOf<T>());
  }
}

class C2<T extends num> {
  void m1<T extends String>() {
    Expect.equals(String, typeOf<T>());
    T? t;
    Expect.isTrue(t is String?);
  }

  Type m2<T extends String>() => T;

  T m3<T extends String>(T t) => t;

  void test() {
    Expect.equals(int, typeOf<T>());
  }
}

main() {
  C1<int> c1 = C1<int>();
  c1.m1<String>();
  Expect.equals(List<num>, c1.m2<List<num>>());
  dynamic d = true;
  Expect.isTrue(c1.m3<bool>(d) is bool);
  c1.test();

  C2<int> c2 = C2<int>();
  c2.m1<String>();
  Expect.equals(String, c2.m2<String>());
  dynamic d2 = "";
  Expect.isTrue(c2.m3<String>(d2) is String);
  c2.test();
}
