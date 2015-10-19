/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Except that iff identical(T1, T2) then new T1# == new T2#
 *
 * @description Check that if identical(T1, T2) then new T1# == new T2#.
 * Test default constructor
 * @issue 24607
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
}

main() {
  Expect.equals(new C#, new C#);
}
