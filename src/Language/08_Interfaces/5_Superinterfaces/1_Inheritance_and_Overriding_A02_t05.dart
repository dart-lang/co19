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
 * - If all of m1 , . . . , mk have the same number r of required parameters and
 *   the same set of named parameters s, then let
 *   h = max(numberOf OptionalP ositionals(mi )), i ∈ 1..k.
 *   I has a method named n, with r required parameters of type dynamic,
 *   h optional positional parameters of type dynamic, named parameters s
 *   of type dynamic and return type dynamic.
 * - Otherwise none of the members m1 , . . . , mk is inherited.
 * @description Checks that there's no static warning produced when the subinterface member
 * being accessed is actually inherited. Members tested include variables, methods, getters,
 * setters and operators. There's no way to check whether the resulting inherited method 
 * signature is actually as described above (all Dynamic arguments and return type in case 
 * the superinterface methods' static types are not compatible but have the same numbers of
 * required and optional arguments), but we can check that it's inherited at all.
 * @author rodionov
 * @reviewer kaigorodov
 * @note Only makes sense when dartc is used - uncomment the commented out lines
 * and see if it fails in VM mode.
 */

abstract class SI1 {
  int variable;
  int method(int v, Pattern p, [num o1, String o2]);
  int method2(int v, [int o]);
  int get gett0r();
  void set sett0r(int v);
  SI1 operator+(int v);
}

abstract class SI2 {
  num variable;
  void method(num v, String p, [int o1, Pattern o2]);
  String method2(String v, [String o]);
  num get gett0r();
  void set sett0r(num v);
  SI2 operator+(String v);
}

abstract class I implements SI1, SI2 {}

main() {
  I i = null;
  
  try {i.variable;} on NullPointerException catch(npe) {}
  
  try {i.method(null, null, o1:null, o2:null);} on NullPointerException catch(npe) {}
  
  try {var v = i.method2(null, o:null);} on NullPointerException catch(npe) {}
  
  try {num n = i.gett0r;} on NullPointerException catch(npe) {}
  
  try {i.sett0r = null;} on NullPointerException catch(npe) {}
  
  try {var v = i + null;} on NullPointerException catch(npe) {}

//  try {i.nonexistent;} on NullPointerException catch(npe) {}
}
