// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of an expression `e!` is `NonNull(T)` where `T`
/// is the static type of `e`.
///
/// @description Check that the static type of an expression `e!` is `T` if the
/// static type of `e` is a non-nullable type `T`.
/// @author sgrekhov22@gmail.com

// ignore_for_file: unnecessary_non_null_assertion

import 'dart:async';
import '../../Utils/static_type_helper.dart';

class C {
  foo() {}
}

class G<T> {
  foo() {}
}

mixin M {
  foo() {}
}

class MO = Object with M;

mixin class MC {
  foo() {}
}

enum E {
  e0;

  foo() {}
}

extension type ET(int _) {
  foo() {}
}

main() {
  C c = C();
  c!.expectStaticType<Exactly<C>>();

  G<int> g = G<int>();
  g!.expectStaticType<Exactly<G<int>>>();

  M m = MO();
  m!.expectStaticType<Exactly<M>>();

  MC mc = MC();
  mc!.expectStaticType<Exactly<MC>>();

  E e = E.e0;
  e!.expectStaticType<Exactly<E>>();

  ET et = ET(0);
  et!.expectStaticType<Exactly<ET>>();

  int i = 42;
  i!.expectStaticType<Exactly<int>>();

  void Function() f = () {};
  f!.expectStaticType<Exactly<void Function()>>();

  (int, {String s}) r = (1, s: "s");
  r!.expectStaticType<Exactly<(int, {String s})>>();

  FutureOr<int> fo = 42;
  fo!.expectStaticType<Exactly<FutureOr<int>>>();

  Object o = Object();
  o!.expectStaticType<Exactly<Object>>();

  Function fn = () {};
  fn!.expectStaticType<Exactly<Function>>();

  Record rec = (1,);
  rec!.expectStaticType<Exactly<Record>>();

  Enum en = E.e0;
  en!.expectStaticType<Exactly<Enum>>();
}
