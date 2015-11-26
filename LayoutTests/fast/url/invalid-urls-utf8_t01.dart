/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description This ensure we do not mess up the bytes when an URL is partially parsed and is invalid.
 * of this test are set to the behavior in IDNA2008.
 */
import "../../testharness.dart";
import "resources/utilities.dart";

const String htmlEL1 = r'''
<!-- Set the base so that the current URL does not affect the tests. -->
<base href="">
</head>
<body>
''';

// Those are all invalid URLs. They should not be partially modified by the parser.
List testSet = [
    // Empty Authority for a standard hierachical URL.
    'http:///',
    'https:///',
    'ftp:///',
    'gopher:///',
    'ws:///',
    'wss:///',

    // Invalid Authority.
    'foo://tête à tête@host/',
    'foo://user:tête à tête@host/',
    '    foo://<>@host/    ',
    '    foo://user:<>@host/    ',
    'foo://user:password@[xxxxx]/tête à tête/',

    // The '?' is a path separator and make sure the hostname is not encoded in punicode. The hostname is an invalid IPV6 hostname.
    'foo://user:password@[?tête à tête/',
    'foo://user:password@[?tête à tête]/',
    'foo://user:password@host:tête à tête/',
    'foo://user:password@host:80tête à tête',
    'foo://user:password@host:tête à tête/',
    'foo://user:password@host:80tête à tête',
    // The schemes "ws:", "ftp:", "http:", "https:", "gother:" take a shortcut during parsing so we test them separately.
    'ws:/tête',
    'ftp:/tête',
    'http:/tête',
    'https:/tête',
    'gopher:/tête',
];

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());

    for (var i = 0; i < testSet.length; ++i) {
        var src = canonicalize(testSet[i]);
        var expected = testSet[i].trim();
        shouldBe(src, expected, "$i");
    }
    checkTestFailures();
}
