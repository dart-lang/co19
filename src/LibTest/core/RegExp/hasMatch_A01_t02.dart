/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether the regular expression has a match in the string
 *            [str].
 * @description Tests this method with various patterns, flags and input strings.
 * @author rodionov
 * @reviewer msyabro
 * @note issue 1297
 */

main() {
  // Disjunction
  check("a|ab", "abc");
  check(@"\d{3}|[a-z]{4}", "2, 12 and of course repeat 12");
  checkNeg(@"\d{3}|[a-z]{4}", "2, 12 and 23 AND 0.00.1");
  check("ab|cd|ef", "AEKFCD", ignoreCase: true);
  checkNeg("ab|cd|ef", "AEKFCD");
  check("11111|111", "1111111111111111");
  check("xyz|...", "abc");
  check("(ab|cd)+|ef", "AEKFCD", ignoreCase: true);
  check("(ab|cd)+|ef", "AEKFCDab", ignoreCase: true);
  check("(ab|cd)+|ef", "AEKeFCDab", ignoreCase: true);
  check("(.)..|abc", "abc");
  check(".+: gr(a|e)y", "color: grey");
  check("(Rob)|(Bob)|(Robert)|(Bobby)", "Hi Bob");
  check("()|",                          "");
  check("|()",                          "");
  check("((a)|(ab))((c)|(bc))",         "abc");
  
  // Term
  check("a[a-z]{2,4}", "abcdefghi");
  check("a[a-z]{2,4}?", "abcdefghi");
  
  check("(aa|aabaac|ba|b|c)*", "aabaac");
  check(@"^(a+)\1*,\1+$", "aaaaaaaaa,aaaaaa");
  check(@"^(a+)\1*,\1+$", "aaaaaa,aaaaaaaaa");
  check(@"^(a+?)\1*,\1+$", "aaaaaaaaa,aaaaaa");
  check(@"^(a+?)\1*,\1+$", "aaaaaa,aaaaaaaaa");
  
  check("(z)((a+)?(b+)?(c))*", "zaacbbbcac");
  check("(z)((a+)?(b+)?(c))*", "zaacbbbc");
  
  check(@"(a*)b\1+", "baaaac");
  check("(a*)*", "b");

  // Assertion
  checkNeg("^m", "pairs\nmakes\tdouble");
  check("^m", "pairs\nmakes\tdouble", multiLine: true);
  check(@"^\d+", "abc\n123xyz", multiLine: true);
  check("^p[a-z]", "pairs\nmakes\tdouble\npesos");
  checkNeg("^p[b-z]", "pairs\nmakes\tdouble\npesos");
  check("^p[b-z]", "pairs\nmakes\tdouble\npesos", multiLine: true);
  check("^[^p]", "pairs\nmakes\tdouble\npesos", multiLine: true);
  check("^ab", "abcde");
  checkNeg("^..^e", "ab\ncde");
  checkNeg("^xxx", "yyyyy");
  check(@"^\^+", "^^^x");

  checkNeg(@"s$", "pairs\nmakes\tdouble");
  check(@"e$", "pairs\nmakes\tdouble");
  check(@"s$", "pairs\nmakes\tdouble", multiLine: true);
  check(@"[^e]$", "pairs\nmakes\tdouble", multiLine: true);
  check(@"es$", "pairs\nmakes\tdoubl\u0065s", multiLine: true);
  
  check(@"\bp", "pilot\nsoviet robot\topenoffice");
  check(@"ot\b", "pilot\nsoviet robot\topenoffice");
  checkNeg(@"\bot", "pilot\nsoviet robot\topenoffice");
  check(@"\bso", "pilot\nsoviet robot\topenoffice");
  checkNeg(@"so\b", "pilot\nsoviet robot\topenoffice");
  check(@"[^o]t\b", "pilOt\nsoviet robot\topenoffice");
  check(@"[^o]t\b", "pilOt\nsoviet robot\topenoffice", ignoreCase:true);
  check(@"\bro", "pilot\nsoviet robot\topenoffice");
  checkNeg(@"r\b", "pilot\nsoviet robot\topenoffice");
  check(@"\brobot\b", "pilot\nsoviet robot\topenoffice");
  check(@"\b\w{5}\b", "pilot\nsoviet robot\topenoffice");
  check(@"\bop", "pilot\nsoviet robot\topenoffice");
  checkNeg(@"op\b", "pilot\nsoviet robot\topenoffice");
  check(@"e\b", "pilot\nsoviet robot\topenoffic\u0065");
  checkNeg(@"\be", "pilot\nsoviet robot\topenoffic\u0065");
  
  check(@"\Bevil\B", "devils arise\tfor\nevil");
  check(@"[f-z]e\B", "devils arise\tfor\nrevil");
  check(@"\Bo\B", "devils arise\tfOr\nrevil", ignoreCase:true);
  check(@"\B\w\B", "devils arise\tfor\nrevil");
  check(@"\w\B", "devils arise\tfor\nrevil");
  check(@"\B\w", "devils arise\tfor\nrevil");
  checkNeg(@"\B[a-yA-Y]{4}\B", "devil arise\tforzzx\nevils");
  check(@"\B\w{4}\B", "devil arise\tforzzx\nevils");
  
  check(@"^^^^^^^\b\b\b\bro\B\B\B\Bbot\b\b\b\b\b$$$$", "robot");

  
  // Quantifier
  check("[^\"]*", "\"beast\"-nickname");
  check("[^\"]*", "alice said: \"don\'t\"");
  check("[^\"]*", "before\'i\'start");
  check("[^\"]*", "alice \"sweep\": \"don\'t\"");
  check("[^\"]*", "alice \u0022sweep\u0022: \"don\'t\"");
  check("[\"\'][^\"\']*[\"\']", "
