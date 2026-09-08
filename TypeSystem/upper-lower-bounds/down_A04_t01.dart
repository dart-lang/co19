// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `T2`) = `T1` if TOP(`T2`)
///
/// @description Check that DOWN(`T1`, `T2`) = `T1` if TOP(`T2`) and not
/// TOP(`T1`) (which implies `T1 != T2`). Test `void` and `FutureOr<void>`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1a(void Function(num) v1, void Function(void) v2) {
  // DOWN(num, void) = num
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(num)>>();
}

void f1b(void Function(num) v1, void Function(FutureOr<void>) v2) {
  // DOWN(num, FutureOr<void>) = num
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(num)>>();
}

void f2a<X extends num>(void Function(X) v1, void Function(void) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f2b<X extends num>(void Function(X) v1, void Function(FutureOr<void>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f3a(void Function(Null) v1, void Function(void) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f3b(void Function(Null) v1, void Function(FutureOr<void>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f4a(void Function(Never) v1, void Function(void) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f4b(void Function(Never) v1, void Function(FutureOr<void>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f5a(void Function(Function) v1, void Function(void) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Function)>>();
}

void f5b(void Function(Function) v1, void Function(FutureOr<void>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Function)>>();
}

void f6a(void Function(Record) v1, void Function(void) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Record)>>();
}

void f6b(void Function(Record) v1, void Function(FutureOr<void>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Record)>>();
}

void f7a(void Function(FutureOr<int>) v1, void Function(void) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<int>)>>();
}

void f7b(void Function(FutureOr<int>) v1, void Function(FutureOr<void>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<int>)>>();
}

void f8a(void Function(String?) v1, void Function(void) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(String?)>>();
}

void f8b(void Function(String?) v1, void Function(FutureOr<void>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(String?)>>();
}

void f9a(void Function(C) v1, void Function(void) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(C)>>();
}

void f9b(void Function(C) v1, void Function(FutureOr<void>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(C)>>();
}

void f10a(void Function(D<int, String>) v1, void Function(void) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(D<int, String>)>>();
}

void f10b(void Function(D<int, String>) v1, void Function(FutureOr<void>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(D<int, String>)>>();
}

void f11a(void Function(FPositional) v1, void Function(void) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FPositional)>>();
}

void f11b(void Function(FPositional) v1, void Function(FutureOr<void>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FPositional)>>();
}

void f12a(void Function(FNamed) v1, void Function(void) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FNamed)>>();
}

void f12b(void Function(FNamed) v1, void Function(FutureOr<void>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FNamed)>>();
}

void f13a(void Function(Rec) v1, void Function(void) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Rec)>>();
}

void f13b(void Function(Rec) v1, void Function(FutureOr<void>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Rec)>>();
}

void f14a(void Function(E) v1, void Function(void) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(E)>>();
}

void f14b(void Function(E) v1, void Function(FutureOr<void>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(E)>>();
}

void f15a(void Function(ET) v1, void Function(void) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(ET)>>();
}

void f15b(void Function(ET) v1, void Function(FutureOr<void>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(ET)>>();
}

void main() {
  f1a((num x) {}, (void x) {});
  f1b((num x) {}, (FutureOr<void> x) {});
  f2a((num x) {}, (void x) {});
  f2b((num x) {}, (FutureOr<void> x) {});
  f3a((Null x) {}, (void x) {});
  f3b((Null x) {}, (FutureOr<void> x) {});
  print(f4a);
  print(f4b);
  f5a((Function x) {}, (void x) {});
  f5b((Function x) {}, (FutureOr<void> x) {});
  f6a((Record x) {}, (void x) {});
  f6b((Record x) {}, (FutureOr<void> x) {});
  f7a((FutureOr<int> x) {}, (void x) {});
  f7b((FutureOr<int> x) {}, (FutureOr<void> x) {});
  f8a((String? x) {}, (void x) {});
  f8b((String? x) {}, (FutureOr<void> x) {});
  f9a((C x) {}, (void x) {});
  f9b((C x) {}, (FutureOr<void> x) {});
  f10a((D<int, String> x) {}, (void x) {});
  f10b((D<int, String> x) {}, (FutureOr<void> x) {});
  f11a((FPositional x) {}, (void x) {});
  f11b((FPositional x) {}, (FutureOr<void> x) {});
  f12a((FNamed x) {}, (void x) {});
  f12b((FNamed x) {}, (FutureOr<void> x) {});
  f13a((Rec x) {}, (void x) {});
  f13b((Rec x) {}, (FutureOr<void> x) {});
  f14a((E x) {}, (void x) {});
  f14b((E x) {}, (FutureOr<void> x) {});
  f15a((ET x) {}, (void x) {});
  f15b((ET x) {}, (FutureOr<void> x) {});
}
