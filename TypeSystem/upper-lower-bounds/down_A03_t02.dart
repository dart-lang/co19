// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `T2`) = `T2` if TOP(`T1`)
///
/// @description Check that DOWN(`T1`, `T2`) = `T2` if TOP(`T1`) and not
/// TOP(`T2`) (which implies `T1 != T2`). Test types `Object?` and
/// `FutureOr<Object?>`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1a(void Function(Object?) v1, void Function(num) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(num)>>();
}

void f1b(void Function(FutureOr<Object?>) v1, void Function(num) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(num)>>();
}

void f2a<X extends num>(void Function(Object?) v1, void Function(X) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f2b<X extends num>(
  void Function(FutureOr<Object?>) v1,
  void Function(X) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f3a(void Function(Object?) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f3b(void Function(FutureOr<Object?>) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f4a(void Function(Object?) v1, void Function(Never) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f4b(void Function(FutureOr<Object?>) v1, void Function(Never) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f5a(void Function(Object?) v1, void Function(Function) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Function)>>();
}

void f5b(void Function(FutureOr<Object?>) v1, void Function(Function) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Function)>>();
}

void f6a(void Function(Object?) v1, void Function(Record) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Record)>>();
}

void f6b(void Function(FutureOr<Object?>) v1, void Function(Record) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Record)>>();
}

void f7a(void Function(Object?) v1, void Function(FutureOr<int>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<int>)>>();
}

void f7b(void Function(FutureOr<Object?>) v1, void Function(FutureOr<int>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<int>)>>();
}

void f8a(void Function(Object?) v1, void Function(String?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(String?)>>();
}

void f8b(void Function(FutureOr<Object?>) v1, void Function(String?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(String?)>>();
}

void f9a(void Function(Object?) v1, void Function(C) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(C)>>();
}

void f9b(void Function(FutureOr<Object?>) v1, void Function(C) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(C)>>();
}

void f10a(void Function(Object?) v1, void Function(D<int, String>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(D<int, String>)>>();
}

void f10b(
  void Function(FutureOr<Object?>) v1,
  void Function(D<int, String>) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(D<int, String>)>>();
}

void f11a(void Function(Object?) v1, void Function(FPositional) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FPositional)>>();
}

void f11b(void Function(FutureOr<Object?>) v1, void Function(FPositional) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FPositional)>>();
}

void f12a(void Function(Object?) v1, void Function(FNamed) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FNamed)>>();
}

void f12b(void Function(FutureOr<Object?>) v1, void Function(FNamed) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FNamed)>>();
}

void f13a(void Function(Object?) v1, void Function(Rec) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Rec)>>();
}

void f13b(void Function(FutureOr<Object?>) v1, void Function(Rec) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Rec)>>();
}

void f14a(void Function(Object?) v1, void Function(E) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(E)>>();
}

void f14b(void Function(FutureOr<Object?>) v1, void Function(E) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(E)>>();
}

void f15a(void Function(Object?) v1, void Function(ET) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(ET)>>();
}

void f15b(void Function(FutureOr<Object?>) v1, void Function(ET) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(ET)>>();
}

void f16a(void Function(Object?) v1, void Function(Future<dynamic>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<dynamic>)>>();
}

void f16b(
  void Function(FutureOr<Object?>) v1,
  void Function(Future<dynamic>) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<dynamic>)>>();
}

void main() {
  f1a((Object? x) {}, (num x) {});
  f1b((FutureOr<Object?> x) {}, (num x) {});
  f2a((Object? x) {}, (num x) {});
  f2b((FutureOr<Object?> x) {}, (num x) {});
  f3a((Object? x) {}, (Null x) {});
  f3b((FutureOr<Object?> x) {}, (Null x) {});
  print(f4a);
  print(f4b);
  f5a((Object? x) {}, (Function x) {});
  f5b((FutureOr<Object?> x) {}, (Function x) {});
  f6a((Object? x) {}, (Record x) {});
  f6b((FutureOr<Object?> x) {}, (Record x) {});
  f7a((Object? x) {}, (FutureOr<int> x) {});
  f7b((FutureOr<Object?> x) {}, (FutureOr<int> x) {});
  f8a((Object? x) {}, (String? x) {});
  f8b((FutureOr<Object?> x) {}, (String? x) {});
  f9a((Object? x) {}, (C x) {});
  f9b((FutureOr<Object?> x) {}, (C x) {});
  f10a((Object? x) {}, (D<int, String> x) {});
  f10b((FutureOr<Object?> x) {}, (D<int, String> x) {});
  f11a((Object? x) {}, (FPositional x) {});
  f11b((FutureOr<Object?> x) {}, (FPositional x) {});
  f12a((Object? x) {}, (FNamed x) {});
  f12b((FutureOr<Object?> x) {}, (FNamed x) {});
  f13a((Object? x) {}, (Rec x) {});
  f13b((FutureOr<Object?> x) {}, (Rec x) {});
  f14a((Object? x) {}, (E x) {});
  f14b((FutureOr<Object?> x) {}, (E x) {});
  f15a((Object? x) {}, (ET x) {});
  f15b((FutureOr<Object?> x) {}, (ET x) {});
  f16a((Object? x) {}, (Future<dynamic> x) {});
  f16b((FutureOr<Object?> x) {}, (Future<dynamic> x) {});
}
