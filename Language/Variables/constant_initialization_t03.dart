// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant variable must be initialized to a compile-time 
/// constant or a compile-time error occurs.
/// @description Checks that constant variables should be initialized to
/// a compile-time constant.
/// @author msyabro

import "../../Utils/expect.dart";
import "dart:math" as Math;

class Foo {
  const Foo();
}

const int i = -100;
const bool b = false;
const String s = "string";
const double pi = Math.pi;
const Foo foo = Foo();
const List<int> l = [0, 1, 2, 3];
const Map<String, int> m = {'a': 1, 'b': 2};
const bool bOr = true || false;
const int iPlus = 5 + i;

main() {
  const CheckIdentical(-100,  i);
  const CheckIdentical(false,  b);
  const CheckIdentical("string",  s);
  const CheckIdentical(Math.pi,  pi);
  const CheckIdentical(Foo(),  foo);
  const CheckIdentical([0, 1, 2, 3],  l);
  const CheckIdentical({'a': 1, 'b': 2},  m);
  const CheckIdentical(true || false,  bOr);
  const CheckIdentical(-95,  iPlus);
}
