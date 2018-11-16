/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The [==] operator in constant expressions was defined such that
 * [e1 != null] was only allowed if [e1] had one of the "primitive" system
 * types. Users had to rewrite their code to [!identical(e1, null)]. This was
 * changed so that the [==] expression is always allowed as long as one of the
 * operands is [null].
 * @description Checks that [==] operator is allowed if one of the operands is
 * [null].
 * @compile-error
 * @author iarkh@unipro.ru
 */
import "../../Utils/expect.dart";

class MyClass {
  final String option;
  const MyClass(String stringOption)
      : assert(stringOption == null),
        this.option = stringOption;
}

main() {
  const MyClass c = MyClass("test"); //#1: compile-time error
}
