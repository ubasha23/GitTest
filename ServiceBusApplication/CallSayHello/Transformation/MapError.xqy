xquery version "1.0";
(:: pragma  parameter="$ErrorDVM" type="anyType" ::)
(:: pragma bea:global-element-return element="ns0:Fault" location="../Schemas/FaultQueue.xsd" ::)

declare namespace ns0 = "http://www.example.org/FaultQueue";
declare namespace xf = "http://tempuri.org/CallSayHello/Transformation/MapError/";
declare namespace ns1 = "http://www.example.org/FaultTypes";

declare function xf:MapError($ErrorDVM as element(*),
    $ErrorCode as xs:string,
    $ErrorDescription as xs:string,
    $Name as xs:string)
    as element(ns0:Fault) {
        <ns0:Fault>
            <ns0:Name>{ data($Name) }</ns0:Name>
            <ns0:ErrorCode>{ data($ErrorCode) }</ns0:ErrorCode>
            <ns0:ErrorMessage>
            {
            	if($ErrorDVM/ns1:FaultTypes[ns1:FaultCode/text()=$ErrorCode and ns1:FaultDescription/text()=$ErrorDescription]/ns1:Response) then
            		$ErrorDVM/ns1:FaultTypes[ns1:FaultCode/text()=$ErrorCode and ns1:FaultDescription/text()=$ErrorDescription]/ns1:Response/text()
            	else
            	fn:concat("Unknown Exception Occured: ",$ErrorDescription)
            }
            </ns0:ErrorMessage>
        </ns0:Fault>
};

declare variable $ErrorDVM as element(*) external;
declare variable $ErrorCode as xs:string external;
declare variable $ErrorDescription as xs:string external;
declare variable $Name as xs:string external;

xf:MapError($ErrorDVM,
    $ErrorCode,
    $ErrorDescription,
    $Name)