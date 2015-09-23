/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Metadata can appear before  ...  function ...
 * @description Check that metadata is allowed before function
 * @author a.semenov@unipro.ru
 */
import 'dart:mirrors';
import '../../Utils/expect.dart';

class A {
  const A();
}

@A() void hello() {}

main() {
  MethodMirror helloMirror = (reflect(hello) as ClosureMirror).function;
  Expect.equals('.A',
    MirrorSystem.getName(helloMirror.metadata[0].type.qualifiedName));
}
