// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A type test, o is U or o is! U, and a type cast, o as U, where U
/// is or contains an inline type, is performed at run time as a type test and
/// type cast on the run-time representation of the inline type
///
/// @description Check that at run time a type cast, `o as U` is performed as a
/// type cast on the run-time representation of the inline type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

inline class V1 {
  final int id;
  V1(this.id);
}

inline class V2<T> {
  final T id;
  V2(this.id);
}

String test(Object instance) {
  String log = "";
  try {
    instance as num;
    log += "as num;";
  } catch (_) {
    log += "throw;";
  }
  try {
    instance as int;
    log += "as int;";
  } catch (_) {
    log += "throw;";
  }
  try {
    instance as (int,);
    log += "as (int,);";
  } catch (_) {
    log += "throw;";
  }
  try {
    instance as V1;
    log += "as V1;";
  } catch (_) {
    log += "throw;";
  }
  try {
    instance as List<num>;
    log += "as List<num>;";
  } catch (_) {
    log += "throw;";
  }
  try {
    instance as List<int>;
    log += "as List<int>;";
  } catch (_) {
    log += "throw;";
  }
  try {
    instance as V2<List<num>>;
    log += "as V2<List<num>>;";
  } catch (_) {
    log += "throw;";
  }
  try {
    instance as V2<List<int>>;
    log += "as V2<List<int>>;";
  } catch (_) {
    log += "throw;";
  }
  try {
    instance as V2<List<(int,)>>;
    log += "as V2<List<(int,)>>;";
  } catch (_) {
    log += "throw;";
  }
  return log;
}

main() {
  int i = 42;
  var v1 = V1(i);
  String log1 = test(i);
  String log2 = test(v1);
  Expect.equals(log1, log2);

  List<int> l1 = [];
  var v2 = V2<List<int>>(l1);
  String log3 = test(l1);
  String log4 = test(v2);
  Expect.equals(log3, log4);

  List<(int,)> l2 = [];
  var v3 = V2<List<(int,)>>(l2);
  String log5 = test(l2);
  String log6 = test(v3);
  Expect.equals(log5, log6);
}
