/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form new T#
 * proceeds as follows:
 * ...
 * In checked mode, if T or any of its superclasses is malbounded a dynamic
 * error occurs.
 * @description Check that it is a dynamic error and static warning if
 * superclass of T is a malbounded type
 * @static-warning
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/dynamic_check.dart';

class Bounded<T extends num> {}

class C extends Bounded<String> {
  C();
}

main() {
  if (isCheckedMode()) {
    checkDynamicError(() {
      var i = new C#;; /// static warning
    });
  }
}
