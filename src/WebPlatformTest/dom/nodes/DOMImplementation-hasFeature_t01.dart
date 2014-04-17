/*
 * after web-platform-tests/dom/nodes/DOMImplementation-hasFeature.html
 * <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-domimplementation-hasfeature">
 *
 * @assertion DOMImplementation.hasFeature(feature, version)
 *
 * @description 
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

var tests = [
        ["Core", "1.0"],
        ["Core", "2.0"],
        ["Core", "3.0"],
        ["Core", "100.0"],
        ["XML", "1.0"],
        ["XML", "2.0"],
        ["XML", "3.0"],
        ["XML", "100.0"],
        ["Core", "1"],
        ["Core", "2"],
        ["Core", "3"],
        ["Core", "100"],
        ["XML", "1"],
        ["XML", "2"],
        ["XML", "3"],
        ["XML", "100"],
        ["Core", "1.1"],
        ["Core", "2.1"],
        ["Core", "3.1"],
        ["Core", "100.1"],
        ["XML", "1.1"],
        ["XML", "2.1"],
        ["XML", "3.1"],
        ["XML", "100.1"],
        ["Core", ""],
        ["XML", ""],
        ["core", ""],
        ["xml", ""],
        ["CoRe", ""],
        ["XmL", ""],
        [" Core", ""],
        [" XML", ""],
        ["Core ", ""],
        ["XML ", ""],
        ["Co re", ""],
        ["XM L", ""],
        ["aCore", ""],
        ["aXML", ""],
        ["Corea", ""],
        ["XMLa", ""],
        ["Coare", ""],
        ["XMaL", ""],
        ["Core", " "],
        ["XML", " "],
        ["Core", " 1.0"],
        ["Core", " 2.0"],
        ["Core", " 3.0"],
        ["Core", " 100.0"],
        ["XML", " 1.0"],
        ["XML", " 2.0"],
        ["XML", " 3.0"],
        ["XML", " 100.0"],
        ["Core", "1.0 "],
        ["Core", "2.0 "],
        ["Core", "3.0 "],
        ["Core", "100.0 "],
        ["XML", "1.0 "],
        ["XML", "2.0 "],
        ["XML", "3.0 "],
        ["XML", "100.0 "],
        ["Core", "1. 0"],
        ["Core", "2. 0"],
        ["Core", "3. 0"],
        ["Core", "100. 0"],
        ["XML", "1. 0"],
        ["XML", "2. 0"],
        ["XML", "3. 0"],
        ["XML", "100. 0"],
        ["Core", "a1.0"],
        ["Core", "a2.0"],
        ["Core", "a3.0"],
        ["Core", "a100.0"],
        ["XML", "a1.0"],
        ["XML", "a2.0"],
        ["XML", "a3.0"],
        ["XML", "a100.0"],
        ["Core", "1.0a"],
        ["Core", "2.0a"],
        ["Core", "3.0a"],
        ["Core", "100.0a"],
        ["XML", "1.0a"],
        ["XML", "2.0a"],
        ["XML", "3.0a"],
        ["XML", "100.0a"],
        ["Core", "1.a0"],
        ["Core", "2.a0"],
        ["Core", "3.a0"],
        ["Core", "100.a0"],
        ["XML", "1.a0"],
        ["XML", "2.a0"],
        ["XML", "3.a0"],
        ["XML", "100.a0"],
        ["Core", null],
        ["XML", null],
        ["core", null],
        ["xml", null],
        ["CoRe", null],
        ["XmL", null],
        [" Core", null],
        [" XML", null],
        ["Core ", null],
        ["XML ", null],
        ["Co re", null],
        ["XM L", null],
        ["aCore", null],
        ["aXML", null],
        ["Corea", null],
        ["XMLa", null],
        ["Coare", null],
        ["XMaL", null],
        ["This is filler text.", ""],
      ];

var badTests = [
        ["XML", 1],
        ["XML", 1.0],
        [null, ""],
];

void main() {
  tests.forEach((List data) {
    var feature=data[0];
    var version=data[1];
    test(() {
      assert_equals(document.implementation.hasFeature(feature, version), true);
    }, "should pass: hasFeature($feature, $version)");
  });

  badTests.forEach((List data) {
    var feature=data[0];
    var version=data[1];
    test(() {
      Expect.throws((){
       document.implementation.hasFeature(feature, version);
      });
    }, "should fail: hasFeature($feature, $version)");
  });

  checkTestFailures();
}
