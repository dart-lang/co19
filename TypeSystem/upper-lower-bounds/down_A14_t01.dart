// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1?`, `T2?`) = `S?` where `S` is DOWN(`T1`, `T2`)
///
/// @description Check that DOWN(`T1?`, `T2?`) = `S?` where `S` is DOWN(`T1`,
/// `T2`) if the operands are not the same type and none of them is TOP, BOTTOM,
/// NULL, or OBJECT. Test that if `T1 <: T2` or `T2 <: T1` then `S` is the
/// corresponding subtype.
/// @author sgrekhov22@gmail.com

import 'dart:async';

import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

class A {}

class B extends A {}

void f1a(void Function(int?) v1, void Function(num?) v2) {
  // DOWN(int?, num?) = DOWN(int, num)? = int?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(int?)>>();
}

void f1b(void Function(num?) v1, void Function(int?) v2) {
  // DOWN(num?, int?) = DOWN(num, int)? = int?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(int?)>>();
}

void f2a<X extends num>(void Function(X?) v1, void Function(num?) v2) {
  // DOWN(X?, num?) = DOWN(X, num)? = X?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X?)>>();
}

void f2b<X extends num>(void Function(num?) v1, void Function(X?) v2) {
  // DOWN(num?, X?) = DOWN(num, X)? = X?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X?)>>();
}

void f3a(void Function(FPositional?) v1, void Function(Function?) v2) {
  // DOWN(FPositional?, Function?) = DOWN(FPositional, Function)? = FPositional?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FPositional?)>>();
}

void f3b(void Function(Function?) v1, void Function(FPositional?) v2) {
  // DOWN(Function?, FPositional?) = FPositional?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FPositional?)>>();
}

void f4a(void Function(Rec2?) v1, void Function(Rec?) v2) {
  // DOWN(Rec2?, Rec?) = DOWN(Rec2, Rec)? = Rec2?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Rec2?)>>();
}

void f4b(void Function(Rec?) v1, void Function(Rec2?) v2) {
  // DOWN(Rec?, Rec2?) = Rec2?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Rec2?)>>();
}

void f5a(void Function(Rec?) v1, void Function(Record?) v2) {
  // DOWN(Rec?, Record?) = Rec?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Rec?)>>();
}

void f5b(void Function(Record?) v1, void Function(Rec?) v2) {
  // DOWN(Record?, Rec?) = Rec?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Rec?)>>();
}

void f6a(void Function(FutureOr<int>?) v1, void Function(FutureOr<num>?) v2) {
  // DOWN(FutureOr<int>?, FutureOr<num>?) = FutureOr<int>?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<int>?)>>();
}

void f6b(void Function(FutureOr<num>?) v1, void Function(FutureOr<int>?) v2) {
  // DOWN(FutureOr<num>?, FutureOr<int>?) = FutureOr<int>?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<int>?)>>();
}

void f7a(void Function(B?) v1, void Function(A?) v2) {
  // DOWN(B?, A?) = B?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(B?)>>();
}

void f7b(void Function(A?) v1, void Function(B?) v2) {
  // DOWN(A?, B?) = B?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(B?)>>();
}

void f8a(void Function(D<int, String>?) v1, void Function(D<num, Object>?) v2) {
  // DOWN(D<int, String>?, D<num, Object>?) = D<int, String>?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(D<int, String>?)>>();
}

void f8b(void Function(D<num, Object>?) v1, void Function(D<int, String>?) v2) {
  // DOWN(D<num, Object>?, D<int, String>?) = D<int, String>?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(D<int, String>?)>>();
}

void f9a(void Function(E?) v1, void Function(Enum?) v2) {
  // DOWN(E?, Enum?) = E?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(E?)>>();
}

void f9b(void Function(Enum?) v1, void Function(E?) v2) {
  // DOWN(Enum?, E?) = E?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(E?)>>();
}

void f10a(void Function(ET2?) v1, void Function(ET?) v2) {
  // DOWN(ET2?, ET?) = ET2?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(ET2?)>>();
}

void f10b(void Function(ET?) v1, void Function(ET2?) v2) {
  // DOWN(ET?, ET2?) = ET2?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(ET2?)>>();
}

void f11a(void Function(List<int>?) v1, void Function(List<num>?) v2) {
  // DOWN(List<int>?, List<num>?) = List<int>?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(List<int>?)>>();
}

void f11b(void Function(List<num>?) v1, void Function(List<int>?) v2) {
  // DOWN(List<num>?, List<int>?) = List<int>?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(List<int>?)>>();
}

void f12a(
  void Function(int Function(num)?) v1,
  void Function(int Function(int)?) v2,
) {
  // DOWN(int Function(num)?, int Function(int)?) = int Function(num)?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(int Function(num)?)>>();
}

void f12b(
  void Function(int Function(int)?) v1,
  void Function(int Function(num)?) v2,
) {
  // DOWN(int Function(int)?, int Function(num)?) = int Function(num)?
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(int Function(num)?)>>();
}

void main() {
  f1a((int? x) {}, (num? x) {});
  f1b((num? x) {}, (int? x) {});
  f2a<int>((int? x) {}, (num? x) {});
  f2b<int>((num? x) {}, (int? x) {});
  f3a((FPositional? x) {}, (Function? x) {});
  f3b((Function? x) {}, (FPositional? x) {});
  f4a((Rec2? x) {}, (Rec? x) {});
  f4b((Rec? x) {}, (Rec2? x) {});
  f5a((Rec? x) {}, (Record? x) {});
  f5b((Record? x) {}, (Rec? x) {});
  f6a((FutureOr<int>? x) {}, (FutureOr<num>? x) {});
  f6b((FutureOr<num>? x) {}, (FutureOr<int>? x) {});
  f7a((B? x) {}, (A? x) {});
  f7b((A? x) {}, (B? x) {});
  f8a((D<int, String>? x) {}, (D<num, Object>? x) {});
  f8b((D<num, Object>? x) {}, (D<int, String>? x) {});
  f9a((E? x) {}, (Enum? x) {});
  f9b((Enum? x) {}, (E? x) {});
  f10a((ET2? x) {}, (ET? x) {});
  f10b((ET? x) {}, (ET2? x) {});
  f11a((List<int>? x) {}, (List<num>? x) {});
  f11b((List<num>? x) {}, (List<int>? x) {});
  f12a((int Function(num)? x) {}, (int Function(int)? x) {});
  f12b((int Function(int)? x) {}, (int Function(num)? x) {});
}
