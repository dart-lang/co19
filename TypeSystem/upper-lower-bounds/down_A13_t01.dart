// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `T2`) where OBJECT(`T2`) =
///   - `T1` if `T1` is non-nullable
///   - NonNull(`T1`) if NonNull(`T1`) is non-nullable
///   - `Never` otherwise
///
/// @description Check that DOWN(`T1`, `T2`) = `T1` if `T1 != T2`, `T1` and `T2`
/// are neither TOP, BOTTOM, NULL, if OBJECT(`T2`), not OBJECT(`T1`) and `T1` is
/// non-nullable.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1a(void Function(num) v1, void Function(Object) v2) {
  // DOWN(num, Object) = num because num is non-nullable
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(num)>>();
}

void f1b(void Function(num) v1, void Function(FutureOr<Object>) v2) {
  // DOWN(num, FutureOr<Object>) = num because num is non-nullable
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(num)>>();
}

void f2a<X extends num>(void Function(X) v1, void Function(Object) v2) {
  // DOWN(X, Object) = X because X is non-nullable
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f2b<X extends num>(void Function(X) v1, void Function(FutureOr<Object>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f3a(void Function(Function) v1, void Function(Object) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Function)>>();
}

void f3b(void Function(Function) v1, void Function(FutureOr<Object>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Function)>>();
}

void f4a(void Function(Record) v1, void Function(Object) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Record)>>();
}

void f4b(void Function(Record) v1, void Function(FutureOr<Object>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Record)>>();
}

void f5a(void Function(FutureOr<int>) v1, void Function(Object) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<int>)>>();
}

void f5b(void Function(FutureOr<int>) v1, void Function(FutureOr<Object>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<int>)>>();
}

void f6a(void Function(C) v1, void Function(Object) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(C)>>();
}

void f6b(void Function(C) v1, void Function(FutureOr<Object>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(C)>>();
}

void f7a(void Function(D<int, String>) v1, void Function(Object) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(D<int, String>)>>();
}

void f7b(void Function(D<int, String>) v1, void Function(FutureOr<Object>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(D<int, String>)>>();
}

void f8a(void Function(FPositional) v1, void Function(Object) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FPositional)>>();
}

void f8b(void Function(FPositional) v1, void Function(FutureOr<Object>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FPositional)>>();
}

void f9a(void Function(FNamed) v1, void Function(Object) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FNamed)>>();
}

void f9b(void Function(FNamed) v1, void Function(FutureOr<Object>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FNamed)>>();
}

void f10a(void Function(Rec) v1, void Function(Object) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Rec)>>();
}

void f10b(void Function(Rec) v1, void Function(FutureOr<Object>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Rec)>>();
}

void f11a(void Function(E) v1, void Function(Object) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(E)>>();
}

void f11b(void Function(E) v1, void Function(FutureOr<Object>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(E)>>();
}

void main() {
  f1a((num x) {}, (Object x) {});
  f1b((num x) {}, (FutureOr<Object> x) {});
  f2a((num x) {}, (Object x) {});
  f2b((num x) {}, (FutureOr<Object> x) {});
  f3a((Function x) {}, (Object x) {});
  f3b((Function x) {}, (FutureOr<Object> x) {});
  f4a((Record x) {}, (Object x) {});
  f4b((Record x) {}, (FutureOr<Object> x) {});
  f5a((FutureOr<int> x) {}, (Object x) {});
  f5b((FutureOr<int> x) {}, (FutureOr<Object> x) {});
  f6a((C x) {}, (Object x) {});
  f6b((C x) {}, (FutureOr<Object> x) {});
  f7a((D<int, String> x) {}, (Object x) {});
  f7b((D<int, String> x) {}, (FutureOr<Object> x) {});
  f8a((FPositional x) {}, (Object x) {});
  f8b((FPositional x) {}, (FutureOr<Object> x) {});
  f9a((FNamed x) {}, (Object x) {});
  f9b((FNamed x) {}, (FutureOr<Object> x) {});
  f10a((Rec x) {}, (Object x) {});
  f10b((Rec x) {}, (FutureOr<Object> x) {});
  f11a((E x) {}, (Object x) {});
  f11b((E x) {}, (FutureOr<Object> x) {});
}
