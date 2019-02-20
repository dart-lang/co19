/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Entities in attributes
 */
import "dart:html";
import "../../testcommon.dart" as tc;
import "../../testharness.dart";

List<String> entities = [
  "AElig;",
  "AElig",
  "AMP;",
  "AMP",
  "Aacute;",
  "Aacute",
  "Acirc;",
  "Acirc",
  "Agrave;",
  "Agrave",
  "Alpha;",
  "Aring;",
  "Aring",
  "Atilde;",
  "Atilde",
  "Auml;",
  "Auml",
  "Beta;",
  "COPY;",
  "COPY",
  "Ccedil;",
  "Ccedil",
  "Chi;",
  "Dagger;",
  "Delta;",
  "ETH;",
  "ETH",
  "Eacute;",
  "Eacute",
  "Ecirc;",
  "Ecirc",
  "Egrave;",
  "Egrave",
  "Epsilon;",
  "Eta;",
  "Euml;",
  "Euml",
  "GT;",
  "GT",
  "Gamma;",
  "Iacute;",
  "Iacute",
  "Icirc;",
  "Icirc",
  "Igrave;",
  "Igrave",
  "Iota;",
  "Iuml;",
  "Iuml",
  "Kappa;",
  "LT;",
  "LT",
  "Lambda;",
  "Mu;",
  "Ntilde;",
  "Ntilde",
  "Nu;",
  "OElig;",
  "Oacute;",
  "Oacute",
  "Ocirc;",
  "Ocirc",
  "Ograve;",
  "Ograve",
  "Omega;",
  "Omicron;",
  "Oslash;",
  "Oslash",
  "Otilde;",
  "Otilde",
  "Ouml;",
  "Ouml",
  "Phi;",
  "Pi;",
  "Prime;",
  "Psi;",
  "QUOT;",
  "QUOT",
  "REG;",
  "REG",
  "Rho;",
  "Scaron;",
  "Sigma;",
  "THORN;",
  "THORN",
  "TRADE;",
  "Tau;",
  "Theta;",
  "Uacute;",
  "Uacute",
  "Ucirc;",
  "Ucirc",
  "Ugrave;",
  "Ugrave",
  "Upsilon;",
  "Uuml;",
  "Uuml",
  "Xi;",
  "Yacute;",
  "Yacute",
  "Yuml;",
  "Zeta;",
  "aacute;",
  "aacute",
  "acirc;",
  "acirc",
  "acute;",
  "acute",
  "aelig;",
  "aelig",
  "agrave;",
  "agrave",
  "alefsym;",
  "alpha;",
  "amp;",
  "amp",
  "and;",
  "ang;",
  "apos;",
  "aring;",
  "aring",
  "asymp;",
  "atilde;",
  "atilde",
  "auml;",
  "auml",
  "bdquo;",
  "beta;",
  "brvbar;",
  "brvbar",
  "bull;",
  "cap;",
  "ccedil;",
  "ccedil",
  "cedil;",
  "cedil",
  "cent;",
  "cent",
  "chi;",
  "circ;",
  "clubs;",
  "cong;",
  "copy;",
  "copy",
  "crarr;",
  "cup;",
  "curren;",
  "curren",
  "dArr;",
  "dagger;",
  "darr;",
  "deg;",
  "deg",
  "delta;",
  "diams;",
  "divide;",
  "divide",
  "eacute;",
  "eacute",
  "ecirc;",
  "ecirc",
  "egrave;",
  "egrave",
  "empty;",
  "emsp;",
  "ensp;",
  "epsilon;",
  "equiv;",
  "eta;",
  "eth;",
  "eth",
  "euml;",
  "euml",
  "euro;",
  "exist;",
  "fnof;",
  "forall;",
  "frac12;",
  "frac12",
  "frac14;",
  "frac14",
  "frac34;",
  "frac34",
  "frasl;",
  "gamma;",
  "ge;",
  "gt;",
  "gt",
  "hArr;",
  "harr;",
  "hearts;",
  "hellip;",
  "iacute;",
  "iacute",
  "icirc;",
  "icirc",
  "iexcl;",
  "iexcl",
  "igrave;",
  "igrave",
  "image;",
  "infin;",
  "int;",
  "iota;",
  "iquest;",
  "iquest",
  "isin;",
  "iuml;",
  "iuml",
  "kappa;",
  "lArr;",
  "lambda;",
  "lang;",
  "laquo;",
  "laquo",
  "larr;",
  "lceil;",
  "ldquo;",
  "le;",
  "lfloor;",
  "lowast;",
  "loz;",
  "lrm;",
  "lsaquo;",
  "lsquo;",
  "lt;",
  "lt",
  "macr;",
  "macr",
  "mdash;",
  "micro;",
  "micro",
  "middot;",
  "middot",
  "minus;",
  "mu;",
  "nabla;",
  "nbsp;",
  "nbsp",
  "ndash;",
  "ne;",
  "ni;",
  "not;",
  "not",
  "notin;",
  "nsub;",
  "ntilde;",
  "ntilde",
  "nu;",
  "oacute;",
  "oacute",
  "ocirc;",
  "ocirc",
  "oelig;",
  "ograve;",
  "ograve",
  "oline;",
  "omega;",
  "omicron;",
  "oplus;",
  "or;",
  "ordf;",
  "ordf",
  "ordm;",
  "ordm",
  "oslash;",
  "oslash",
  "otilde;",
  "otilde",
  "otimes;",
  "ouml;",
  "ouml",
  "para;",
  "para",
  "part;",
  "permil;",
  "perp;",
  "phi;",
  "pi;",
  "piv;",
  "plusmn;",
  "plusmn",
  "pound;",
  "pound",
  "prime;",
  "prod;",
  "prop;",
  "psi;",
  "quot;",
  "quot",
  "rArr;",
  "radic;",
  "rang;",
  "raquo;",
  "raquo",
  "rarr;",
  "rceil;",
  "rdquo;",
  "real;",
  "reg;",
  "reg",
  "rfloor;",
  "rho;",
  "rlm;",
  "rsaquo;",
  "rsquo;",
  "sbquo;",
  "scaron;",
  "sdot;",
  "sect;",
  "sect",
  "shy;",
  "shy",
  "sigma;",
  "sigmaf;",
  "sim;",
  "spades;",
  "sub;",
  "sube;",
  "sum;",
  "sup1;",
  "sup1",
  "sup2;",
  "sup2",
  "sup3;",
  "sup3",
  "sup;",
  "supe;",
  "szlig;",
  "szlig",
  "tau;",
  "there4;",
  "theta;",
  "thetasym;",
  "thinsp;",
  "thorn;",
  "thorn",
  "tilde;",
  "times;",
  "times",
  "trade;",
  "uArr;",
  "uacute;",
  "uacute",
  "uarr;",
  "ucirc;",
  "ucirc",
  "ugrave;",
  "ugrave",
  "uml;",
  "uml",
  "upsih;",
  "upsilon;",
  "uuml;",
  "uuml",
  "weierp;",
  "xi;",
  "yacute;",
  "yacute",
  "yen;",
  "yen",
  "yuml;",
  "yuml",
  "zeta;",
  "zwj;",
  "zwnj;",
  "#0;",
  "#65;",
  "#55296;",
  "#57343;",
  "#2147483647;",
  "#2147483648;",
  "#4294967361;",
];

