xquery version "1.0";
(:: pragma bea:global-element-return element="ns0:Response" location="../Schemas/Response.xsd" ::)
declare namespace ns0 = "http://www.example.org/Response";
declare namespace xf = "http://tempuri.org/CallSayHello/Transformation/FaultTransformation/";
declare function xf:FaultTransformation($ErrorCode as xs:string, $ErrorReason as xs:string) as element(ns0:Response) 
{
        <ns0:Response>
            <ns0:Code>{$ErrorCode}</ns0:Code>
            <ns0:Message>{$ErrorReason}</ns0:Message>
        </ns0:Response>
};

declare variable $ErrorCode as xs:string external;
declare variable $ErrorReason as xs:string external;

xf:FaultTransformation($ErrorCode, $ErrorReason)