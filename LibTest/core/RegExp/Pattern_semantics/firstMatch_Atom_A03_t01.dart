/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.8: Parentheses of the form ( Disjunction ) serve both to
 *            group the components of the Disjunction pattern together and to
 *            save the result of the match. The result can be used either in a
 *            backreference (\ followed by a nonzero decimal number), referenced
 *            in a replace String, or returned as part of a list from the
 *            regular expression matching internal procedure.
 * @description Checks that the contents of parentheses are correctly captured.
 * @3rdparty sputnik-v1:S15.10.2.8_A3_T1.js-S15.10.2.8_A3_T33.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  check(r"([Jj]ava([Ss]cript)?)\sis\s(fun\w*)",
      "Learning javaScript is funny, really", 9,
      ["javaScript is funny", "javaScript", "Script", "funny"]);
  check(r"([Jj]ava([Ss]cript)?)\sis\s(fun\w*)",
      "Developing with Java is fun, try it", 16,
      ["Java is fun", "Java", null, "fun"]);
  checkNeg(r"([Jj]ava([Ss]cript)?)\sis\s(fun\w*)",
      "Developing with JavaScript is dangerous, do not try it without assistance");
  check(r"(abc)", "abc", 0, ["abc", "abc"]);
  check(r"a(bc)d(ef)g", "abcdefg", 0, ["abcdefg", "bc", "ef"]);
  check(r"(.{3})(.{4})", "abcdefgh", 0, ["abcdefg", "abc", "defg"]);
  check(r"(aa)bcd\1", "aabcdaabcd", 0, ["aabcdaa", "aa"]);
  check(r"(aa).+\1", "aabcdaabcd", 0, ["aabcdaa", "aa"]);
  check(r"(.{2}).+\1", "aabcdaabcd", 0, ["aabcdaa", "aa"]);
  check(r"(\d{3})(\d{3})\1\2", "123456123456", 0, ["123456123456","123","456"]);
  check(r"a(..(..)..)", "abcdefgh", 0, ["abcdefg","bcdefg","de"]);
  check(r"(a(b(c)))(d(e(f)))", "xabcdefg", 1, ["abcdef", "abc", "bc", "c",
    "def", "ef", "f"]);
  check(r"(a(b(c)))(d(e(f)))\2\5", "xabcdefbcefg", 1, ["abcdefbcef", "abc",
    "bc", "c", "def", "ef", "f"]);
  check(r"a(.?)b\1c\1d\1", "abcd", 0, ["abcd", ""]);
  check(r"([\S]+([ \t]+[\S]+)*)[ \t]*=[ \t]*[\S]+", "Course_Creator = Test", 0,
      ["Course_Creator = Test", "Course_Creator", null]);
  check(r"^(A)?(A.*)$", "AAA", 0, ["AAA", "A", "AA"]);
  check(r"^(A)?(A.*)$", "AA", 0, ["AA", "A", "A"]);
  check(r"^(A)?(A.*)$", "A", 0, ["A", null, "A"]);
  check(r"(A)?(A.*)", "zxcasd;fl\\  ^AAAaaAAaaaf;lrlrzs", 13,
      ["AAAaaAAaaaf;lrlrzs", "A", "AAaaAAaaaf;lrlrzs"]);
  check(r"(A)?(A.*)", "zxcasd;fl\\  ^AAaaAAaaaf;lrlrzs", 13,
      ["AAaaAAaaaf;lrlrzs", "A", "AaaAAaaaf;lrlrzs"]);
  check(r"(A)?(A.*)", "zxcasd;fl\\  ^AaaAAaaaf;lrlrzs", 13,
      ["AaaAAaaaf;lrlrzs", null, "AaaAAaaaf;lrlrzs"]);
  check(r"(a)?a", "a", 0, ["a", null]);
  check(r"a|(b)", "a", 0, ["a", null]);
  check(r"(a)?(a)", "a", 0, ["a", null, "a"]);
  check(r"^([a-z]+)*[a-z]$", "a", 0, ["a", null]);
  check(r"^([a-z]+)*[a-z]$", "ab", 0, ["ab", "a"]);
  check(r"^([a-z]+)*[a-z]$", "abc", 0, ["abc", "ab"]);
  check(r"^(([a-z]+)*[a-z]\.)+[a-z]{2,}$", "www.netscape.com", 0,
      ["www.netscape.com", "netscape.", "netscap"]);
  check(r"^(([a-z]+)*([a-z])\.)+[a-z]{2,}$", "www.netscape.com", 0,
      ["www.netscape.com", "netscape.", "netscap", "e"]);
}

void check(String pattern, String str, int matchPos, List<String> expectedGroups) {
  RegExp re = new RegExp(pattern);
  Match fm = re.firstMatch(str);
  if(null == fm) {
    Expect.fail("\"$pattern\" !~ \"$str\"");
  }
  if(matchPos >= 0) {
    Expect.equals(matchPos, fm.start);
  }
  if(null != expectedGroups) {
    Expect.equals(expectedGroups.length, fm.groupCount + 1);
    
    for(int i = 0; i <= fm.groupCount; i++) {
      String expGr = expectedGroups[i];
      String actGr = fm.group(i);
      if(expGr != actGr) {
        Expect.fail("Mismatch at group $i: \"$expGr\" expected instead of \"$actGr\"");
      }
    }
  }
}

void checkNeg(String pattern, String str) {
  RegExp re = new RegExp(pattern);
  if(null != re.firstMatch(str)) {
    Expect.fail("\"$pattern\" ~ \"$str\"");
  }
}
