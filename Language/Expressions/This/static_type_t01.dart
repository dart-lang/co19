/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of this is the interface of the immediately
 * enclosing class.
 * @description Checks that the static type of 'this' is the interface of the
 * immediately enclosing class.
 * @author kaigorodov
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class C {
   func() {return this;}
}

main() {
   Expect.isTrue(new C().func() is C);
}
