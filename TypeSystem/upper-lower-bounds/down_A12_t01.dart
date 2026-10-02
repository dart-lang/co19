// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `T2`) where OBJECT(`T1`) =
///   - `T2` if `T2` is non-nullable
///   - NonNull(`T2`) if NonNull(`T2`) is non-nullable
///   - `Never` otherwise
///
/// @description Check that DOWN(`T1`, `T2`) = `T2` if `T1 != T2`, `T1` and `T2`
/// are neither TOP, BOTTOM, NULL, if OBJECT(`T1`), not OBJECT(`T2`) and `T2` is
/// non-nullable.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1a(void Function(Object) v1, void Function(num) v2) {
  // DOWN(Object, num) = num because num is non-nullable
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(num)>>();
}

void f1b(void Function(FutureOr<Object>) v1, void Function(num) v2) {
  // DOWN(FutureOr<Object>, num) = num because num is non-nullable
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(num)>>();
}

void f2a<X extends num>(void Function(Object) v1, void Function(X) v2) {
  // DOWN(Object, X) = X because X is non-nullable
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f2b<X extends num>(void Function(FutureOr<Object>) v1, void Function(X) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f3a(void Function(Object) v1, void Function(Function) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Function)>>();
}

void f3b(void Function(FutureOr<Object>) v1, void Function(Function) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Function)>>();
}

void f4a(void Function(Object) v1, void Function(Record) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Record)>>();
}

void f4b(void Function(FutureOr<Object>) v1, void Function(Record) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Record)>>();
}

void f5a(void Function(Object) v1, void Function(FutureOr<int>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<int>)>>();
}

void f5b(void Function(FutureOr<Object>) v1, void Function(FutureOr<int>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<int>)>>();
}

void f6a(void Function(Object) v1, void Function(C) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(C)>>();
}

void f6b(void Function(FutureOr<Object>) v1, void Function(C) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(C)>>();
}

void f7a(void Function(Object) v1, void Function(D<int, String>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(D<int, String>)>>();
}

void f7b(void Function(FutureOr<Object>) v1, void Function(D<int, String>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(D<int, String>)>>();
}

void f8a(void Function(Object) v1, void Function(FPositional) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FPositional)>>();
}

void f8b(void Function(FutureOr<Object>) v1, void Function(FPositional) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FPositional)>>();
}

void f9a(void Function(Object) v1, void Function(FNamed) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FNamed)>>();
}

void f9b(void Function(FutureOr<Object>) v1, void Function(FNamed) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FNamed)>>();
}

void f10a(void Function(Object) v1, void Function(Rec) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Rec)>>();
}

void f10b(void Function(FutureOr<Object>) v1, void Function(Rec) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Rec)>>();
}

void f11a(void Function(Object) v1, void Function(E) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(E)>>();
}

void f11b(void Function(FutureOr<Object>) v1, void Function(E) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(E)>>();
}

void main() {
  f1a((Object x) {}, (num x) {});
  f1b((FutureOr<Object> x) {}, (num x) {});
  f2a((Object x) {}, (num x) {});
  f2b((FutureOr<Object> x) {}, (num x) {});
  f3a((Object x) {}, (Function x) {});
  f3b((FutureOr<Object> x) {}, (Function x) {});
  f4a((Object x) {}, (Record x) {});
  f4b((FutureOr<Object> x) {}, (Record x) {});
  f5a((Object x) {}, (FutureOr<int> x) {});
  f5b((FutureOr<Object> x) {}, (FutureOr<int> x) {});
  f6a((Object x) {}, (C x) {});
  f6b((FutureOr<Object> x) {}, (C x) {});
  f7a((Object x) {}, (D<int, String> x) {});
  f7b((FutureOr<Object> x) {}, (D<int, String> x) {});
  f8a((Object x) {}, (FPositional x) {});
  f8b((FutureOr<Object> x) {}, (FPositional x) {});
  f9a((Object x) {}, (FNamed x) {});
  f9b((FutureOr<Object> x) {}, (FNamed x) {});
  f10a((Object x) {}, (Rec x) {});
  f10b((FutureOr<Object> x) {}, (Rec x) {});
  f11a((Object x) {}, (E x) {});
  f11b((FutureOr<Object> x) {}, (E x) {});
}
