/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Metadata can appear before  ...  function ...
 * @description Check that metadata is allowed before getter
 * @author a.semenov@unipro.ru
 */
import 'dart:mirrors';
import '../../Utils/expect.dart';

class A {
  const A();
}

class B {
  @A() int get b => 0;
}

main() {
  var getterName = MirrorSystem .getSymbol('b');
  MethodMirror bMirror = reflectClass(B).instanceMembers[getterName];
  Expect.equals('.A',
    MirrorSystem.getName(bMirror.metadata[0].type.qualifiedName));
}
