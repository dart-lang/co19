// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Cascades can contain explicitly instantiated tearoffs, e.g.,
/// receiver..foo()..instanceMethod<int>..bar. Note that this is allowed for
/// consistency, but it will compute a value and discard it, and hence it is
/// only useful in rather rare cases
///
/// @description Checks that cascades can contain explicitly instantiated
/// tearoffs
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

String log = "";

class A {
  List<X> m<X>(X x) => [x];
}

extension FunctionApplier on Function {
  void applyAndPrint(List<Object?> positionalArguments) =>
      log += Function.apply(this, positionalArguments, const {}).toString();
}

void main() {
  A()
    ..m<int>.applyAndPrint([42])
    ..m<String>.applyAndPrint(['Lily was here']);
  Expect.equals('[42][Lily was here]', log);
}
