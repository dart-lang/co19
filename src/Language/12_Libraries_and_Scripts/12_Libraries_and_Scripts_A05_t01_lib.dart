/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */

#library("12_Libraries_and_Scripts_A05_t01_lib");

class C {
  _foo() {}
  var _bar = 1;
  static var _x = 2;
}

interface I default IImpl{
  I();
  var _foo;
  _bar(p1);
  static final _y = 3;
}

class IImpl implements I {
  IImpl() {}
  var _foo;
  _bar(p1) => p1 + 1;
}


var _topLevelDeclaration = 1;
