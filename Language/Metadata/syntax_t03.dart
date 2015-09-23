/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 *  metadata:
 *   (‘@’ qualified (‘.’ identifier)? (arguments)?)*
 *   ;
 * @description Verify several kinds of valid metadata declarations.
 * Metadata refers to constants and classes imported from library with prefix.
 * @author a.semenov@unipro.ru
 */

import 'syntax_lib2.dart' as syntax_lib2;

@syntax_lib2.C()
class Test1{}

const _d10 = const syntax_lib2.D.d(10);

@syntax_lib2.C() @syntax_lib2.D() @_d10 @syntax_lib2.F.z
class Test2{}

@syntax_lib2.Bar(1,2)
class Test3{}

@syntax_lib2.D() @syntax_lib2.Y @syntax_lib2.F.y
class Test4{}

const _da = const syntax_lib2.D.d('aaa');

@_da
class Test5{}

main() {
}
