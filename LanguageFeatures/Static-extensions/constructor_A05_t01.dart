// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If an extension declaration is generic, the type parameters
/// declared by the extension are in scope in any constructors declared in the
/// extension (just as with a constructor declared in a generic class).
///
/// @description Checks that the type parameters declared by an extension are in
/// scope in a non-redirecting factory constructor declared in the extension.
/// Test that they can be used in the formal parameter list and in the body of
/// the constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

class C<T> {
  final Type t;
  final List<T> l;
  C(this.t, this.l);
}

extension ExtC<T> on C<T> {
  factory foo(T v) {
    List<T> l = <T>[v];
    return C<T>(T, l);
  }
}

mixin M<T> {
  Type t = Never;
  List<T> l = <T>[];
}

class MO<T> = Object with M<T>;

extension ExtM<T> on M<T> {
  factory foo(T v) {
    List<T> l = <T>[v];
    return MO<T>()
      ..t = T
      ..l = l;
  }
}

mixin class MC<T> {
  Type t = Never;
  List<T> l = <T>[];
}

extension ExtMC<T> on MC<T> {
  factory foo(T v) {
    List<T> l = <T>[v];
    return MC<T>()
      ..t = T
      ..l = l;
  }
}

extension type ET<T>((Type, List<T>) r) {
  Type get t => r.$1;
  List<T> get l => r.$2;
}

extension ExtET<T> on ET<T> {
  factory foo(T v) {
    List<T> l = <T>[v];
    return ET<T>((T, l));
  }
}

enum E<T> {
  e0<int>(int, [1]),
  e1<String>(String, ["a"]);

  final Type t;
  final List<T> l;
  E(this.t, this.l);
}

extension ExtE<T> on E<T> {
  factory foo(T v) {
    for (var e in E.values) {
      if (e.t == T && e.l.first == v) {
        return e as E<T>;
      }
    }
    throw "No value found";
  }
}

main() {
  var c = C<int>.foo(1);
  c.expectStaticType<Exactly<C<int>>>();
  Expect.equals(int, c.t);
  Expect.listEquals([1], c.l);

  var m = M<int>.foo(2);
  m.expectStaticType<Exactly<M<int>>>();
  Expect.isTrue(m is MO<int>);
  Expect.equals(int, m.t);
  Expect.listEquals([2], m.l);

  var mc = MC<int>.foo(3);
  mc.expectStaticType<Exactly<MC<int>>>();
  Expect.equals(int, mc.t);
  Expect.listEquals([3], mc.l);

  var et = ET<int>.foo(4);
  et.expectStaticType<Exactly<ET<int>>>();
  Expect.equals(int, et.t);
  Expect.listEquals([4], et.l);

  var e = E<String>.foo("a");
  e.expectStaticType<Exactly<E<String>>>();
  Expect.equals(E.e1, e);
}
