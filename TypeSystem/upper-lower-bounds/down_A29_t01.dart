// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `T2`) = `Never` otherwise
///
/// @description Check that DOWN(`T1`, `T2`) = `Never` if no earlier rule
/// applies. Test class types that are not TOP, OBJECT, NULL, BOTTOM, of the
/// form `T?`, function types, record types, or `FutureOr`, and that are not
/// subtypes of each other.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

mixin class A {}
class C1 implements A {}
class C2 implements A {}

void f1(void Function(int) v1, void Function(String) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f2(void Function(String) v1, void Function(int) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f3(void Function(int) v1, void Function(double) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f4(void Function(bool) v1, void Function(num) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f5(void Function(C) v1, void Function(E) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f6(void Function(ET) v1, void Function(String) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f7(void Function(E) v1, void Function(E2) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f8(void Function(List<int>) v1, void Function(List<String>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f9(void Function(List<int>) v1, void Function(Set<int>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f10(void Function(Map<String, int>) v1, void Function(List<int>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f11(void Function(Future<int>) v1, void Function(int) v2) {
  // `Future<int>` is not `FutureOr`, so the FutureOr cases do not apply.
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f12(void Function(int) v1, void Function(Future<int>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f13(void Function(Future<int>) v1, void Function(Future<String>) v2) {
  // Neither `Future<int> <: Future<String>` nor the reverse.
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f14(void Function(List<int?>) v1, void Function(List<num>) v2) {
  // Neither `List<int?> <: List<num>` nor the reverse.
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f15(void Function(Iterable<int>) v1, void Function(List<String>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f16(void Function(C1) v1, void Function(C2) v2) {
  // UP(C1, C2) is A, but DOWN has no corresponding interface-GLB rule.
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f17(void Function(Stream<int>) v1, void Function(Future<int>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f18(void Function(ET) v1, void Function(int) v2) {
  // `ET` does not implement `int`.
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void main() {
  f1((x) {}, (x) {});
  f2((x) {}, (x) {});
  f3((x) {}, (x) {});
  f4((x) {}, (x) {});
  f5((x) {}, (x) {});
  f6((x) {}, (x) {});
  f7((x) {}, (x) {});
  f8((x) {}, (x) {});
  f9((x) {}, (x) {});
  f10((x) {}, (x) {});
  f11((x) {}, (x) {});
  f12((x) {}, (x) {});
  f13((x) {}, (x) {});
  f14((x) {}, (x) {});
  f15((x) {}, (x) {});
  f16((x) {}, (x) {});
  f17((x) {}, (x) {});
  f18((x) {}, (x) {});
}
