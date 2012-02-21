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
  check("[\"\'][^\"\']*[\"\']", "alice \u0022sweep\u0022: \"don\'t\"");
  check("[\"\'][^\"\']*[\"\']", "alice cries out: \'don\'t\'");
  checkNeg("[\"\'][^\"\']*[\"\']", "alice cries out: don\'t");
  check("[\"\'][^\"\']*[\"\']", "alice cries out: \"\"");
  check("d*", "abcddddefg");
  check("cd*", "abcddddefg");
  check("cx*d", "abcddddefg");
  check("(x*)(x+)", "xxxxxxx");
  check(@"(\d*)(\d+)", "0123456789");
  check(@"(\d*)\d(\d+)", "0123456789");
  check("(x+)(x*)", "xxxxxxx");
  check(@"x*y+$", "xxxxxxyyyyyy");
  check(@"[\d]*[\s]*bc.", "abcdef");
  check(@"bc..[\d]*[\s]*", "abcdef");
  check(".*", "a1b2c3");
  checkNeg("[xyz]*1", "a0.b2.c3");

  check(@"\s+java\s+", "language  java\n");
  check(@"\s+java\s+", "\t java object");
  checkNeg(@"\s+java\s+", "\t javax package");
  checkNeg(@"\s+java\s+", "java\n\nobject");
  check(@"[a-z]+\d+", "x 2 ff 55 x2 as1 z12 abc12.0");
  check(@"[a-z]+\d+", "__abc123.0");
  check(@"[a-z]+(\d+)", "x 2 ff 55 x2 as1 z12 abc12.0");
  check(@"[a-z]+(\d+)", "__abc123.0");
  check("d+", "abcdddddefg");
  checkNeg("o+", "abcdddddefg");
  check("d+", "abcdefg");
  check("(b+)(b+)(b+)", "abbbbbbbc");
  check("(b+)(b*)", "abbbbbbbc");
  check("b*b+", "abbbbbbbc");
  
  check("java(script)?", "state: javascript is an extension of ecma script");
  check("java(script)?", "state: java and javascript are vastly different");
  checkNeg("java(script)?", "state: both Java and JavaScript used in web development");
  check("cd?e", "abcdef");
  check("cdx?e", "abcdef");
  check("o?pqrst", "pqrstuvw");
  check("x?y?z?", "abcdef");
  check("x?ay?bz?c", "abcdef");
  check("b?b?b?b", "abbbbc");
  check("ab?c?d?x?y?z", "123az789");
  check(@"\??\??\??\??\??", "?????");
  check(".?.?.?.?.?.?.?", "test");
  
  check(@"[a-zA-Z]{3}\d{2}", "xa124dfdg08");
  check(@"b{2}c", "aaabbbbcccddeeeefffff");
  checkNeg(@"b{8}", "aaabbbbcccddeeeefffff");
  
  check(@"b{2,}c", "aaabbbbcccddeeeefffff");
  checkNeg(@"b{8,}c", "aaabbbbcccddeeeefffff");
  check(@"\d{1,}", "wqe456646dsff");
  check(@"(123){1,}", "123123");
  check(@"(123){1,}?", "123123");
  check(@"(123){1,}x\1", "123123x123");
  check(@"x{1,2}x{1,}", "xxxxxxx");
  
  check(@"\d{2,4}", "the answer is 42");
  checkNeg(@"\d{2,4}", "the 7 movie");
  check(@"\d{2,4}", "the 20000 Leagues Under the Sea book");
  check(@"\d{2,4}", "the Fahrenheit 451 book");
  check(@"\d{2,4}", "the 1984 novel");
  check(@"\d{2,4}", "0a0\u0031\u0031b");
  check(@"\d{2,4}", "0a0\u0031\u003122b");
  check(@"b{2,3}c", "aaabbbbcccddeeeefffff");
  checkNeg(@"b{42,93}c", "aaabbbbcccddeeeefffff");
  check(@"b{0,93}c", "aaabbbbcccddeeeefffff");
  check(@"bx{0,93}c", "aaabbbbcccddeeeefffff");
  check(@".{0,93}", "weirwerdf");
  
  // Atom
  check(@"(?=(a+))", "baaabac");
  check(@"(?=(a+))a*b\1", "baaabac");
  check(@"[Jj]ava([Ss]cript)?(?=\:)", "just Javascript: the way af jedi");
  check(@"[Jj]ava([Ss]cript)?(?=\:)", "taste of java: the cookbook");
  checkNeg(@"[Jj]ava([Ss]cript)?(?=\:)", "rhino is JavaScript engine");
  
  check(@"Java(?!Script)([A-Z]\w*)", "using of JavaBeans technology");
  checkNeg(@"Java(?!Script)([A-Z]\w*)", "using of Java language");
  checkNeg(@"Java(?!Script)([A-Z]\w*)", "I\"m a JavaScripter");
  check(@"Java(?!Script)([A-Z]\w*)", "JavaScr oops ipt ");
  check(@"(\.(?!com|org)|/)", "ah.info");
  check(@"(\.(?!com|org)|/)", "ah/info");
  checkNeg(@"(\.(?!com|org)|/)", "ah.com");
  check(@"(?!a|b)|c", "");
  check(@"(?!a|b)|c", "bc");
  check(@"(?!a|b)|c", "d");
  check(@"(.*?)a(?!(a+)b\2c)\2(.*)", "baaabaac");
  
  check(@"([Jj]ava([Ss]cript)?)\sis\s(fun\w*)", "Learning javaScript is funny, really");
  check(@"([Jj]ava([Ss]cript)?)\sis\s(fun\w*)", "Developing with Java is fun, try it");
  checkNeg(@"([Jj]ava([Ss]cript)?)\sis\s(fun\w*)", "Developing with JavaScript is dangerous, do not try it without assistance");
  check(@"(abc)", "abc");
  check(@"a(bc)d(ef)g", "abcdefg");
  check(@"(.{3})(.{4})", "abcdefgh");
  check(@"(aa)bcd\1", "aabcdaabcd");
  check(@"(aa).+\1", "aabcdaabcd");
  check(@"(.{2}).+\1", "aabcdaabcd");
  check(@"(\d{3})(\d{3})\1\2", "123456123456");
  check(@"a(..(..)..)", "abcdefgh");
  check(@"(a(b(c)))(d(e(f)))", "xabcdefg");
  check(@"(a(b(c)))(d(e(f)))\2\5", "xabcdefbcefg");
  check(@"a(.?)b\1c\1d\1", "abcd");
  check(@"([\S]+([ \t]+[\S]+)*)[ \t]*=[ \t]*[\S]+", "Course_Creator = Test");
  check(@"^(A)?(A.*)$", "AAA");
  check(@"^(A)?(A.*)$", "AA");
  check(@"^(A)?(A.*)$", "A");
  check(@"(A)?(A.*)", "zxcasd;fl\\  ^AAAaaAAaaaf;lrlrzs");
  check(@"(A)?(A.*)", "zxcasd;fl\\  ^AAaaAAaaaf;lrlrzs");
  check(@"(A)?(A.*)", "zxcasd;fl\\  ^AaaAAaaaf;lrlrzs");
  check(@"(a)?a", "a");
  check(@"a|(b)", "a");
  check(@"(a)?(a)", "a");
  check(@"^([a-z]+)*[a-z]$", "a");
  check(@"^([a-z]+)*[a-z]$", "ab");
  check(@"^([a-z]+)*[a-z]$", "abc");
  check(@"^(([a-z]+)*[a-z]\.)+[a-z]{2,}$", "www.netscape.com");
  check(@"^(([a-z]+)*([a-z])\.)+[a-z]{2,}$", "www.netscape.com");

  check(@"ab.de", "abcde");
  check(@".+", "line 1\nline 2");
  check(@".*a.*", "this is a test");
  check(@".+", @"this is a *&^%$# test");
  check(@".+", "....");
  check(@".+", "abcdefghijklmnopqrstuvwxyz");
  check(@".+", "ABCDEFGHIJKLMNOPQRSTUVWXYZ");
  check(@".+", @"`1234567890-=~!@#$%^&*()_+");
  check(@".+", @"""|\[{]};:"',<>.?/""");

  check(@"[a-z]+", "ABC def ghi", ignoreCase:true);
  check(@"[a-z]+", "ABC def ghi");
  checkNeg(@"[A-Z]+", "ß", ignoreCase: true);
  checkNeg(@"[A-Z]+", "\u0131", ignoreCase: true);
  checkNeg(@"[A-Z]+", "\u017F", ignoreCase: true);
  
  // AtomEscape
  check(@"\b(\w+) \1\b", "do you listen the the band");
  check(@"([xu]\d{2}([A-H]{2})?)\1", "x09x12x01x01u00FFu00FFx04x04x23");
  check(@"([xu]\d{2}([A-H]{2})?)\1", "x09x12x01x05u00FFu00FFx04x04x23");
  check(@"(a*)b\1+", "baaac");
  
  // CharacterEscape
  check(@"\t", "\u0009");
  check(@"\t\t", "\u0009\u0009asf");
  check(@"\n", "\u000A");
  check(@"\n\n", "\u000A\u000Aasf");
  check(@"\v", "\u000B");
  check(@"\v\v", "\u000B\u000Basf");
  check(@"\f", "\u000C");
  check(@"\f\f", "\u000C\u000Casf");
  check(@"\r", "\u000D");
  check(@"\r\r", "\u000D\u000Dasf");
  
  // DecimalEscape
  check(@"\0", "\u0000");
  check(@"\0\0", "\u0000\u0000asf");
  checkNeg(@"\00", "");
  checkNeg(@"\011", "");
  checkNeg(@"\1", "");
  checkNeg(@"\2", "");
  checkNeg(@"\3", "");
  checkNeg(@"\4", "");
  checkNeg(@"\10", "");
  checkNeg(@"\100", "");
  checkNeg(@"(A)\2", "AA");
  check(@"(A)\1", "AA");
  check(@"\1(A)", "AA");
  check(@"(A)\1(B)\2", "AABB");
  check(@"\1(A)(B)\2", "ABB");
  check(@"((((((((((A))))))))))\1\2\3\4\5\6\7\8\9\10", "AAAAAAAAAAA");
  check(@"((((((((((A))))))))))\10\9\8\7\6\5\4\3\2\1", "AAAAAAAAAAA");
  
  // CharacterClassEscape
  check(@"\d\d\d", "150");
  checkNeg(@"\d", @"adgo[oFSOPE$%^!@#$");
  checkNeg(@"\D", "150");
  check(@"\D\D\D\D\D\D\D\D\D\D\D\D\D\D\D", @"adgo[oFSOPE$%^!@#4");
  check(@"\s\s\s\s", "\n\r\t ");
  checkNeg(@"\s", @"`1234567890-=+_)(*&^%$#@!~asjkfh;afGHJWGEFRG");
  checkNeg(@"\S", "\n\r\t ");
  check(@"\S\S\S\S\S\S\S\S\S\S\S\S\S\S\S\S\S\S\S\S\S", @"`1234567890-=+_)(*&^%$#@!~asjkfh;afGHJWGEFRG");
  
  // CharacterClass
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
  check(@"[\*&$]{3}", @"123*&$abc");
  check(@"[\d][\n][^\d]", "line1\nline2");
  check(@"[\+--]", ",");
  check("[--0]", "/");
  check("[---]", "-");
  check("[a-cA-C]", "bB");
  check(@"[\u0061-\u007A]", "f");
  checkNeg("[]", "a[b\n[]\tc]d");
  checkNeg("[]a", "\0a\0a");
  checkNeg("a[]", "\0a\0a");
  checkNeg("ab[erst]de", "abcde");
  check("[^]a", "a\naba");
  check("a[^]", "   a\t\n");
  check(@"a[^b-z]\s+", "ab an az aY n");
  check("a[^1-9]c", "abc");
  checkNeg("a[^b]c", "abc");
  check("[^a-z]{4}", @"abc#$%def%&*@ghi");
  check("[^]", @"abc#$%def%&*@ghi");
  check(@"[^\b]+", "easy\bto\u0008ride");
//  check(@"[\d][\0012-\0014]{1,}[^\d]", "line1\n\n\n\n\nline2"); // issue 1297
}

void check(String pattern, String str, [bool multiLine = false, bool ignoreCase = false]) {
  RegExp re = new RegExp(pattern, multiLine, ignoreCase);
  if(!re.hasMatch(str)) {
    Expect.fail("'/$pattern/' !~ '$str'");
  }
}

void checkNeg(String pattern, String str, [bool multiLine = false, bool ignoreCase = false]) {
  RegExp re = new RegExp(pattern, multiLine, ignoreCase);
  if(re.hasMatch(str)) {
    Expect.fail("'/$pattern/' ~ '$str'");
  }
}
