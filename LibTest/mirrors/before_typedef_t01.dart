// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Metadata can appear before  ...  typedef ...
/// @description Check that metadata is allowed before typedef declaration
/// @author a.semenov@unipro.ru
/// @issue 43186

import 'dart:mirrors';
import '../../Utils/expect.dart';

class A {
  const A();
}

@A()
typedef void f(int, String);

main() {
  Expect.equals('.A',
    MirrorSystem.getName(reflectType(f).metadata[0].type.qualifiedName));
}
