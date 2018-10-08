/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns an ordered collection of matches of the regular expression
 * in [str]. The order in the collection is the order of the matches found
 * in [str].
 * @description Checks that all matches are returned in correct order
 * @author rodionov
 */
import "../../../Utils/expect.dart";
 
main() {
  check(r"^[^\n\r]+$", "pilOt\nsoviet\trobot\r\nopenoffice", true, false,
      [[0, 5, "pilOt"], 
       [6, 18, "soviet\trobot"],
       [20, 30, "openoffice"]]);

  check(r"^(a+)\1*,\1+$", "aaaaaaaaa,aaaaaa\naa,aaaa\naaaaa,a", true, false,
      [[0, 16, "aaaaaaaaa,aaaaaa", "aaa"],
       [17, 24, "aa,aaaa", "aa"],
       [25, 32, "aaaaa,a", "a"]]);

  check(r"(ab|cd)+|ef", "AEKFCD", false, true,
       [[4, 6, "CD", "CD"]]);

  checkNeg(r"\bot", "pilot\nsoviet robot\topenoffice");
  checkNeg(r"\2", "");
  checkNeg(r"[A-Z]+", "ß", ignoreCase: true);
}
  
// expMatchesData is a list of matchData
// matchData is a list of the form [int, int, String, String*], where the ints
// correspond to start/end indices of the match, and the strings - to group
// values
void check(String pattern, String str, bool multiLine, bool ignoreCase,
    List expMatchesData) {
  RegExp re = new RegExp(pattern, multiLine: multiLine,
      caseSensitive: !ignoreCase);
  Iterable<Match> matches = re.allMatches(str);
  if(0 == matches.length) {
    Expect.fail("\"$pattern\" !~ \"$str\"");
  }
  Expect.equals(expMatchesData.length, matches.length);

  Iterator<Match> it = matches.iterator;
    expMatchesData.forEach((var expMatch) {
    it.moveNext();
    Match actMatch = it.current;
    
    Expect.equals(expMatch.length, actMatch.groupCount + 3);
    Expect.equals(str, actMatch.input);
    Expect.isTrue(actMatch.pattern.toString().contains(pattern));
    
    Expect.equals(expMatch[0], actMatch.start);
    Expect.equals(expMatch[1], actMatch.end);
    
    for(int i = 0; i <= actMatch.groupCount; i++) {
      String actMatchStr = actMatch.group(i);
      
      String expMatchStr = expMatch[i + 2];
      
      if(expMatchStr != actMatchStr) {
        Expect.fail("Group $i incorrect: '$expMatchStr' expected instead "
            + "of '$actMatchStr'");
      }
    }
  });
}

void checkNeg(String pattern, String str, {bool multiLine: false,
    bool ignoreCase: false}) {
  RegExp re = new RegExp(pattern, multiLine: multiLine,
      caseSensitive: !ignoreCase);
  Iterable<Match> matches = re.allMatches(str);
  Expect.equals(0, matches.length);
}
