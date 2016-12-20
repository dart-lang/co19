/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.13: The production CharacterClass :: [ ^ ClassRanges ]
 *            evaluates by evaluating ClassRanges to obtain a CharSet and
 *            returning that CharSet and the Boolean true. <br/> The production
 *            ClassRanges :: [empty] evaluates by returning the empty CharSet.<br/>
 *            The production ClassRanges :: NonemptyClassRanges evaluates by
 *            evaluating NonemptyClassRanges to obtain a CharSet and returning
 *            that CharSet.<br/> NonemptyClassRanges ::<br/> ClassAtom <br/>
 *            ClassAtom NonemptyClassRangesNoDash<br/> ClassAtom - ClassAtom
 *            ClassRanges <br/><br/> NonemptyClassRangesNoDash :: <br/>
 *            ClassAtom <br/> ClassAtomNoDash NonemptyClassRangesNoDash<br/>
 *            ClassAtomNoDash - ClassAtom ClassRanges <br/><br/> ClassAtom ::
 *            <br/> - <br/> ClassAtomNoDash<br/><br/> ClassAtomNoDash :: <br/>
 *            SourceCharacter <b>but not one of \ or ] or -</b><br/> \
 *            ClassEscape <br/><br/> ClassEscape :: <br/> DecimalEscape <br/> b
 *            <br/> CharacterEscape<br/> CharacterClassEscape <br/>
 * @description Checks that a valid CharacterClass ([^..]) pattern works as
 *              described.
 * @3rdparty sputnik-v1:S15.10.2.13_A2_T1.js-S15.10.2.13_A2_T8.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  check("[^]a", "a\naba");
  check("a[^]", "   a\t\n");
  check(r"a[^b-z]\s+", "ab an az aY n");
  check("a[^1-9]c", "abc");
  checkNeg("a[^b]c", "abc");
  check("[^a-z]{4}", r"abc#$%def%&*@ghi");
  check("[^]", r"abc#$%def%&*@ghi");
  check(r"[^\b]+", "easy\bto\u0008ride");
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
