/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Metadata can appear before  ...  class ...
 * @description Check that metadata is allowed before class declaration
 * @author a.semenov@unipro.ru
 */
import 'dart:mirrors';
import '../../Utils/expect.dart';

class A {
  const A();
}

@A()
class B {}

main() {
  Expect.equals('.A',
    MirrorSystem.getName(reflectClass(B).metadata[0].type.qualifiedName));
}
