// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// SharedOptions=--enable-experiment=static-extensions

import 'dart:developer';
import '../../../../pkg/vm_service/test/common/test_helper.dart';

class C<X> {
  final X v;
  C._(this.v);
}

extension type ET._(int v) {}

extension ExtC<T> on C<T> {
  factory(T t) => C._(t); // LINE_A
  factory named(T t) {
    T t1 = t; // LINE_B
    return C._(t1);
  }
}

extension ExtET on ET {
  factory(int v) => ET._(v + 1); // LINE_C
  factory named(int v) {
    int v1 = v + 2; // LINE_D
    return ET._(v1);
  }
}

void testeeMain() {
  debugger();
  C(1);
  C.named("2");
  ET(3);
  ExtET.named(4);
}

Future<void> main([args = const <String>[]]) =>
    startServiceTest(testeeConcurrent: testeeMain);
