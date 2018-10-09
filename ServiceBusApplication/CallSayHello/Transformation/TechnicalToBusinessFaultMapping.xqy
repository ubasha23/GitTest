xquery version "1.0";
(:: pragma bea:global-element-return element="ns0:Fault" location="../Schemas/FaultTypes.xsd" ::)

declare namespace ns0 = "http://www.example.org/FaultTypes";
declare namespace xf = "http://tempuri.org/CallSayHello/Transformation/TechnicalToBusinessFaultMapping/";

declare function xf:TechnicalToBusinessFaultMapping()
as element(ns0:Fault) {
    <ns0:Fault>
        <ns0:FaultTypes>
            <ns0:FaultCode>BEA-380000</ns0:FaultCode>
            <ns0:FaultDescription>General runtime error: connect timed out</ns0:FaultDescription>
            <ns0:Response>OSB service timed out waiting for response from target system</ns0:Response>
        </ns0:FaultTypes>
        <ns0:FaultTypes>
            <ns0:FaultCode>BEA-380000</ns0:FaultCode>
            <ns0:FaultDescription>Not Found</ns0:FaultDescription>
            <ns0:Response>Target Service temporarily unavailable</ns0:Response>
        </ns0:FaultTypes>
    </ns0:Fault>
};


xf:TechnicalToBusinessFaultMapping()