/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form new T#m
 * proceeds as follows:...
 * If T does not denote a class, a dynamic error occurs.
 * @description Check that it is a dynamic error if T denotes function
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

void f() {
}

main() {
  Expect.throws(() {var x = new f#m;}, (e) => e is Error);
}
