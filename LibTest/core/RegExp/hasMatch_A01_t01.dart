/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether the regular expression has a match in the string
 *            [str].
 * @description Tests whether regular expressions for shallow XML parsing work.
 * @3rdparty sputnik-v1:S15.10.2_A1_T1.js /
 *           http://www.cs.sfu.ca/~cameron/REX.html#AppB
 * @author rodionov
 * @reviewer msyabro
 */

// REX/Javascript 1.0
// Robert D. Cameron "REX: XML Shallow Parsing with Regular Expressions",
// Technical Report TR 1998-17, School of Computing Science, Simon Fraser
// University, November, 1998.
// Copyright (c) 1998, Robert D. Cameron.

main() {
  String TextSE = "[^<]+";
  String UntilHyphen = "[^-]*-";
  String Until2Hyphens = "$UntilHyphen([^-]$UntilHyphen)*-";
  String CommentCE = "$Until2Hyphens>?";
  String UntilRSBs = "[^]]*]([^]]+])*]+";
  String CDATA_CE = '$UntilRSBs([^]>]$UntilRSBs)*>';
  String S = "[ \\n\\t\\r]+";
  String NameStrt = "[A-Za-z_:]|[^\\x00-\\x7F]";
  String NameChar = "[A-Za-z0-9_:.-]|[^\\x00-\\x7F]";
  String Name = "($NameStrt)($NameChar)*";
  String QuoteSE = '"[^"]' "*" '"'  "|'[^']*'";
  String DT_IdentSE = "$S$Name($S($Name|$QuoteSE))*";
  String MarkupDeclCE = "([^]\"'><]+|$QuoteSE)*>";
  String S1 = "[\\n\\r\\t ]";
  String UntilQMs = "[^?]*\\?+";
  String PI_Tail = "\\?>|$S1$UntilQMs([^>?]$UntilQMs)*>";
  String DT_ItemSE = "<(!(--$Until2Hyphens>|[^-]$MarkupDeclCE)|\\?$Name($PI_Tail))|%$Name;|$S";
  String DocTypeCE = "$DT_IdentSE($S)?(\\[($DT_ItemSE)*]($S)?)?>?";
  String DeclCE = "--($CommentCE)?|\\[CDATA\\[($CDATA_CE)?|DOCTYPE($DocTypeCE)?";
  String PI_CE = "$Name($PI_Tail)?";
  String EndTagCE = "$Name($S)?>?";
  String AttValSE = '"[^<"]' "*" '"' "|'[^<']*'";
  String ElemTagCE = "$Name($S$Name($S)?=($S)?($AttValSE))*($S)?/?>?";
  String MarkupSPE = "<(!($DeclCE)?|\\?($PI_CE)?|/($EndTagCE)?|($ElemTagCE)?)";
  String XML_SPE = "$TextSE|$MarkupSPE";
  
  List<String> patterns = [TextSE, UntilHyphen, Until2Hyphens, CommentCE,
    UntilRSBs, CDATA_CE, S, NameStrt, NameChar, Name, QuoteSE, DT_IdentSE,
    MarkupDeclCE, S1,UntilQMs, PI_Tail, DT_ItemSE, DocTypeCE, DeclCE,
    PI_CE, EndTagCE, AttValSE, ElemTagCE, MarkupSPE, XML_SPE];
  
  String html = """
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:xlink="http://www.w3.org/XML/XLink/0.9">
  <head><title>Three Namespaces</title></head>
  <body>
    <h1 align="center">An Ellipse and a Rectangle</h1>
    <svg xmlns="http://www.w3.org/Graphics/SVG/SVG-19991203.dtd"
         width="12cm" height="10cm">
      <ellipse rx="110" ry="130" />
      <rect x="4cm" y="1cm" width="3cm" height="6cm" />
    </svg>
    <p xlink:type="simple" xlink:href="ellipses.html">
      More about ellipses
    </p>
    <p xlink:type="simple" xlink:href="rectangles.html">
      More about rectangles
    </p>
    <hr/>
    <p>Last Modified February 13, 2000</p>
  </body>
</html>
""";

  patterns.forEach((String s) {
    RegExp re = new RegExp(s);
    re.hasMatch(html);
  });
}
