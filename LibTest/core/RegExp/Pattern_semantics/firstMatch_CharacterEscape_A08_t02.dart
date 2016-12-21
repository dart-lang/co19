/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.10: The production CharacterEscape ::
 *            UnicodeEscapeSequence evaluates by evaluating the character value
 *            of the UnicodeEscapeSequence (see 7.8.4) and returning its
 *            character result.<br/> HexEscapeSequence :: u HexDigit HexDigit
 *            HexDigit HexDigit
 * @description Checks the assertion using characters from the English and
 *              Russian alphabets.
 * @3rdparty sputnik-v1:S15.10.2.10_A4.1_T2.js, S15.10.2.10_A4.1_T3.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  Map<String, String> codes = const {
    "0041" : "A", "0042" : "B", "0043" : "C", "0044" : "D", "0045" : "E",
    "0046" : "F", "0047" : "G", "0048" : "H", "0049" : "I", "004A" : "J",
    "004B" : "K", "004C" : "L", "004D" : "M", "004E" : "N", "004F" : "O",
    "0050" : "P", "0051" : "Q", "0052" : "R", "0053" : "S", "0054" : "T",
    "0055" : "U", "0056" : "V", "0057" : "W", "0058" : "X", "0059" : "Y",
    "005A" : "Z",
    
    "0061" : "a", "0062" : "b", "0063" : "c", "0064" : "d", "0065" : "e",
    "0066" : "f", "0067" : "g", "0068" : "h", "0069" : "i", "006A" : "j",
    "006B" : "k", "006C" : "l", "006D" : "m", "006E" : "n", "006F" : "o",
    "0070" : "p", "0071" : "q", "0072" : "r", "0073" : "s", "0074" : "t",
    "0075" : "u", "0076" : "v", "0077" : "w", "0078" : "x", "0079" : "y",
    "007A" : "z",
    
    "0410" : "\u0410", "0411" : "\u0411", "0412" : "\u0412", "0413" : "\u0413",
    "0414" : "\u0414", "0415" : "\u0415", "0416" : "\u0416", "0417" : "\u0417",
    "0418" : "\u0418", "0419" : "\u0419", "041A" : "\u041A", "041B" : "\u041B",
    "041C" : "\u041C", "041D" : "\u041D", "041E" : "\u041E", "041F" : "\u041F",
    "0420" : "\u0420", "0421" : "\u0421", "0422" : "\u0422", "0423" : "\u0423",
    "0424" : "\u0424", "0425" : "\u0425", "0426" : "\u0426", "0427" : "\u0427",
    "0428" : "\u0428", "0429" : "\u0429", "042A" : "\u042A", "042B" : "\u042B",
    "042C" : "\u042C", "042D" : "\u042D", "042E" : "\u042E", "042F" : "\u042F",
    "0401" : "\u0401",

    "0430" : "\u0430", "0431" : "\u0431", "0432" : "\u0432", "0433" : "\u0433",
    "0434" : "\u0434", "0435" : "\u0435", "0436" : "\u0436", "0437" : "\u0437",
    "0438" : "\u0438", "0439" : "\u0439", "043a" : "\u043a", "043b" : "\u043b",
    "043c" : "\u043c", "043d" : "\u043d", "043e" : "\u043e", "043f" : "\u043f",
    "0440" : "\u0440", "0441" : "\u0441", "0442" : "\u0442", "0443" : "\u0443",
    "0444" : "\u0444", "0445" : "\u0445", "0446" : "\u0446", "0447" : "\u0447",
    "0448" : "\u0448", "0449" : "\u0449", "044a" : "\u044a", "044b" : "\u044b",
    "044c" : "\u044c", "044d" : "\u044d", "044e" : "\u044e", "044f" : "\u044f",
    "0451" : "\u0451"
  };
  
  StringBuffer errStr = new StringBuffer();
  codes.forEach((String key, String value) {
    RegExp re = new RegExp("\\u$key");
    if(null == re.firstMatch(value)) {
      errStr.write("\"\\u${key}\" does not match \"${value}\"\n");
    } 
  });
  
  if(errStr.length > 0) {
    Expect.fail(errStr.toString());
  }
}
