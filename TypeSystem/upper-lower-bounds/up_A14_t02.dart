// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T2`) where OBJECT(`T1`) =
///   - `T1` if `T2` is non-nullable
///   - `T1?` otherwise
///
/// @description Check that UP(`T1`, `T2`) = `T1?` if `T1 != T2`, `T1` and `T2`
/// are neither TOP, BOTTOM, NULL, nor intersection type, if OBJECT(`T1`), not
/// OBJECT(`T2`) and `T2` is not non-nullable. Note that none of TOP(`T`),
/// BOTTOM(`T`), or NULL(`T`) holds when OBJECT(`T`), and `T` is not an
/// intersection type.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(Object o, num? n) {
  var v = (1 > 2) ? o : n; // UP(Object, num?) = Object?
  v.expectStaticType<Exactly<Object?>>(); // Check that v's type is TOP.
  // `Object` and `FutureOr<Object> `are subtypes of each other, which means
  // that we can't see the difference using `expectStaticType()` function.
  // `v.expectStaticType<Exactly<FutureOr<Object?>>>();` also succeeds. Let's
  // check that `v` is not `FutureOr<Object?>`
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext(); // Check that `v`'s type is `Object`.
}

void f2(FutureOr<Object> o, num? n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, num?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext(); // Check that `v`'s type is `FutureOr<Object>`.
}

void f3<X extends num>(Object o, X? n) {
  var v = (1 > 2) ? o : n; // UP(Object, X?) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f4<X extends num>(FutureOr<Object> o, X? n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, X?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f5<X extends num?>(Object o, X n) {
  var v = (1 > 2) ? o : n; // UP(Object, X?) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f6<X extends num?>(FutureOr<Object> o, X n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, X?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f7(Object o, Function? n) {
  var v = (1 > 2) ? o : n; // UP(Object, Function?) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f8(FutureOr<Object> o, Function? n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, Function?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f9(Object o, Record? n) {
  var v = (1 > 2) ? o : n; // UP(Object, Record?) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f10(FutureOr<Object> o, Record? n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, Record?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f11(Object o, FutureOr<int>? n) {
  var v = (1 > 2) ? o : n; // UP(Object, FutureOr<int>?) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f12(FutureOr<Object> o, FutureOr<int>? n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, FutureOr<int>?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f13(Object o, C? n) {
  var v = (1 > 2) ? o : n; // UP(Object, C?) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f14(FutureOr<Object> o, C? n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, C?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f15(Object o, D<int, String>? n) {
  var v = (1 > 2) ? o : n; // UP(Object, D<int, String>?) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f16(FutureOr<Object> o, D<int, String>? n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, D<int, String>?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f17(Object o, FPositional? n) {
  var v = (1 > 2) ? o : n; // UP(Object, FPositional?) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f18(FutureOr<Object> o, FPositional? n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, FPositional?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f19(Object o, FNamed? n) {
  var v = (1 > 2) ? o : n; // UP(Object, FNamed?) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f20(FutureOr<Object> o, FNamed? n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, FNamed?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f21(Object o, Rec? n) {
  var v = (1 > 2) ? o : n; // UP(Object, Rec?) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f22(FutureOr<Object> o, Rec? n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, Rec?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f23(Object o, E? n) {
  var v = (1 > 2) ? o : n; // UP(Object, E?) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f24(FutureOr<Object> o, E? n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, E?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f25(Object o, ET? n) {
  var v = (1 > 2) ? o : n; // UP(Object, ET?) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f26(FutureOr<Object> o, ET? n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, ET?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f27(Object o, ET n) {
  // `ET` is neither non-nullable (`ET <: Object` is false) nor nullable
  var v = (1 > 2) ? o : n; // UP(Object, ET) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip '?'
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f28(FutureOr<Object> o, ET n) {
  // `ET` is neither non-nullable (`ET <: Object` is false) nor nullable
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, ET) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) {
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f29(Object t1, FutureOr<ET> t2) {
  // `FutureOr<ET>` is neither non-nullable (`ET <: Object` is false) nor nullable
  // UP(Object, FutureOr<ET>) = Object?;
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
  }
  v = confirmObjectContext();
}

void f30(FutureOr<Object> t1, FutureOr<ET> t2) {
  // `FutureOr<ET>` is neither non-nullable (`ET <: Object` is false) nor nullable
  // UP(FutureOr<Object>, FutureOr<ET>) = FutureOr<Object>?;
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Object>?>>();
  if (v == null) { // Strip `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
  }
  v = confirmFutureOrObjectContext();
}

void main() {
  f1(1, 1);
  f2(1, 1);
  f3(1, 1);
  f4(1, 1);
  f5(1, 1);
  f5(1, 1);
  f7(1, () {});
  f8(1, () {});
  f9(1, (1,));
  f10(1, (1,));
  f11(1, 1);
  f12(1, 1);
  f13(1, C());
  f14(1, C());
  f15(1, D<int, String>());
  f16(1, D<int, String>());
  f17(1, <X extends num>(X x, [int i = 0]) => 0);
  f18(1, <X extends num>(X x, [int i = 0]) => 0);
  f19(1, <X extends num>(X x, {int i = 0}) => 0);
  f20(1, <X extends num>(X x, {int i = 0}) => 0);
  f21(1, (1, 'two', b: true));
  f22(1, (1, 'two', b: true));
  f23(1, E.e0);
  f24(1, E.e0);
  f25(1, ET(0));
  f26(1, ET(0));
  f27(1, ET(0));
  f28(1, ET(0));
  f29(1, ET(0));
  f30(1, ET(0));
}
