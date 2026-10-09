// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `T2`) = `T2` if BOTTOM(`T2`)
///
/// @description Check that DOWN(`T1`, `T2`) = `T2` if BOTTOM(`T2`), `T1 != T2`,
/// and not TOP(`T1`) nor TOP(`T2`).
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1a<X extends num>(void Function(X) v1, void Function(Never) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f1b<X extends Never, Y extends num>(
  void Function(Y) v1,
  void Function(X) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f2a(void Function(Object) v1, void Function(Never) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f2b<X extends Never>(void Function(Object) v1, void Function(X) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f3a(void Function(Null) v1, void Function(Never) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f3b<X extends Never>(void Function(Null) v1, void Function(X) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f4a(void Function(Function) v1, void Function(Never) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f4b<X extends Never>(void Function(Function) v1, void Function(X) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f5a(void Function(Record) v1, void Function(Never) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f5b<X extends Never>(void Function(Record) v1, void Function(X) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f6a(void Function(FutureOr<int>) v1, void Function(Never) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f6b<X extends Never>(
  void Function(FutureOr<int>) v1,
  void Function(X) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f7a(void Function(String?) v1, void Function(Never) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f7b<X extends Never>(void Function(String?) v1, void Function(X) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f8a(void Function(C) v1, void Function(Never) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f8b<X extends Never>(void Function(C) v1, void Function(X) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f9a(void Function(D<int, String>) v1, void Function(Never) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f9b<X extends Never>(
  void Function(D<int, String>) v1,
  void Function(X) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f10a(void Function(FPositional) v1, void Function(Never) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f10b<X extends Never>(void Function(FPositional) v1, void Function(X) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f11a(void Function(FNamed) v1, void Function(Never) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f11b<X extends Never>(void Function(FNamed) v1, void Function(X) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f12a(void Function(Rec) v1, void Function(Never) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f12b<X extends Never>(void Function(Rec) v1, void Function(X) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f13a(void Function(E) v1, void Function(Never) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f13b<X extends Never>(void Function(E) v1, void Function(X) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f14a(void Function(ET) v1, void Function(Never) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f14b<X extends Never>(void Function(ET) v1, void Function(X) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f15a(void Function(FutureOr<Never>) v1, void Function(Never) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f15b<X extends Never>(void Function(FutureOr<Never>) v1, void Function(X) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f16a<X>(void Function(X) v1, void Function(Never) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f16b<X extends Never, Y>(
    void Function(Y) v1,
    void Function(X) v2,
    ) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void main() {
  f1a((num x) {}, (Never x) {});
  f1b((num x) {}, (Never x) {});
  f2a((Object x) {}, (Never x) {});
  f2b((Object x) {}, (Never x) {});
  f3a((Null x) {}, (Never x) {});
  f3b((Null x) {}, (Never x) {});
  f4a((Function x) {}, (Never x) {});
  f4b((Function x) {}, (Never x) {});
  f5a((Record x) {}, (Never x) {});
  f5b((Record x) {}, (Never x) {});
  f6a((FutureOr<int> x) {}, (Never x) {});
  f6b((FutureOr<int> x) {}, (Never x) {});
  f7a((String? x) {}, (Never x) {});
  f7b((String? x) {}, (Never x) {});
  f8a((C x) {}, (Never x) {});
  f8b((C x) {}, (Never x) {});
  f9a((D<int, String> x) {}, (Never x) {});
  f9b((D<int, String> x) {}, (Never x) {});
  f10a((FPositional x) {}, (Never x) {});
  f10b((FPositional x) {}, (Never x) {});
  f11a((FNamed x) {}, (Never x) {});
  f11b((FNamed x) {}, (Never x) {});
  f12a((Rec x) {}, (Never x) {});
  f12b((Rec x) {}, (Never x) {});
  f13a((E x) {}, (Never x) {});
  f13b((E x) {}, (Never x) {});
  f14a((ET x) {}, (Never x) {});
  f14b((ET x) {}, (Never x) {});
  f15a((FutureOr<Never> x) {}, (Never x) {});
  f15b((FutureOr<Never> x) {}, (Never x) {});
  f16a((num x) {}, (Never x) {});
  f16b((num x) {}, (Never x) {});
}