List<String> characters = [
  "\u00C6",
  "\u00C6",
  "\u0026",
  "\u0026",
  "\u00C1",
  "\u00C1",
  "\u00C2",
  "\u00C2",
  "\u00C0",
  "\u00C0",
  "\u0391",
  "\u00C5",
  "\u00C5",
  "\u00C3",
  "\u00C3",
  "\u00C4",
  "\u00C4",
  "\u0392",
  "\u00A9",
  "\u00A9",
  "\u00C7",
  "\u00C7",
  "\u03A7",
  "\u2021",
  "\u0394",
  "\u00D0",
  "\u00D0",
  "\u00C9",
  "\u00C9",
  "\u00CA",
  "\u00CA",
  "\u00C8",
  "\u00C8",
  "\u0395",
  "\u0397",
  "\u00CB",
  "\u00CB",
  "\u003E",
  "\u003E",
  "\u0393",
  "\u00CD",
  "\u00CD",
  "\u00CE",
  "\u00CE",
  "\u00CC",
  "\u00CC",
  "\u0399",
  "\u00CF",
  "\u00CF",
  "\u039A",
  "\u003C",
  "\u003C",
  "\u039B",
  "\u039C",
  "\u00D1",
  "\u00D1",
  "\u039D",
  "\u0152",
  "\u00D3",
  "\u00D3",
  "\u00D4",
  "\u00D4",
  "\u00D2",
  "\u00D2",
  "\u03A9",
  "\u039F",
  "\u00D8",
  "\u00D8",
  "\u00D5",
  "\u00D5",
  "\u00D6",
  "\u00D6",
  "\u03A6",
  "\u03A0",
  "\u2033",
  "\u03A8",
  "\u0022",
  "\u0022",
  "\u00AE",
  "\u00AE",
  "\u03A1",
  "\u0160",
  "\u03A3",
  "\u00DE",
  "\u00DE",
  "\u2122",
  "\u03A4",
  "\u0398",
  "\u00DA",
  "\u00DA",
  "\u00DB",
  "\u00DB",
  "\u00D9",
  "\u00D9",
  "\u03A5",
  "\u00DC",
  "\u00DC",
  "\u039E",
  "\u00DD",
  "\u00DD",
  "\u0178",
  "\u0396",
  "\u00E1",
  "\u00E1",
  "\u00E2",
  "\u00E2",
  "\u00B4",
  "\u00B4",
  "\u00E6",
  "\u00E6",
  "\u00E0",
  "\u00E0",
  "\u2135",
  "\u03B1",
  "\u0026",
  "\u0026",
  "\u2227",
  "\u2220",
  "\u0027",
  "\u00E5",
  "\u00E5",
  "\u2248",
  "\u00E3",
  "\u00E3",
  "\u00E4",
  "\u00E4",
  "\u201E",
  "\u03B2",
  "\u00A6",
  "\u00A6",
  "\u2022",
  "\u2229",
  "\u00E7",
  "\u00E7",
  "\u00B8",
  "\u00B8",
  "\u00A2",
  "\u00A2",
  "\u03C7",
  "\u02C6",
  "\u2663",
  "\u2245",
  "\u00A9",
  "\u00A9",
  "\u21B5",
  "\u222A",
  "\u00A4",
  "\u00A4",
  "\u21D3",
  "\u2020",
  "\u2193",
  "\u00B0",
  "\u00B0",
  "\u03B4",
  "\u2666",
  "\u00F7",
  "\u00F7",
  "\u00E9",
  "\u00E9",
  "\u00EA",
  "\u00EA",
  "\u00E8",
  "\u00E8",
  "\u2205",
  "\u2003",
  "\u2002",
  "\u03B5",
  "\u2261",
  "\u03B7",
  "\u00F0",
  "\u00F0",
  "\u00EB",
  "\u00EB",
  "\u20AC",
  "\u2203",
  "\u0192",
  "\u2200",
  "\u00BD",
  "\u00BD",
  "\u00BC",
  "\u00BC",
  "\u00BE",
  "\u00BE",
  "\u2044",
  "\u03B3",
  "\u2265",
  "\u003E",
  "\u003E",
  "\u21D4",
  "\u2194",
  "\u2665",
  "\u2026",
  "\u00ED",
  "\u00ED",
  "\u00EE",
  "\u00EE",
  "\u00A1",
  "\u00A1",
  "\u00EC",
  "\u00EC",
  "\u2111",
  "\u221E",
  "\u222B",
  "\u03B9",
  "\u00BF",
  "\u00BF",
  "\u2208",
  "\u00EF",
  "\u00EF",
  "\u03BA",
  "\u21D0",
  "\u03BB",
  "\u27e8",
  "\u00AB",
  "\u00AB",
  "\u2190",
  "\u2308",
  "\u201C",
  "\u2264",
  "\u230A",
  "\u2217",
  "\u25CA",
  "\u200E",
  "\u2039",
  "\u2018",
  "\u003C",
  "\u003C",
  "\u00AF",
  "\u00AF",
  "\u2014",
  "\u00B5",
  "\u00B5",
  "\u00B7",
  "\u00B7",
  "\u2212",
  "\u03BC",
  "\u2207",
  "\u00A0",
  "\u00A0",
  "\u2013",
  "\u2260",
  "\u220B",
  "\u00AC",
  "\u00AC",
  "\u2209",
  "\u2284",
  "\u00F1",
  "\u00F1",
  "\u03BD",
  "\u00F3",
  "\u00F3",
  "\u00F4",
  "\u00F4",
  "\u0153",
  "\u00F2",
  "\u00F2",
  "\u203E",
  "\u03C9",
  "\u03BF",
  "\u2295",
  "\u2228",
  "\u00AA",
  "\u00AA",
  "\u00BA",
  "\u00BA",
  "\u00F8",
  "\u00F8",
  "\u00F5",
  "\u00F5",
  "\u2297",
  "\u00F6",
  "\u00F6",
  "\u00B6",
  "\u00B6",
  "\u2202",
  "\u2030",
  "\u22A5",
  "\u03C6",
  "\u03C0",
  "\u03D6",
  "\u00B1",
  "\u00B1",
  "\u00A3",
  "\u00A3",
  "\u2032",
  "\u220F",
  "\u221D",
  "\u03C8",
  "\u0022",
  "\u0022",
  "\u21D2",
  "\u221A",
  "\u27e9",
  "\u00BB",
  "\u00BB",
  "\u2192",
  "\u2309",
  "\u201D",
  "\u211C",
  "\u00AE",
  "\u00AE",
  "\u230B",
  "\u03C1",
  "\u200F",
  "\u203A",
  "\u2019",
  "\u201A",
  "\u0161",
  "\u22C5",
  "\u00A7",
  "\u00A7",
  "\u00AD",
  "\u00AD",
  "\u03C3",
  "\u03C2",
  "\u223C",
  "\u2660",
  "\u2282",
  "\u2286",
  "\u2211",
  "\u00B9",
  "\u00B9",
  "\u00B2",
  "\u00B2",
  "\u00B3",
  "\u00B3",
  "\u2283",
  "\u2287",
  "\u00DF",
  "\u00DF",
  "\u03C4",
  "\u2234",
  "\u03B8",
  "\u03D1",
  "\u2009",
  "\u00FE",
  "\u00FE",
  "\u02DC",
  "\u00D7",
  "\u00D7",
  "\u2122",
  "\u21D1",
  "\u00FA",
  "\u00FA",
  "\u2191",
  "\u00FB",
  "\u00FB",
  "\u00F9",
  "\u00F9",
  "\u00A8",
  "\u00A8",
  "\u03D2",
  "\u03C5",
  "\u00FC",
  "\u00FC",
  "\u2118",
  "\u03BE",
  "\u00FD",
  "\u00FD",
  "\u00A5",
  "\u00A5",
  "\u00FF",
  "\u00FF",
  "\u03B6",
  "\u200D",
  "\u200C",
  "\uFFFD",
  "\u0041",
  "\uFFFD",
  "\uFFFD",
  "\uFFFD",
  "\uFFFD",
  "\uFFFD"
  ];
  
void runTest(e) {

  String entity, character, characterCode, result, resultCode;
  for (int i = 0, len = entities.length; i < len; ++i) {
    entity = entities[i];
    Element elm = new Element.html("<p><span title=&${entity}X></span></p>");
    character = characters[i];
    resultCode = characterCode = "";
    result = (elm.firstChild as Element).getAttribute("title").split("X")[0];
    if (result.length == 1) {
      resultCode = " (\\u${result.codeUnitAt(0).toRadixString(16)})";
    }
    if (character.length == 1) {
      characterCode = " (\\u${character.codeUnitAt(0).toRadixString(16)})";
    }
    String diag = null;
    if (entity.endsWith(';')) {
      if (result != character)
        diag = "actual: $result $resultCode, expected: $character $characterCode";
    } else {
      if (result != "&$entity")
        diag = "actual: $result $resultCode, expected: &$entity";
    }
    if (diag == null) {
      testPassed("$entity");
    } else {
      testFailed("$entity", diag);
    }
  }
  checkTestFailures();
}

void main() {
    tc.addOnLoadListener((_) {
      runTest(_);
    });
}
