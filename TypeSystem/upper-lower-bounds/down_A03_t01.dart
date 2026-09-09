// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `T2`) = `T2` if TOP(`T1`)
///
/// @description Check that DOWN(`T1`, `T2`) = `T2` if TOP(`T1`) and not
/// TOP(`T2`) (which implies `T1 != T2`). Test `void` and `FutureOr<void>`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1a(void Function(void) v1, void Function(num) v2) {
  // DOWN(void, num) = num
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(num)>>();
}

void f1b(void Function(FutureOr<void>) v1, void Function(num) v2) {
  // DOWN(FutureOr<void>, num) = num
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(num)>>();
}

void f2a<X extends num>(void Function(void) v1, void Function(X) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f2b<X extends num>(void Function(FutureOr<void>) v1, void Function(X) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f3a(void Function(void) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f3b(void Function(FutureOr<void>) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f4a(void Function(void) v1, void Function(Never) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f4b(void Function(FutureOr<void>) v1, void Function(Never) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f5a(void Function(void) v1, void Function(Function) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Function)>>();
}

void f5b(void Function(FutureOr<void>) v1, void Function(Function) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Function)>>();
}

void f6a(void Function(void) v1, void Function(Record) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Record)>>();
}

void f6b(void Function(FutureOr<void>) v1, void Function(Record) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Record)>>();
}

void f7a(void Function(void) v1, void Function(FutureOr<int>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<int>)>>();
}

void f7b(void Function(FutureOr<void>) v1, void Function(FutureOr<int>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<int>)>>();
}

void f8a(void Function(void) v1, void Function(String?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(String?)>>();
}

void f8b(void Function(FutureOr<void>) v1, void Function(String?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(String?)>>();
}

void f9a(void Function(void) v1, void Function(C) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(C)>>();
}

void f9b(void Function(FutureOr<void>) v1, void Function(C) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(C)>>();
}

void f10a(void Function(void) v1, void Function(D<int, String>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(D<int, String>)>>();
}

void f10b(void Function(FutureOr<void>) v1, void Function(D<int, String>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(D<int, String>)>>();
}

void f11a(void Function(void) v1, void Function(FPositional) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FPositional)>>();
}

void f11b(void Function(FutureOr<void>) v1, void Function(FPositional) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FPositional)>>();
}

void f12a(void Function(void) v1, void Function(FNamed) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FNamed)>>();
}

void f12b(void Function(FutureOr<void>) v1, void Function(FNamed) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FNamed)>>();
}

void f13a(void Function(void) v1, void Function(Rec) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Rec)>>();
}

void f13b(void Function(FutureOr<void>) v1, void Function(Rec) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Rec)>>();
}

void f14a(void Function(void) v1, void Function(E) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(E)>>();
}

void f14b(void Function(FutureOr<void>) v1, void Function(E) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(E)>>();
}

void f15a(void Function(void) v1, void Function(ET) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(ET)>>();
}

void f15b(void Function(FutureOr<void>) v1, void Function(ET) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(ET)>>();
}

void main() {
  f1a((void x) {}, (num x) {});
  f1b((FutureOr<void> x) {}, (num x) {});
  f2a((void x) {}, (num x) {});
  f2b((FutureOr<void> x) {}, (num x) {});
  f3a((void x) {}, (Null x) {});
  f3b((FutureOr<void> x) {}, (Null x) {});
  print(f4a);
  print(f4b);
  f5a((void x) {}, (Function x) {});
  f5b((FutureOr<void> x) {}, (Function x) {});
  f6a((void x) {}, (Record x) {});
  f6b((FutureOr<void> x) {}, (Record x) {});
  f7a((void x) {}, (FutureOr<int> x) {});
  f7b((FutureOr<void> x) {}, (FutureOr<int> x) {});
  f8a((void x) {}, (String? x) {});
  f8b((FutureOr<void> x) {}, (String? x) {});
  f9a((void x) {}, (C x) {});
  f9b((FutureOr<void> x) {}, (C x) {});
  f10a((void x) {}, (D<int, String> x) {});
  f10b((FutureOr<void> x) {}, (D<int, String> x) {});
  f11a((void x) {}, (FPositional x) {});
  f11b((FutureOr<void> x) {}, (FPositional x) {});
  f12a((void x) {}, (FNamed x) {});
  f12b((FutureOr<void> x) {}, (FNamed x) {});
  f13a((void x) {}, (Rec x) {});
  f13b((FutureOr<void> x) {}, (Rec x) {});
  f14a((void x) {}, (E x) {});
  f14b((FutureOr<void> x) {}, (E x) {});
  f15a((void x) {}, (ET x) {});
  f15b((FutureOr<void> x) {}, (ET x) {});
}
