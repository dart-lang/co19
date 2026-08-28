// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T2`) where OBJECT(`T2`) =
///   - `T2` if `T1` is non-nullable
///   - `T2?` otherwise
///
/// @description Check that UP(`T1`, `T2`) = `T2?` if `T1 != T2`, `T1` and `T2`
/// are neither TOP, BOTTOM, NULL, nor intersection type, if OBJECT(`T2`), not
/// OBJECT(`T1`) and `T1` is not non-nullable. Note that none of TOP(`T`),
/// BOTTOM(`T`), or NULL(`T`) holds when OBJECT(`T`), and `T` is not an
/// intersection type.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(num? n, Object o) {
  var v = (1 > 2) ? n : o; // UP(num?, Object) = Object?
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

void f2(num? n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(num?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext(); // Check that `v`'s type is `FutureOr<Object>`.
}

void f3<X extends num>(X? n, Object o) {
  var v = (1 > 2) ? n : o; // UP(X?, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f4<X extends num>(X? n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(X?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f5<X extends num?>(X n, Object o) {
  var v = (1 > 2) ? n : o; // UP(X?, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f6<X extends num?>(X n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(X?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f7(Function? n, Object o) {
  var v = (1 > 2) ? n : o; // UP(Function?, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f8(Function? n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(Function?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f9(Record? n, Object o) {
  var v = (1 > 2) ? n : o; // UP(Record?, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f10(Record? n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(Record?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f11(FutureOr<int>? n, Object o) {
  var v = (1 > 2) ? n : o; // UP(FutureOr<int>?, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f12(FutureOr<int>? n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(FutureOr<int>?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f13(C? n, Object o) {
  var v = (1 > 2) ? n : o; // UP(C?, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f14(C? n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(C?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f15(D<int, String>? n, Object o) {
  var v = (1 > 2) ? n : o; // UP(D<int, String>?, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f16(D<int, String>? n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(D<int, String>?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f17(FPositional? n, Object o) {
  var v = (1 > 2) ? n : o; // UP(FPositional?, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f18(FPositional? n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(FPositional?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f19(FNamed? n, Object o) {
  var v = (1 > 2) ? n : o; // UP(FNamed?, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f20(FNamed? n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(FNamed?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f21(Rec? n, Object o) {
  var v = (1 > 2) ? n : o; // UP(Rec?, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f22(Rec? n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(Rec?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f23(E? n, Object o) {
  var v = (1 > 2) ? n : o; // UP(E?, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f24(E? n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(E?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f25(ET? n, Object o) {
  var v = (1 > 2) ? n : o; // UP(ET?, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f26(ET? n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(ET?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f27(ET n, Object o) {
  // `ET` is neither non-nullable (`ET <: Object` is false) nor nullable
  var v = (1 > 2) ? n : o; // UP(ET, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f28(ET n, FutureOr<Object> o) {
  // `ET` is neither non-nullable (`ET <: Object` is false) nor nullable
  var v = (1 > 2) ? n : o; // UP(ET, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip the `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmFutureOrObjectContext();
}

void f29(FutureOr<ET> t1, Object t2) {
  // `FutureOr<ET>` is neither non-nullable (`ET <: Object` is false) nor nullable
  // UP(FutureOr<ET>, Object) = Object?;
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip `?`
    Expect.fail('The actual value must be non-null for the test to complete.');
  }
  v = confirmObjectContext();
}

void f30(FutureOr<ET> t1, FutureOr<Object> t2) {
  // `FutureOr<ET>` is neither non-nullable (`ET <: Object` is false) nor nullable
  // UP(FutureOr<ET>, FutureOr<Object>) = FutureOr<Object>?;
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
  f6(1, 1);
  f7(() {}, 1);
  f8(() {}, 1);
  f9((1,), 1);
  f10((1,), 1);
  f11(1, 1);
  f12(1, 1);
  f13(C(), 1);
  f14(C(), 1);
  f15(D<int, String>(), 1);
  f16(D<int, String>(), 1);
  f17(<X extends num>(X x, [int i = 0]) => 0, 1);
  f18(<X extends num>(X x, [int i = 0]) => 0, 1);
  f19(<X extends num>(X x, {int i = 0}) => 0, 1);
  f20(<X extends num>(X x, {int i = 0}) => 0, 1);
  f21((1, 'two', b: true), 1);
  f22((1, 'two', b: true), 1);
  f23(E.e0, 1);
  f24(E.e0, 1);
  f25(ET(0), 1);
  f26(ET(0), 1);
  f27(ET(0), 1);
  f28(ET(0), 1);
  f29(ET(0), 1);
  f30(ET(0), 1);
}
