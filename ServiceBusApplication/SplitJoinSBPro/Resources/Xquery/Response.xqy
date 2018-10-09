xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.example.org";
(:: import schema at "../Schema/Emp.xsd", 
                     "../Schema/XMLSchema_-256689817.xsd" ::)

declare variable $emp_res as element() (:: schema-element(ns1:EmployeeResponse) ::) external;
declare variable $job_resp as element() (:: schema-element(ns1:JobDetailResponse) ::) external;

declare function local:func($emp_res as element() (:: schema-element(ns1:EmployeeResponse) ::), 
                            $job_resp as element() (:: schema-element(ns1:JobDetailResponse) ::)) 
                            as element() (:: schema-element(ns1:EmpResponse) ::) {
    <ns1:EmpResponse>
        <ns1:firstName>{fn:data($emp_res/ns1:firstName)}</ns1:firstName>
        <ns1:lastName>{fn:data($emp_res/ns1:lastName)}</ns1:lastName>
        <ns1:jobTitle>{fn:data($job_resp/ns1:jobTitle)}</ns1:jobTitle>
        <ns1:salary>{fn:data($job_resp/ns1:salary)}</ns1:salary>
    </ns1:EmpResponse>
};

local:func($emp_res, $job_resp)
