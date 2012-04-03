// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

#library("12_Libraries_and_Scripts_A01_t01_lib");

interface I {}
interface J<T> {}

class A {}
class B extends A {}
class C implements I {}
class D implements J<String> {}

f() {}
g(p1, p2) => p1 + p2;
A h([p1, p2]) {
  return new A();
}

typedef typeF();
typedef int typeG();
typedef void typeH(p1, p2);

final x = 'x';
String y = 'y';
var z;

int a, b, c = 1;

get getX() {}
set setY(p) {}

