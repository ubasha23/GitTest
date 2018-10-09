xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:Response" location="../Schemas/Response.xsd" ::)

declare namespace ns0 = "http://www.example.org/Response";
declare namespace xf = "http://tempuri.org/sayHello/Transformation/sayHelloFail/";

declare function xf:sayHelloFail($name1 as xs:string)
    as element(ns0:Response) {
        <ns0:Response>
            <ns0:Code>1</ns0:Code>
            <ns0:Message>Invalid Name</ns0:Message>
        </ns0:Response>
};

declare variable $name1 as xs:string external;

xf:sayHelloFail($name1)