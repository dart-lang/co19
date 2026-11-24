// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// SharedOptions=--enable-experiment=static-extensions

import 'dart:developer';
import '../../../../pkg/vm_service/test/common/test_helper.dart';

class C<X> {
  final String id;
  C._(this.id);
  C.own(this.id);
}

extension ExtC1<T> on C<T> {
  factory named(String id) => C<T>._("ExtC1.named($id)");
  factory own(String id) => C<T>._("ExtC1.own($id)");
  factory member(String id) => C<T>._("ExtC1.member($id)");
}

extension ExtC2<T> on C<T> {
  factory named(String id) => C<T>._("ExtC2.named($id)");
  static String member(String id) => "ExtC2.member($id)";
}

extension ExtC3<N extends num> on C<N> {
  factory bounded(String id) => C<N>._("ExtC3.bounded($id)");
}

extension ExtC4 on C<int> {
  factory nonGeneric(String id) => C<int>._("ExtC4.nonGeneric($id)");
}

void testeeMain() {
  debugger();
}

Future<void> main([args = const <String>[]]) =>
    startServiceTest(testeeConcurrent: testeeMain);
