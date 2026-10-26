// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of an expression `e!` is `NonNull(T)` where `T`
/// is the static type of `e`.
///
/// @description Check that the static type of an expression `e!` is `T` if the
/// static type of `e` is `T?`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';

class C {
  void foo() {}
}

class G<T> {
  void foo() {}
}

mixin M {
  void foo() {}
}

class MO = Object with M;

mixin class MC {
  void foo() {}
}

enum E {
  e0;

  void foo() {}
}

extension type ET(int _) {
  void foo() {}
}

dynamic init(dynamic x) => x;

main() {
  C? c = init(C());
  if (2 > 1) { // Prevents promotion of `c` to `C` after `c!`
    c!.expectStaticType<Exactly<C>>();
  }
  c!.foo();

  G<int>? g = init(G<int>());
  if (2 > 1) {
    g!.expectStaticType<Exactly<G<int>>>();
  }
  g!.foo();

  M? m = init(MO());
  if (2 > 1) {
    m!.expectStaticType<Exactly<M>>();
  }
  m!.foo();

  MC? mc = init(MC());
  if (2 > 1) {
    mc!.expectStaticType<Exactly<MC>>();
  }
  mc!.foo();

  E? e = init(E.e0);
  if (2 > 1) {
    e!.expectStaticType<Exactly<E>>();
  }
  e!.foo();

  ET? et = init(ET(0));
  if (2 > 1) {
    et!.expectStaticType<Exactly<ET>>();
  }
  et!.foo();

  int? i = init(42);
  if (2 > 1) {
    i!.expectStaticType<Exactly<int>>();
  }
  i!.isOdd;

  void Function()? f = init(() {});
  if (2 > 1) {
    f!.expectStaticType<Exactly<void Function()>>();
  }
  f!();

  (int, {String s})? r = init((1, s: "s"));
  if (2 > 1) {
    r!.expectStaticType<Exactly<(int, {String s})>>();
  }
  if (2 > 1) {
    r!.$1.isOdd;
  }
  r!.s.length;

  FutureOr<int>? fo = init(42);
  fo!.expectStaticType<Exactly<FutureOr<int>>>();

  Object? o = init(Object());
  o!.expectStaticType<Exactly<Object>>();

  Function? fn = init(() {});
  fn!.expectStaticType<Exactly<Function>>();

  Record? rec = init((1,));
  rec!.expectStaticType<Exactly<Record>>();

  Enum? en = init(E.e0);
  en!.expectStaticType<Exactly<Enum>>();
}
