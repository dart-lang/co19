/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the above rule would cause multiple members m1 , . . . , mk with
 * the same name n to be inherited (because identically named members existed
 * in several superinterfaces) then at most one member is inherited. If the static
 * types T1 , . . . , Tk of the members m1 , . . . , mk are not identical, then there must
 * be a member mx such that Tx <: Ti , 1 ≤ x ≤ k for all i ∈ 1..k, or a static type
 * warning occurs. The member that is inherited is mx , if it exists; otherwise:
 *   Let numberOfPositionals(f) denote the number of positional parameters
 *   of a function f, and let numberOfRequiredParams(f) denote the
 *   number of required parameters of a function f. Furthermore, let s denote
 *   the set of all named parameters of the m1; ... ;mk. Then let
 *   h = max(numberOfPositionals(mi)),
 *   r = min(numberOfRequiredParams(mi)), i ∈ 1..k.
 *   If r <= h then I has a method named n, with r required parameters of type dynamic,
 *   h optional positional parameters of type dynamic, named parameters s
 *   of type dynamic and return type dynamic.
 * - Otherwise none of the members m1 , . . . , mk is inherited.
 * @description Checks that there's no static warning produced when the subinterface member
 * being accessed is actually inherited. Members tested include variables, methods, getters,
 * setters and operators. There's no way to check whether the resulting inherited method 
 * signature is actually as described above, but we can check that it's inherited at all.
 * @static-clean
 * @author rodionov
 * @reviewer kaigorodov
 */
import "../../../Utils/expect.dart";

class C {}
class D extends C {}

abstract class SI1 {
  int variable;
  int method(int v, Pattern p, {num o1, String o2});
  int method2(C v, [D o]);
  int get gett0r;
  void set sett0r(int v);
  C operator+(C v);
}

abstract class SI2 {
  num variable;
  void method(num v, String p, {int o1, Pattern o2});
  num method2(D v, [C o]);
  num get gett0r;
  void set sett0r(num v);
  D operator+(D v);
}

abstract class I implements SI1, SI2 {}

main() {
  I i = null;
  
  try {
    i.variable;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(npe) {}
  
  try {
    i.method(null, null, o1:null, o2:null);
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(npe) {}
  
  try {
    var v = i.method2(null, null);
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(npe) {}
  
  try {
    num n = i.gett0r;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(npe) {}
  
  try {
    i.sett0r = null;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(npe) {}
  
  try {
    var v = i + null;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(npe) {}
}
