/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Metadata can appear before  ...  variable declaration ...
 * @description Check that metadata is allowed before variable declared in
 * class
 * @author a.semenov@unipro.ru
 */
import 'dart:mirrors';
import '../../Utils/expect.dart';

class A {
  const A();
}

class B {
  @A() int variable;
  @A() final int finalVariable = 0;
  @A() var dynamicVariable;
  @A() static int staticVariable = 10;
}

main() {
  ClassMirror classMirror = reflectClass(B);
  var varNames = ['variable', 'finalVariable', 'dynamicVariable', 'staticVariable'];
  for (var name in varNames) {
    Symbol symbol = MirrorSystem .getSymbol(name);
    DeclarationMirror varMirror = classMirror.declarations[symbol];
    Expect.equals('.A',
      MirrorSystem.getName(varMirror.metadata[0].type.qualifiedName));
  }
}
