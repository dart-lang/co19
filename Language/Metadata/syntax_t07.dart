/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 *  metadata:
    (‘@’ qualiﬁed (‘.’ identiﬁer)? (arguments)?)*
    ;
    @description It is a compile time error, if mandatory arguments are missing
    @note issue #24281
    @compile-error
    @author a.semenov@unipro.ru
 */
import "dart:mirrors";

class A {
    const A(int x);
}

@A
class B{}

main() {
    reflectClass(B).metadata; // compile error
}