/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.10: The production CharacterEscape :: IdentityEscape
 *            evaluates by returning the character represented by
 *            IdentityEscape. <br/> IdentityEscape :: SourceCharacter but not
 *            IdentifierPart
 * @description Checks the matching of the following characters:
 *              ~`!@#$%^&*()-+={[}]|\\:;'<,>./?"
 * @3rdparty sputnik-v1:S15.10.2.10_A5.1_T1.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  String nonIdent = r"""~`!@#$%^&*()-+={[}]|\:;'<,>./"?""";
  
  StringBuffer errStr = new StringBuffer();
  for(int i = 0; i < nonIdent.length; i++) {
    String ch = nonIdent[i];
    RegExp re = new RegExp("\\$ch");
    if(null == re.firstMatch(nonIdent)) {
      errStr.write("\"\\${ch}\" does not match itself\n");
    } 
  }
  
  if(errStr.length > 0) {
    Expect.fail(errStr.toString());
  }
}
