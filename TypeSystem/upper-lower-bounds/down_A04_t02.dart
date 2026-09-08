// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `T2`) = `T1` if TOP(`T2`)
///
/// @description Check that DOWN(`T1`, `T2`) = `T1` if TOP(`T2`) and not
/// TOP(`T1`) (which implies `T1 != T2`). Test types `Object?` and
/// `FutureOr<Object?>`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1a(void Function(num) v1, void Function(Object?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(num)>>();
}

void f1b(void Function(num) v1, void Function(FutureOr<Object?>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(num)>>();
}

void f2a<X extends num>(void Function(X) v1, void Function(Object?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f2b<X extends num>(
  void Function(X) v1,
  void Function(FutureOr<Object?>) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f3a(void Function(Null) v1, void Function(Object?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f3b(void Function(Null) v1, void Function(FutureOr<Object?>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f4a(void Function(Never) v1, void Function(Object?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f4b(void Function(Never) v1, void Function(FutureOr<Object?>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f5a(void Function(Function) v1, void Function(Object?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Function)>>();
}

void f5b(void Function(Function) v1, void Function(FutureOr<Object?>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Function)>>();
}

void f6a(void Function(Record) v1, void Function(Object?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Record)>>();
}

void f6b(void Function(Record) v1, void Function(FutureOr<Object?>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Record)>>();
}

void f7a(void Function(FutureOr<int>) v1, void Function(Object?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<int>)>>();
}

void f7b(void Function(FutureOr<int>) v1, void Function(FutureOr<Object?>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<int>)>>();
}

void f8a(void Function(String?) v1, void Function(Object?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(String?)>>();
}

void f8b(void Function(String?) v1, void Function(FutureOr<Object?>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(String?)>>();
}

void f9a(void Function(C) v1, void Function(Object?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(C)>>();
}

void f9b(void Function(C) v1, void Function(FutureOr<Object?>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(C)>>();
}

void f10a(void Function(D<int, String>) v1, void Function(Object?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(D<int, String>)>>();
}

void f10b(
  void Function(D<int, String>) v1,
  void Function(FutureOr<Object?>) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(D<int, String>)>>();
}

void f11a(void Function(FPositional) v1, void Function(Object?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FPositional)>>();
}

void f11b(void Function(FPositional) v1, void Function(FutureOr<Object?>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FPositional)>>();
}

void f12a(void Function(FNamed) v1, void Function(Object?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FNamed)>>();
}

void f12b(void Function(FNamed) v1, void Function(FutureOr<Object?>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FNamed)>>();
}

void f13a(void Function(Rec) v1, void Function(Object?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Rec)>>();
}

void f13b(void Function(Rec) v1, void Function(FutureOr<Object?>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Rec)>>();
}

void f14a(void Function(E) v1, void Function(Object?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(E)>>();
}

void f14b(void Function(E) v1, void Function(FutureOr<Object?>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(E)>>();
}

void f15a(void Function(ET) v1, void Function(Object?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(ET)>>();
}

void f15b(void Function(ET) v1, void Function(FutureOr<Object?>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(ET)>>();
}

void f16a(void Function(Future<dynamic>) v1, void Function(Object?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<dynamic>)>>();
}

void f16b(
  void Function(Future<dynamic>) v1,
  void Function(FutureOr<Object?>) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<dynamic>)>>();
}

void main() {
  f1a((num x) {}, (Object? x) {});
  f1b((num x) {}, (FutureOr<Object?> x) {});
  f2a((num x) {}, (Object? x) {});
  f2b((num x) {}, (FutureOr<Object?> x) {});
  f3a((Null x) {}, (Object? x) {});
  f3b((Null x) {}, (FutureOr<Object?> x) {});
  print(f4a);
  print(f4b);
  f5a((Function x) {}, (Object? x) {});
  f5b((Function x) {}, (FutureOr<Object?> x) {});
  f6a((Record x) {}, (Object? x) {});
  f6b((Record x) {}, (FutureOr<Object?> x) {});
  f7a((FutureOr<int> x) {}, (Object? x) {});
  f7b((FutureOr<int> x) {}, (FutureOr<Object?> x) {});
  f8a((String? x) {}, (Object? x) {});
  f8b((String? x) {}, (FutureOr<Object?> x) {});
  f9a((C x) {}, (Object? x) {});
  f9b((C x) {}, (FutureOr<Object?> x) {});
  f10a((D<int, String> x) {}, (Object? x) {});
  f10b((D<int, String> x) {}, (FutureOr<Object?> x) {});
  f11a((FPositional x) {}, (Object? x) {});
  f11b((FPositional x) {}, (FutureOr<Object?> x) {});
  f12a((FNamed x) {}, (Object? x) {});
  f12b((FNamed x) {}, (FutureOr<Object?> x) {});
  f13a((Rec x) {}, (Object? x) {});
  f13b((Rec x) {}, (FutureOr<Object?> x) {});
  f14a((E x) {}, (Object? x) {});
  f14b((E x) {}, (FutureOr<Object?> x) {});
  f15a((ET x) {}, (Object? x) {});
  f15b((ET x) {}, (FutureOr<Object?> x) {});
  f16a((Future<dynamic> x) {}, (Object? x) {});
  f16b((Future<dynamic> x) {}, (FutureOr<Object?> x) {});
}
