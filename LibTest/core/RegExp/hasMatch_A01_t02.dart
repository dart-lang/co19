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
 * @note issue 1297
 */
import "../../../Utils/expect.dart";

main() {
  // Disjunction
  check("a|ab", "abc");
  check(r"\d{3}|[a-z]{4}", "2, 12 and of course repeat 12");
  checkNeg(r"\d{3}|[a-z]{4}", "2, 12 and 23 AND 0.00.1");
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
  check(r"^(a+)\1*,\1+$", "aaaaaaaaa,aaaaaa");
  check(r"^(a+)\1*,\1+$", "aaaaaa,aaaaaaaaa");
  check(r"^(a+?)\1*,\1+$", "aaaaaaaaa,aaaaaa");
  check(r"^(a+?)\1*,\1+$", "aaaaaa,aaaaaaaaa");
  
  check("(z)((a+)?(b+)?(c))*", "zaacbbbcac");
  check("(z)((a+)?(b+)?(c))*", "zaacbbbc");
  
  check(r"(a*)b\1+", "baaaac");
  check("(a*)*", "b");

  // Assertion
  checkNeg("^m", "pairs\nmakes\tdouble");
  check("^m", "pairs\nmakes\tdouble", multiLine: true);
  check(r"^\d+", "abc\n123xyz", multiLine: true);
  check("^p[a-z]", "pairs\nmakes\tdouble\npesos");
  checkNeg("^p[b-z]", "pairs\nmakes\tdouble\npesos");
  check("^p[b-z]", "pairs\nmakes\tdouble\npesos", multiLine: true);
  check("^[^p]", "pairs\nmakes\tdouble\npesos", multiLine: true);
  check("^ab", "abcde");
  checkNeg("^..^e", "ab\ncde");
  checkNeg("^xxx", "yyyyy");
  check(r"^\^+", "^^^x");

  checkNeg(r"s$", "pairs\nmakes\tdouble");
  check(r"e$", "pairs\nmakes\tdouble");
  check(r"s$", "pairs\nmakes\tdouble", multiLine: true);
  check(r"[^e]$", "pairs\nmakes\tdouble", multiLine: true);
  check(r"es$", "pairs\nmakes\tdoubl\u0065s", multiLine: true);
  
  check(r"\bp", "pilot\nsoviet robot\topenoffice");
  check(r"ot\b", "pilot\nsoviet robot\topenoffice");
  checkNeg(r"\bot", "pilot\nsoviet robot\topenoffice");
  check(r"\bso", "pilot\nsoviet robot\topenoffice");
  checkNeg(r"so\b", "pilot\nsoviet robot\topenoffice");
  check(r"[^o]t\b", "pilOt\nsoviet robot\topenoffice");
  check(r"[^o]t\b", "pilOt\nsoviet robot\topenoffice", ignoreCase:true);
  check(r"\bro", "pilot\nsoviet robot\topenoffice");
  checkNeg(r"r\b", "pilot\nsoviet robot\topenoffice");
  check(r"\brobot\b", "pilot\nsoviet robot\topenoffice");
  check(r"\b\w{5}\b", "pilot\nsoviet robot\topenoffice");
  check(r"\bop", "pilot\nsoviet robot\topenoffice");
  checkNeg(r"op\b", "pilot\nsoviet robot\topenoffice");
  check(r"e\b", "pilot\nsoviet robot\topenoffic\u0065");
  checkNeg(r"\be", "pilot\nsoviet robot\topenoffic\u0065");
  
  check(r"\Bevil\B", "devils arise\tfor\nevil");
  check(r"[f-z]e\B", "devils arise\tfor\nrevil");
  check(r"\Bo\B", "devils arise\tfOr\nrevil", ignoreCase:true);
  check(r"\B\w\B", "devils arise\tfor\nrevil");
  check(r"\w\B", "devils arise\tfor\nrevil");
  check(r"\B\w", "devils arise\tfor\nrevil");
  checkNeg(r"\B[a-yA-Y]{4}\B", "devil arise\tforzzx\nevils");
  check(r"\B\w{4}\B", "devil arise\tforzzx\nevils");
  
  check(r"^^^^^^^\b\b\b\bro\B\B\B\Bbot\b\b\b\b\b$$$$", "robot");

  
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
  check(r"(\d*)(\d+)", "0123456789");
  check(r"(\d*)\d(\d+)", "0123456789");
  check("(x+)(x*)", "xxxxxxx");
  check(r"x*y+$", "xxxxxxyyyyyy");
  check(r"[\d]*[\s]*bc.", "abcdef");
  check(r"bc..[\d]*[\s]*", "abcdef");
  check(".*", "a1b2c3");
  checkNeg("[xyz]*1", "a0.b2.c3");

  check(r"\s+java\s+", "language  java\n");
  check(r"\s+java\s+", "\t java object");
  checkNeg(r"\s+java\s+", "\t javax package");
  checkNeg(r"\s+java\s+", "java\n\nobject");
  check(r"[a-z]+\d+", "x 2 ff 55 x2 as1 z12 abc12.0");
  check(r"[a-z]+\d+", "__abc123.0");
  check(r"[a-z]+(\d+)", "x 2 ff 55 x2 as1 z12 abc12.0");
  check(r"[a-z]+(\d+)", "__abc123.0");
  check("d+", "abcdddddefg");
  checkNeg("o+", "abcdddddefg");
  check("d+", "abcdefg");
  check("(b+)(b+)(b+)", "abbbbbbbc");
  check("(b+)(b*)", "abbbbbbbc");
  check("b*b+", "abbbbbbbc");
  
  check("java(script)?", "state: javascript is an extension of ecma script");
  check("java(script)?", "state: java and javascript are vastly different");
  checkNeg("java(script)?",
      "state: both Java and JavaScript used in web development");
  check("cd?e", "abcdef");
  check("cdx?e", "abcdef");
  check("o?pqrst", "pqrstuvw");
  check("x?y?z?", "abcdef");
  check("x?ay?bz?c", "abcdef");
  check("b?b?b?b", "abbbbc");
  check("ab?c?d?x?y?z", "123az789");
  check(r"\??\??\??\??\??", "?????");
  check(".?.?.?.?.?.?.?", "test");
  
  check(r"[a-zA-Z]{3}\d{2}", "xa124dfdg08");
  check(r"b{2}c", "aaabbbbcccddeeeefffff");
  checkNeg(r"b{8}", "aaabbbbcccddeeeefffff");
  
  check(r"b{2,}c", "aaabbbbcccddeeeefffff");
  checkNeg(r"b{8,}c", "aaabbbbcccddeeeefffff");
  check(r"\d{1,}", "wqe456646dsff");
  check(r"(123){1,}", "123123");
  check(r"(123){1,}?", "123123");
  check(r"(123){1,}x\1", "123123x123");
  check(r"x{1,2}x{1,}", "xxxxxxx");
  
  check(r"\d{2,4}", "the answer is 42");
  checkNeg(r"\d{2,4}", "the 7 movie");
  check(r"\d{2,4}", "the 20000 Leagues Under the Sea book");
  check(r"\d{2,4}", "the Fahrenheit 451 book");
  check(r"\d{2,4}", "the 1984 novel");
  check(r"\d{2,4}", "0a0\u0031\u0031b");
  check(r"\d{2,4}", "0a0\u0031\u003122b");
  check(r"b{2,3}c", "aaabbbbcccddeeeefffff");
  checkNeg(r"b{42,93}c", "aaabbbbcccddeeeefffff");
  check(r"b{0,93}c", "aaabbbbcccddeeeefffff");
  check(r"bx{0,93}c", "aaabbbbcccddeeeefffff");
  check(r".{0,93}", "weirwerdf");
  
  // Atom
  check(r"(?=(a+))", "baaabac");
  check(r"(?=(a+))a*b\1", "baaabac");
  check(r"[Jj]ava([Ss]cript)?(?=\:)", "just Javascript: the way af jedi");
  check(r"[Jj]ava([Ss]cript)?(?=\:)", "taste of java: the cookbook");
  checkNeg(r"[Jj]ava([Ss]cript)?(?=\:)", "rhino is JavaScript engine");
  
  check(r"Java(?!Script)([A-Z]\w*)", "using of JavaBeans technology");
  checkNeg(r"Java(?!Script)([A-Z]\w*)", "using of Java language");
  checkNeg(r"Java(?!Script)([A-Z]\w*)", "I\"m a JavaScripter");
  check(r"Java(?!Script)([A-Z]\w*)", "JavaScr oops ipt ");
  check(r"(\.(?!com|org)|/)", "ah.info");
  check(r"(\.(?!com|org)|/)", "ah/info");
  checkNeg(r"(\.(?!com|org)|/)", "ah.com");
  check(r"(?!a|b)|c", "");
  check(r"(?!a|b)|c", "bc");
  check(r"(?!a|b)|c", "d");
  check(r"(.*?)a(?!(a+)b\2c)\2(.*)", "baaabaac");
  
  check(r"([Jj]ava([Ss]cript)?)\sis\s(fun\w*)",
      "Learning javaScript is funny, really");
  check(r"([Jj]ava([Ss]cript)?)\sis\s(fun\w*)",
      "Developing with Java is fun, try it");
  checkNeg(r"([Jj]ava([Ss]cript)?)\sis\s(fun\w*)",
      "Developing with JavaScript is dangerous, do not try it without assistance");
  check(r"(abc)", "abc");
  check(r"a(bc)d(ef)g", "abcdefg");
  check(r"(.{3})(.{4})", "abcdefgh");
  check(r"(aa)bcd\1", "aabcdaabcd");
  check(r"(aa).+\1", "aabcdaabcd");
  check(r"(.{2}).+\1", "aabcdaabcd");
  check(r"(\d{3})(\d{3})\1\2", "123456123456");
  check(r"a(..(..)..)", "abcdefgh");
  check(r"(a(b(c)))(d(e(f)))", "xabcdefg");
  check(r"(a(b(c)))(d(e(f)))\2\5", "xabcdefbcefg");
  check(r"a(.?)b\1c\1d\1", "abcd");
  check(r"([\S]+([ \t]+[\S]+)*)[ \t]*=[ \t]*[\S]+", "Course_Creator = Test");
  check(r"^(A)?(A.*)$", "AAA");
  check(r"^(A)?(A.*)$", "AA");
  check(r"^(A)?(A.*)$", "A");
  check(r"(A)?(A.*)", "zxcasd;fl\\  ^AAAaaAAaaaf;lrlrzs");
  check(r"(A)?(A.*)", "zxcasd;fl\\  ^AAaaAAaaaf;lrlrzs");
  check(r"(A)?(A.*)", "zxcasd;fl\\  ^AaaAAaaaf;lrlrzs");
  check(r"(a)?a", "a");
  check(r"a|(b)", "a");
  check(r"(a)?(a)", "a");
  check(r"^([a-z]+)*[a-z]$", "a");
  check(r"^([a-z]+)*[a-z]$", "ab");
  check(r"^([a-z]+)*[a-z]$", "abc");
  check(r"^(([a-z]+)*[a-z]\.)+[a-z]{2,}$", "www.netscape.com");
  check(r"^(([a-z]+)*([a-z])\.)+[a-z]{2,}$", "www.netscape.com");

  check(r"ab.de", "abcde");
  check(r".+", "line 1\nline 2");
  check(r".*a.*", "this is a test");
  check(r".+", r"this is a *&^%$# test");
  check(r".+", "....");
  check(r".+", "abcdefghijklmnopqrstuvwxyz");
  check(r".+", "ABCDEFGHIJKLMNOPQRSTUVWXYZ");
  check(r".+", r"`1234567890-=~!@#$%^&*()_+");
  check(r".+", r"""|\[{]};:"',<>.?/""");

  check(r"[a-z]+", "ABC def ghi", ignoreCase:true);
  check(r"[a-z]+", "ABC def ghi");
  checkNeg(r"[A-Z]+", "Р“Сџ", ignoreCase: true);
  checkNeg(r"[A-Z]+", "\u0131", ignoreCase: true);
  checkNeg(r"[A-Z]+", "\u017F", ignoreCase: true);
  
  // AtomEscape
  check(r"\b(\w+) \1\b", "do you listen the the band");
  check(r"([xu]\d{2}([A-H]{2})?)\1", "x09x12x01x01u00FFu00FFx04x04x23");
  check(r"([xu]\d{2}([A-H]{2})?)\1", "x09x12x01x05u00FFu00FFx04x04x23");
  check(r"(a*)b\1+", "baaac");
  
  // CharacterEscape
  check(r"\t", "\u0009");
  check(r"\t\t", "\u0009\u0009asf");
  check(r"\n", "\u000A");
  check(r"\n\n", "\u000A\u000Aasf");
  check(r"\v", "\u000B");
  check(r"\v\v", "\u000B\u000Basf");
  check(r"\f", "\u000C");
  check(r"\f\f", "\u000C\u000Casf");
  check(r"\r", "\u000D");
  check(r"\r\r", "\u000D\u000Dasf");
  
  // DecimalEscape
  check(r"\0", "\u0000");
  check(r"\0\0", "\u0000\u0000asf");
  checkNeg(r"\00", "");
  checkNeg(r"\011", "");
  checkNeg(r"\1", "");
  checkNeg(r"\2", "");
  checkNeg(r"\3", "");
  checkNeg(r"\4", "");
  checkNeg(r"\10", "");
  checkNeg(r"\100", "");
  checkNeg(r"(A)\2", "AA");
  check(r"(A)\1", "AA");
  check(r"\1(A)", "AA");
  check(r"(A)\1(B)\2", "AABB");
  check(r"\1(A)(B)\2", "ABB");
  check(r"((((((((((A))))))))))\1\2\3\4\5\6\7\8\9\10", "AAAAAAAAAAA");
  check(r"((((((((((A))))))))))\10\9\8\7\6\5\4\3\2\1", "AAAAAAAAAAA");
  
  // CharacterClassEscape
  check(r"\d\d\d", "150");
  checkNeg(r"\d", r"adgo[oFSOPE$%^!@#$");
  checkNeg(r"\D", "150");
  check(r"\D\D\D\D\D\D\D\D\D\D\D\D\D\D\D", r"adgo[oFSOPE$%^!@#4");
  check(r"\s\s\s\s", "\n\r\t ");
  checkNeg(r"\s", r"`1234567890-=+_)(*&^%$#@!~asjkfh;afGHJWGEFRG");
  checkNeg(r"\S", "\n\r\t ");
  check(r"\S\S\S\S\S\S\S\S\S\S\S\S\S\S\S\S\S\S\S\S\S", r"`1234567890-=+_)(*&^%$#@!~asjkfh;afGHJWGEFRG");
  
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
  check("[^]a", "a\naba");
  check("a[^]", "   a\t\n");
  check(r"a[^b-z]\s+", "ab an az aY n");
  check("a[^1-9]c", "abc");
  checkNeg("a[^b]c", "abc");
  check("[^a-z]{4}", r"abc#$%def%&*@ghi");
  check("[^]", r"abc#$%def%&*@ghi");
  check(r"[^\b]+", "easy\bto\u0008ride");
//  check(r"[\d][\0012-\0014]{1,}[^\d]", "line1\n\n\n\n\nline2"); // issue 1297
}

void check(String pattern, String str, {bool multiLine: false,
  bool ignoreCase: false}) {
  RegExp re = new RegExp(pattern, multiLine: multiLine,
      caseSensitive: !ignoreCase);
  if(!re.hasMatch(str)) {
    Expect.fail("'/$pattern/' !~ '$str'");
  }
}

void checkNeg(String pattern, String str, {bool multiLine: false,
  bool ignoreCase: false}) {
  RegExp re = new RegExp(pattern, multiLine: multiLine,
      caseSensitive: !ignoreCase);
  if(re.hasMatch(str)) {
    Expect.fail("'/$pattern/' ~ '$str'");
  }
}
