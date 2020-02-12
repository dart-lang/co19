/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Metadata can appear before  ...  parameter ...
 * @description Check that metadata is allowed before function parameter
 * @author a.semenov@unipro.ru
 */
import 'dart:mirrors';
import '../../Utils/expect.dart';

class A {
  const A();
}

void hello(@A() int x) {}

main() {
  MethodMirror helloMirror = (reflect(hello) as ClosureMirror).function;
  ParameterMirror paramMirror = helloMirror.parameters[0];
  Expect.equals('.A',
    MirrorSystem.getName(paramMirror.metadata[0].type.qualifiedName));
}
