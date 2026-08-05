// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T2`) = `T2` if TOP(`T2`)
///
/// @description Check that UP(`T1`, `T2`) = `T2` if TOP(`T2`).
/// @author sgrekhov22@gmail.com

import 'dart:async';
import 'up_lib.dart';

void f1(dynamic d, num n) {
  var v = (1 > 2) ? n : d;
  if (1 > 2) {
    v.checkDynamic;
  }
}

void f2<X extends num>(dynamic d, X n) {
  var v = (1 > 2) ? n : d;
  if (1 > 2) {
    v.checkDynamic;
  }
}

void f3(dynamic d) {
  var v = (1 > 2) ? null : d;
  if (1 > 2) {
    v.checkDynamic;
  }
}

void f4(dynamic d, Never n) {
  var v = (1 > 2) ? n : d;
  if (1 > 2) {
    v.checkDynamic;
  }
}

void f5(dynamic d, Function n) {
  var v = (1 > 2) ? n : d;
  if (1 > 2) {
    v.checkDynamic;
  }
}

void f6(dynamic d, Record n) {
  var v = (1 > 2) ? n : d;
  if (1 > 2) {
    v.checkDynamic;
  }
}

void f7(dynamic d, FutureOr<int> n) {
  var v = (1 > 2) ? n : d;
  if (1 > 2) {
    v.checkDynamic;
  }
}

void f8(dynamic d, String? n) {
  var v = (1 > 2) ? n : d;
  if (1 > 2) {
    v.checkDynamic;
  }
}

void f9(dynamic d, C n) {
  var v = (1 > 2) ? n : d;
  if (1 > 2) {
    v.checkDynamic;
  }
}

void f10(dynamic d, D<int, String> n) {
  var v = (1 > 2) ? n : d;
  if (1 > 2) {
    v.checkDynamic;
  }
}

void f11(dynamic d, FPositional n) {
  var v = (1 > 2) ? n : d;
  if (1 > 2) {
    v.checkDynamic;
  }
}

void f12(dynamic d, FNamed n) {
  var v = (1 > 2) ? n : d;
  if (1 > 2) {
    v.checkDynamic;
  }
}

void f13(dynamic d, Rec n) {
  var v = (1 > 2) ? n : d;
  if (1 > 2) {
    v.checkDynamic;
  }
}

void f14(dynamic d, E n) {
  var v = (1 > 2) ? n : d;
  if (1 > 2) {
    v.checkDynamic;
  }
}

void f15(dynamic d, ET n) {
  var v = (1 > 2) ? n : d;
  if (1 > 2) {
    v.checkDynamic;
  }
}

void main() {
  f1('1', 2);
  f2('2', 2);
  f3('3');
  print(f4);
  f5('5', () {});
  f6('6', (1,));
  f7('7', 7);
  f8('8', '8');
  f9('9', C());
  f10('10', D<int, String>());
  f11('11', <X extends num>(X x, [int i = 0]) => 0);
  f12('12', <X extends num>(X x, {int i = 0}) => 0);
  f13('13', (1, 'two', b: true));
  f14('14', E.e0);
  f15('15', ET(0));
}
