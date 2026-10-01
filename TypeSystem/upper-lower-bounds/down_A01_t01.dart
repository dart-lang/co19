// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// - DOWN(`T`, `T`) = `T`
///
/// @description Check that DOWN(`T`, `T`) = `T`.
/// @note README.md contains a detailed explanation of why and how we are
/// checking the type of TOP and OBJECT.
/// @author sgrekhov22@gmail.com

import 'dart:async';

import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(dynamic x) v1, void Function(dynamic y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(dynamic)>>();
  // See README.md for an explanation of each step in the checks below.
  v = (o) {
    if (1 > 2) {
      o.checkDynamic;
    }
    o = 1; // Rejects `Never`
  };
}

void f2(void Function(Null x) v1, void Function(Null y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Null)>>();
}

void f3(void Function(Function x) v1, void Function(Function y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Function)>>();
}

void f4(void Function(Record x) v1, void Function(Record y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Record)>>();
}

void f5(void Function(FutureOr<int> x) v1, void Function(FutureOr<int> y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<int>)>>();
}

void f6(void Function(String? x) v1, void Function(String? y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(String?)>>();
}

void f7(void Function(C x) v1, void Function(C y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(C)>>();
}

void f8(
  void Function(D<int, String> x) v1,
  void Function(D<int, String> y) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(D<int, String>)>>();
}

void f9(void Function(FPositional x) v1, void Function(FPositional y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FPositional)>>();
}

void f10(void Function(FNamed x) v1, void Function(FNamed y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FNamed)>>();
}

void f11(void Function(Rec x) v1, void Function(Rec y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Rec)>>();
}

void f12(void Function(Enum x) v1, void Function(Enum y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Enum)>>();
}

void f13(void Function(E x) v1, void Function(E y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(E)>>();
}

void f14(void Function(ET x) v1, void Function(ET y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(ET)>>();
}

void f15<X extends num>(void Function(X x) v1, void Function(X y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f16<X>(void Function(X x) v1, void Function(X y) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f17(
  void Function(FutureOr<Object?> x) v1,
  void Function(FutureOr<Object?> y) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<Object?>)>>();
  v = (o) {
    // See README.md for an explanation of each step in the checks below.
    o.expectStaticType<Exactly<Object?>>();
    o = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object?>>>();
    o = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
    o = probeFutureOr2()..expectStaticType<Exactly<Future<FutureOr<Object>>>>();
  };
}

void f18(
  void Function(FutureOr<Object> x) v1,
  void Function(FutureOr<Object> y) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<Object>)>>();
  v = (o) {
    // See README.md for an explanation of each step in the checks below.
    o.expectStaticType<Exactly<Object>>();
    o = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
    o = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
  };
}

void main() {
  f1((o) {}, (o) {});
  f2((Null o) {}, (Null o) {});
  f3((Function o) {}, (Function o) {});
  f4((Record o) {}, (Record o) {});
  f5((FutureOr<int> o) {}, (FutureOr<int> o) {});
  f6((String? o) {}, (String? o) {});
  f7((C o) {}, (C o) {});
  f8((D<int, String> o) {}, (D<int, String> o) {});
  f9((FPositional o) {}, (FPositional o) {});
  f10((FNamed o) {}, (FNamed o) {});
  f11((Rec o) {}, (Rec o) {});
  f12((Enum o) {}, (Enum o) {});
  f13((E o) {}, (E o) {});
  f14((ET o) {}, (ET o) {});
  f15((num o) {}, (num o) {});
  f16<int>((int o) {}, (int o) {});
  f17((FutureOr<Object?> o) {}, (FutureOr<Object?> o) {});
  f18((FutureOr<Object> o) {}, (FutureOr<Object> o) {});
}
