/**
 * after web-platform-tests/html/syntax/parsing/math-parse03.html
 * @assertion
 * 
 * @description  math in html: parsing
 */
import 'dart:html';
import "../../../Utils/expectWeb.dart";

const String htmlEL = r'''

<div>
<div><MATH id="m1"><Mtext/></math></div>
<div id="d1"><math><MI MATHVARIANT="BOLD" /></math></div>
<div id="d2"><math><semantics DEFINITIONurl="www.example.org/FOO"><mi>a</mi><annotation-xml><foo/><bar/></annotation-xml></semantics></math></div>
<div><math id="m3span-mtext"><mtext><Span>x</Span></mtext></math></div>
<div><math id="m3span-mi"><mi><Span>x</Span></mi></math></div>
<div><math id="m3span-mrow"><mi><Span>x</Span></mrow></math></div>
<div><math id="m3p-mtext"><mtext><P>x</P></mtext></math></div>
<div><math id="m3p-mi"><mi><P>x</P></mi></math></div>
<div id="d3p-mrow"><math><mrow><P>x</P><mi>y</mi></mrow></math></div>
<div><math id="m4"><mtext><Undefinedelement>x</Undefinedelement></mtext></math></div>
<div><math id="m5"><mtext><mi>x</mi></mtext></math></div>
<div><math><semantics><mi>x</mi>
                      <annotation-xml><p id="p6default">x</p></annotation-xml>
           </semantics></math></div>
<div><math><semantics><mi>x</mi>
                      <annotation-xml encoding=text/html><p id="p6texthtml">x</p></annotation-xml>
           </semantics></math></div>
<div><math><semantics><mi>x</mi>
                      <annotation-xml encoding=TEXT/HTML><p id="p6uctexthtml">x</p></annotation-xml>
           </semantics></math></div>
<div><math><semantics><mi>x</mi>
                      <annotation-xml encoding=application/xhtml+xml><p id="p6applicationxhtmlxml">x</p></annotation-xml>
           </semantics></math></div>
<div><math><semantics><mi>x</mi>
                      <annotation-xml encoding=foo><p id="p6foo">x</p></annotation-xml>
           </semantics></math></div>
</div>
''';

void main() {
    document.body.appendHtml(htmlEL);
  
    test(() {
      assert_equals(document.getElementById("m1"),document.getElementsByTagName("math")[0]);
    },"MATH element name should be lowercased");
    
    test(() {
      assert_equals(document.getElementById("d1").firstChild.firstChild.nodeName,"mi");
      assert_equals(document.getElementById("d1").firstChild.firstChild.namespaceUri, "http://www.w3.org/1998/Math/MathML");
      assert_true(document.getElementById("d1").firstChild.firstChild.attributes.containsKey("mathvariant"));
      assert_equals(document.getElementById("d1").firstChild.firstChild.getAttribute("mathvariant"),"BOLD");
    },"MI element name and mathvariant attribute name should be lowercased, attribute value unchanged");
    
    test(() {
    assert_true(document.getElementById("d2").firstChild.firstChild.attributes.containsKey("definitionURL"));
      assert_equals(document.getElementById("d2").firstChild.firstChild.getAttribute("definitionURL"),"www.example.org/FOO");
    },"DEFINITIONurl attribute markup should produce a definitionURL attribute, attribute value unchanged");
    
    test(() {
      assert_equals(document.getElementById("m3span-mtext").firstChild.firstChild.nodeName,"SPAN");
      assert_equals(document.getElementById("m3span-mtext").firstChild.firstChild.namespaceUri,"http://www.w3.org/1999/xhtml");
    },"html Span in mtext produces SPAN nodename in XHTML namespace");
    
    test(() {
      assert_equals(document.getElementById("m3span-mi").firstChild.firstChild.nodeName,"SPAN");
      assert_equals(document.getElementById("m3span-mi").firstChild.firstChild.namespaceUri,"http://www.w3.org/1999/xhtml");
    },"html Span in mi produces SPAN nodename in XHTML namespace");
    
    test(() {
      assert_equals(document.getElementById("m3span-mrow").firstChild.firstChild.nodeName,"SPAN");
      assert_equals(document.getElementById("m3span-mrow").firstChild.firstChild.namespaceUri,"http://www.w3.org/1999/xhtml");
    },"html Span in mrow produces SPAN nodename in XHTML namespace");
    
    test(() {
      assert_equals(document.getElementById("m3p-mtext").firstChild.firstChild.nodeName,"P");
      assert_equals(document.getElementById("m3p-mtext").firstChild.firstChild.namespaceUri,"http://www.w3.org/1999/xhtml");
    },"html P in mtext produces P nodename in XHTML namespace");
    
    test(() {
      assert_equals(document.getElementById("m3p-mi").firstChild.firstChild.nodeName,"P");
      assert_equals(document.getElementById("m3p-mi").firstChild.firstChild.namespaceUri,"http://www.w3.org/1999/xhtml");
    },"html P in mi produces P nodename in XHTML namespace");
    
    test(() {
      assert_equals(document.getElementById("d3p-mrow").childNodes.length ,3);
    },"html P in mrow terminates the math: mrow,P,MI children of div");
    
    test(() {
      assert_equals(document.getElementById("d3p-mrow").firstChild.childNodes.length ,1);
    },"html P in mrow terminates the math: mrow child of math");
    
    test(() {
      assert_equals(document.getElementById("d3p-mrow").firstChild.firstChild.childNodes.length ,0);
    },"html P in mrow terminates the math: mrow empty");
    
    test(() {
      assert_equals(document.getElementById("d3p-mrow").childNodes[0].nodeName,"math");
      assert_equals(document.getElementById("d3p-mrow").childNodes[1].nodeName,"P");
      assert_equals(document.getElementById("d3p-mrow").childNodes[2].nodeName,"MI");
    },"html P in mrow terminates the math: math,P,MI children of div");
    
    test(() {
      assert_equals(document.getElementById("m4").firstChild.firstChild.nodeName,"UNDEFINEDELEMENT");
      assert_equals(document.getElementById("m4").firstChild.firstChild.namespaceUri,"http://www.w3.org/1999/xhtml");
    },"Undefinedelement in mtext produces UNDEFINEDELEMENT nodename in XHTML namespace");
    
    test(() {
      assert_equals(document.getElementById("m5").firstChild.firstChild.nodeName,"MI");
      assert_equals(document.getElementById("m5").firstChild.firstChild.namespaceUri,"http://www.w3.org/1999/xhtml");
    },"mi in mtext produces MI nodename in XHTML namespace");
    
    test(() {
      assert_equals(document.getElementById("p6default").parentNode.nodeName,"DIV");
    },"p in annotation-xml moves to be child of DIV");
    
    test(() {
      assert_equals(document.getElementById("p6texthtml").parentNode.nodeName,"annotation-xml");
    },"p in annotation-xml encoding=text/html stays as child of annotation-xml");
    
    test(() {
      assert_equals(document.getElementById("p6uctexthtml").parentNode.nodeName,"annotation-xml");
    },"p in annotation-xml encoding=TEXT/HTML stays as child of annotation-xml");
    
    test(() {
      assert_equals(document.getElementById("p6applicationxhtmlxml").parentNode.nodeName,"annotation-xml");
    },"p in annotation-xml encoding=application/xhtml+xml stays as child of annotation-xml");
    
    test(() {
      assert_equals(document.getElementById("p6foo").parentNode.nodeName,"DIV");
    },"p in annotation-xml encoding=foo moves to be child of DIV");
    
    checkTestFailures();
}
