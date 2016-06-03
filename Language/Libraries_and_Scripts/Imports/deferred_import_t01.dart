/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The current library is the library currently being compiled. The
 * import modifies the import namespace of the current library in a manner that
 * is determined by the imported library and by the optional elements of the
 * import.
 * . . .
 * Let I be an import directive that refers to a URI via the string s1.
 * Evaluation of I proceeds as follows:
 *
 * If I is a deferred import, no evaluation takes place. Instead, a mapping of
 * the name of the prefix, p to a deferred prefix object is added to the scope
 * of the current library L. The deferred prefix object has the following
 * methods:
 * • loadLibrary. This method returns a future f. When called, the method
 *   causes an immediate import I to be executed at some future time, where
 *   I is is derived from I by eliding the word deferred and adding a hide
 *   loadLibrary combinator clause. When I executes without error, f completes
 *   successfully. If I executes without error, we say that the call to
 *   loadLibrary has succeeded, otherwise we say the call has failed.
 * • For every top level function f named id in the imported library B, a
 *   corresponding method named id with the same signature as f. Calling
 *   the method results in a runtime error.
 * • For every top level getter g named id in B, a corresponding getter named
 *   id with the same signature as g. Calling the method results in a runtime
 *    error.
 * • For every top level setter s named id in B, a corresponding setter named
 *   id with the same signature as s. Calling the method results in a runtime
 *   error.
 * • For every type T named id in B, a corresponding getter named id with
 *   return type Type. Calling the method results in a runtime error.
 * . . .
 * After a call succeeds, the name p is mapped to a non-deferred prefix object
 * as described below. In addition, the prefix object also supports the
 * loadLibrary method, and so it is possible to call loadLibrary again. If
 * a call fails, nothing happens, and one again has the option to call
 * loadLibrary again. Whether a repeated call to loadLibrary succeeds will
 * vary as described below.
 * The effect of a repeated call to p.loadLibrary is as follows:
 * • If another call to p.loadLibrary has already succeeded, the repeated call
 *   also succeeds. Otherwise,
 * • If another call to to p.loadLibrary has failed:
 *   – If the failure is due to a compilation error, the repeated call fails
 *     for the same reason.
 *   – If the failure is due to other causes, the repeated call behaves as if
 *     no previous call had been made.
 * In other words, one can retry a deferred load after a network failure or
 * because a file is absent, but once one finds some content and loads it, one
 * can no longer reload.
 *
 * @description Checks that a deferred prefix object has a method loadLibrary,
 * returning a future f, and for every top-level declaration in the imported
 * library a corresponding declaration with the same name in the current
 * library. Calling the imported name results in a runtime error.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";
import "static_type_lib.dart" deferred as p;

main() {
  try {
    p.someFunc();
    Expect.fail("Should not be here");
  } catch (e) {
    Expect.isTrue(e is NoSuchMethodError);
  }
  try {
    p.someGetter;
    Expect.fail("Should not be here");
  } catch (e) {
    Expect.isTrue(e is NoSuchMethodError);
  }
  try {
    p.someSetter = 1;
    Expect.fail("Should not be here");
  } catch (e) {
    Expect.isTrue(e is NoSuchMethodError);
  }
  try {
    p.Func;
    Expect.fail("Should not be here");
  } catch (e) {
    Expect.isTrue(e is NoSuchMethodError);
  }
  try {
    Expect.isTrue(p.loadLibrary() is Future);
  } catch (e) {
    Expect.fail("Should not be here");
  }
}
