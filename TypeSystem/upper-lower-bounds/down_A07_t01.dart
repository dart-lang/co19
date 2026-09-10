// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `T2`) = `T1` if BOTTOM(`T1`)
///
/// @description Check that DOWN(`T1`, `T2`) = `T1` if BOTTOM(`T1`), `T1 != T2`,
/// and not TOP(`T1`) nor TOP(`T2`).
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1a<X extends num>(void Function(Never) v1, void Function(X) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f1b<X extends Never, Y extends num>(
  void Function(X) v1,
  void Function(Y) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f2a(void Function(Never) v1, void Function(Object) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f2b<X extends Never>(void Function(X) v1, void Function(Object) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f3a(void Function(Never) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f3b<X extends Never>(void Function(X) v1, void Function(Null) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f4a(void Function(Never) v1, void Function(Function) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f4b<X extends Never>(void Function(X) v1, void Function(Function) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f5a(void Function(Never) v1, void Function(Record) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f5b<X extends Never>(void Function(X) v1, void Function(Record) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f6a(void Function(Never) v1, void Function(FutureOr<int>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f6b<X extends Never>(
  void Function(X) v1,
  void Function(FutureOr<int>) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f7a(void Function(Never) v1, void Function(String?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f7b<X extends Never>(void Function(X) v1, void Function(String?) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f8a(void Function(Never) v1, void Function(C) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f8b<X extends Never>(void Function(X) v1, void Function(C) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f9a(void Function(Never) v1, void Function(D<int, String>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f9b<X extends Never>(
  void Function(X) v1,
  void Function(D<int, String>) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f10a(void Function(Never) v1, void Function(FPositional) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f10b<X extends Never>(void Function(X) v1, void Function(FPositional) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f11a(void Function(Never) v1, void Function(FNamed) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f11b<X extends Never>(void Function(X) v1, void Function(FNamed) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f12a(void Function(Never) v1, void Function(Rec) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f12b<X extends Never>(void Function(X) v1, void Function(Rec) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f13a(void Function(Never) v1, void Function(E) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f13b<X extends Never>(void Function(X) v1, void Function(E) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f14a(void Function(Never) v1, void Function(ET) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f14b<X extends Never>(void Function(X) v1, void Function(ET) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f15a(void Function(Never) v1, void Function(FutureOr<Never>) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f15b<X extends Never>(
  void Function(X) v1,
  void Function(FutureOr<Never>) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f16a<X>(void Function(Never) v1, void Function(X) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f16b<X extends Never, Y>(
    void Function(X) v1,
    void Function(Y) v2,
    ) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void main() {
  f1a((Never x) {}, (num x) {});
  f1b((Never x) {}, (num x) {});
  f2a((Never x) {}, (Object x) {});
  f2b((Never x) {}, (Object x) {});
  f3a((Never x) {}, (Null x) {});
  f3b((Never x) {}, (Null x) {});
  f4a((Never x) {}, (Function x) {});
  f4b((Never x) {}, (Function x) {});
  f5a((Never x) {}, (Record x) {});
  f5b((Never x) {}, (Record x) {});
  f6a((Never x) {}, (FutureOr<int> x) {});
  f6b((Never x) {}, (FutureOr<int> x) {});
  f7a((Never x) {}, (String? x) {});
  f7b((Never x) {}, (String? x) {});
  f8a((Never x) {}, (C x) {});
  f8b((Never x) {}, (C x) {});
  f9a((Never x) {}, (D<int, String> x) {});
  f9b((Never x) {}, (D<int, String> x) {});
  f10a((Never x) {}, (FPositional x) {});
  f10b((Never x) {}, (FPositional x) {});
  f11a((Never x) {}, (FNamed x) {});
  f11b((Never x) {}, (FNamed x) {});
  f12a((Never x) {}, (Rec x) {});
  f12b((Never x) {}, (Rec x) {});
  f13a((Never x) {}, (E x) {});
  f13b((Never x) {}, (E x) {});
  f14a((Never x) {}, (ET x) {});
  f14b((Never x) {}, (ET x) {});
  f15a((Never x) {}, (FutureOr<Never> x) {});
  f15b((Never x) {}, (FutureOr<Never> x) {});
  f16a((Never x) {}, (num x) {});
  f16b((Never x) {}, (num x) {});
}
