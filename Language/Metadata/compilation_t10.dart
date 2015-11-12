/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile time error if the expression is not one of the
 * following:
 *   • A reference to a compile-time constant variable.
 *   • A call to a constant constructor.
 * @description Check that it is a compile time error, if mandatory arguments
 * are missing
 * @issue #24281
 * @compile-error
 * @author a.semenov@unipro.ru
 */
import 'dart:mirrors';
import '../../Utils/expect.dart';

class A {
    const A(int x);
}

@A
class B {}

main() {
    // have to retrieve metadata to get the compile error
    Expect.fail('Compilation error is expected, but retrieved metadata: ' +
        reflectClass(B).metadata.map( (e) => e.reflectee ).join(' '));
}
