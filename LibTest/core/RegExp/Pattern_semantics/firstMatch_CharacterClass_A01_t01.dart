/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.13: The production CharacterClass :: [ [lookahead not in
 *            {^}] ClassRanges ] evaluates by evaluating ClassRanges to obtain a
 *            CharSet and returning that CharSet and the Boolean false.<br/>
 *            The production ClassRanges :: [empty] evaluates by returning the
 *            empty CharSet.<br/> 
 *            The production ClassRanges :: NonemptyClassRanges evaluates by
 *            evaluating
 *            NonemptyClassRanges to obtain a CharSet and returning that
 *            CharSet. <br/>
 *            NonemptyClassRanges ::<br/> 
 *            ClassAtom <br/> 
 *            ClassAtom NonemptyClassRangesNoDash<br/> 
 *            ClassAtom - ClassAtom ClassRanges<br/>
 *            <br/>
 *            NonemptyClassRangesNoDash :: <br/> 
 *            ClassAtom <br/>
 *            ClassAtomNoDash NonemptyClassRangesNoDash<br/> 
 *            ClassAtomNoDash - ClassAtom ClassRanges <br/>
 *            <br/> 
 *            ClassAtom :: <br/> - <br/>
 *            ClassAtomNoDash<br/><br/> ClassAtomNoDash :: <br/>
 *            SourceCharacter <b>but not one of \ or ] or -</b><br/>
 *            \ ClassEscape <br/>
 *            <br/> 
 *            ClassEscape :: <br/> 
 *            DecimalEscape <br/> 
 *            b <br/> 
 *            CharacterEscape<br/> 
 *            CharacterClassEscape <br/>
 * @description Checks that a valid CharacterClass ([..]) pattern works as
 *              described.
 * @3rdparty sputnik-v1:S15.10.2.13_A1_T1.js-S15.10.2.13_A1_T17.js
 * @author rodionov
 * @note Issue 1297
 */
import "../../../../Utils/expect.dart";
 

main() {
  check("q[ax-zb](?=\\s+)", "qYqy ");
  check("q[ax-zb](?=\\s+)", "tqaqy ");
  check("q[ax-zb](?=\\s+)", "tqa\t  qy ");
  check("ab[ercst]de", "abcde");
  check("[d-h]+", "abcdefghijkl");
  check("[1234567].{2}", "abc6defghijkl");
  check("[a-c\\d]+", "\n\nabc324234\n");
  check("ab[.]?c", "abc");
  check("a[b]c", "abc");
  check("[a-z][^1-9][a-z]", "a1b  b2c  c3d  def  f4g");
  check(r"[\*&$]{3}", r"123*&$abc");
  check(r"[\d][\n][^\d]", "line1\nline2");
  check(r"[\+--]", ",");
  check("[--0]", "/");
  check("[---]", "-");
  check("[a-cA-C]", "bB");
  check(r"[\u0061-\u007A]", "f");
  checkNeg("[]", "a[b\n[]\tc]d");
  checkNeg("[]a", "\0a\0a");
  checkNeg("a[]", "\0a\0a");
  checkNeg("ab[erst]de", "abcde");
//  check(r"[\d][\12-\14]{1,}[^\d]", "line1\n\n\n\n\nline2");
//  check(r"[\d][\0012-\0014]{1,}[^\d]", "line1\n\n\n\n\nline2"); // issue 1297
}

void check(String pattern, String str) {
  RegExp re = new RegExp(pattern);
  if(null == re.firstMatch(str)) {
    Expect.fail("\"$pattern\" !~ \"$str\"");
  }
}

void checkNeg(String pattern, String str) {
  RegExp re = new RegExp(pattern);
  if(null != re.firstMatch(str)) {
    Expect.fail("\"$pattern\" ~ \"$str\"");
  }
}
