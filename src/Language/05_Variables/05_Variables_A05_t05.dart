/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A ﬁnal variable is a variable whose binding is ﬁxed upon initialization;
 * a ﬁnal variable v will always refer to the same object after v has been initialized.
 * The declaration of a ﬁnal variable must include the modiﬁer ﬁnal.
 * It is a static warning if a ﬁnal instance variable that has been initialized at
 * its point of declaration is also initialized in a constructor.
 * It is a static warning if a ﬁnal instance variable that has been initialized by means
 * of an initializing formal of a constructor is also initialized elsewhere in the same
 * constructor.
 * Attempting to assign to a final variable anywhere except in its declaration or in
 * a constructor header will cause a runtime error to be thrown.
 * @description Checks that a static warning is given as well as NoSuchMethodError thrown
 * when a final variable is assigned outside of initializing expression or constructor.
 * @static-warning
 * @author kaigorodov
 * @reviewer rodionov
 */
import "../../Utils/expect.dart";
 
class C {
  final v=1;
  
  C() {
   init();
  }
  
  void init() {
    v=1; /// static warning
  }
}

main() {
  Expect.throws(()=>new C(), (e) => e is NoSuchMethodError);
}
