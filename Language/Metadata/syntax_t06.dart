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
    @description It is a compile time error, if qualified identifier is not complete
    @compile-error
    @note issue #24280
    @author a.semenov@unipro.ru
 */
import "syntax_lib2.dart" as syntax_lib2;

@syntax_lib2()
class B{}

main() {
}