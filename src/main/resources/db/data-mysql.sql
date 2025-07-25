INSERT INTO `dataway-demo`.interface_info (api_id, api_method, api_path, api_status, api_comment, api_type, api_script, api_schema, api_sample, api_option, api_create_time, api_gmt_time) VALUES (2, 'POST', '/api/interfaceInfo', 1, '', 'SQL', 'select
    api_id,
    api_method,
    api_path,
    api_status,
    api_type
from
    interface_info
where
    api_method = #{apiMethod}
    and api_status = #{apiStatus}', '{}', '{"requestBody":"{\\n  \\"apiMethod\\": \\"POST\\",\\n  \\"apiStatus\\": 1\\n}","headerData":[]}', '{"resultStructure":true,"responseFormat":"{\\n  \\"success\\"      : \\"@resultStatus\\",\\n  \\"message\\"      : \\"@resultMessage\\",\\n  \\"code\\"         : \\"@resultCode\\",\\n  \\"lifeCycleTime\\": \\"@timeLifeCycle\\",\\n  \\"executionTime\\": \\"@timeExecution\\",\\n  \\"value\\"        : \\"@resultData\\"\\n}"}', '2025-07-25 12:14:08', '2025-07-25 12:24:46');
INSERT INTO `dataway-demo`.interface_info (api_id, api_method, api_path, api_status, api_comment, api_type, api_script, api_schema, api_sample, api_option, api_create_time, api_gmt_time) VALUES (3, 'POST', '/api/interfaceRelease', 1, '', 'SQL', 'select * from interface_release;', '{}', '{"requestBody":"{}","headerData":[]}', '{"resultStructure":true,"responseFormat":"{\\n  \\"success\\"      : \\"@resultStatus\\",\\n  \\"message\\"      : \\"@resultMessage\\",\\n  \\"code\\"         : \\"@resultCode\\",\\n  \\"lifeCycleTime\\": \\"@timeLifeCycle\\",\\n  \\"executionTime\\": \\"@timeExecution\\",\\n  \\"value\\"        : \\"@resultData\\"\\n}"}', '2025-07-25 12:31:59', '2025-07-25 12:32:13');
INSERT INTO `dataway-demo`.interface_info (api_id, api_method, api_path, api_status, api_comment, api_type, api_script, api_schema, api_sample, api_option, api_create_time, api_gmt_time) VALUES (4, 'POST', '/api/interfaceInfoRelease', 1, '', 'SQL', 'select
    a.api_id,
    a.api_path,
    a.api_method,
    a.api_status,
    JSON_ARRAYAGG(
        JSON_OBJECT(
            b.pub_status,
            b.pub_release_time
        )
    ) as api_releases
from
    interface_info a
    left join interface_release b on a.api_id = b.pub_api_id
where
    a.api_id = #{apiId}', '{}', '{"requestBody":"{\\n  \\"apiId\\": 2\\n}","headerData":[]}', '{"resultStructure":true,"responseFormat":"{\\n  \\"success\\"      : \\"@resultStatus\\",\\n  \\"message\\"      : \\"@resultMessage\\",\\n  \\"code\\"         : \\"@resultCode\\",\\n  \\"lifeCycleTime\\": \\"@timeLifeCycle\\",\\n  \\"executionTime\\": \\"@timeExecution\\",\\n  \\"value\\"        : \\"@resultData\\"\\n}"}', '2025-07-25 15:34:28', '2025-07-25 16:01:43');
INSERT INTO `dataway-demo`.interface_info (api_id, api_method, api_path, api_status, api_comment, api_type, api_script, api_schema, api_sample, api_option, api_create_time, api_gmt_time) VALUES (6, 'POST', '/api/interfaceInfoReleaseDataQL', 1, '', 'DataQL', 'var result = @@sql(apiId)<%
    select
        a.api_id,
        a.api_path,
        a.api_method,
        a.api_status,
        JSON_ARRAYAGG(
            JSON_OBJECT(
                b.pub_status,
                b.pub_release_time
            )
        ) as api_releases
    from
        interface_info a
        left join interface_release b on a.api_id = b.pub_api_id
    where
        a.api_id = #{apiId}
%>;

return result(${apiId});', '{}', '{"requestBody":"{\\n  \\"apiId\\": 2\\n}","headerData":[]}', '{"resultStructure":true,"responseFormat":"{\\n  \\"success\\"      : \\"@resultStatus\\",\\n  \\"message\\"      : \\"@resultMessage\\",\\n  \\"code\\"         : \\"@resultCode\\",\\n  \\"lifeCycleTime\\": \\"@timeLifeCycle\\",\\n  \\"executionTime\\": \\"@timeExecution\\",\\n  \\"value\\"        : \\"@resultData\\"\\n}"}', '2025-07-25 16:08:04', '2025-07-25 16:08:21');

INSERT INTO `dataway-demo`.interface_release (pub_id, pub_api_id, pub_method, pub_path, pub_status, pub_type, pub_script, pub_script_ori, pub_schema, pub_sample, pub_option, pub_release_time) VALUES (1, 2, 'POST', '/api/interfaceInfo', 0, 'SQL', 'var tempCall = @@sql(`apiMethod`)<%select * from interface_info where api_method = #{apiMethod}%>;
return tempCall(${apiMethod});', 'select * from interface_info where api_method = #{apiMethod}', '{}', '{"requestBody":"{\\"apiMethod\\": \\"POST\\"}","headerData":[]}', '{"resultStructure":true,"responseFormat":"{\\n  \\"success\\"      : \\"@resultStatus\\",\\n  \\"message\\"      : \\"@resultMessage\\",\\n  \\"code\\"         : \\"@resultCode\\",\\n  \\"lifeCycleTime\\": \\"@timeLifeCycle\\",\\n  \\"executionTime\\": \\"@timeExecution\\",\\n  \\"value\\"        : \\"@resultData\\"\\n}"}', '2025-07-25 12:20:10');
INSERT INTO `dataway-demo`.interface_release (pub_id, pub_api_id, pub_method, pub_path, pub_status, pub_type, pub_script, pub_script_ori, pub_schema, pub_sample, pub_option, pub_release_time) VALUES (2, 2, 'POST', '/api/interfaceInfo', 0, 'SQL', 'var tempCall = @@sql(`apiMethod`)<%select api_id, api_method, api_path, api_status, api_type from interface_info where api_method = #{apiMethod}%>;
return tempCall(${apiMethod});', 'select api_id, api_method, api_path, api_status, api_type from interface_info where api_method = #{apiMethod}', '{}', '{"requestBody":"{\\"apiMethod\\": \\"POST\\"}","headerData":[]}', '{"resultStructure":true,"responseFormat":"{\\n  \\"success\\"      : \\"@resultStatus\\",\\n  \\"message\\"      : \\"@resultMessage\\",\\n  \\"code\\"         : \\"@resultCode\\",\\n  \\"lifeCycleTime\\": \\"@timeLifeCycle\\",\\n  \\"executionTime\\": \\"@timeExecution\\",\\n  \\"value\\"        : \\"@resultData\\"\\n}"}', '2025-07-25 12:22:13');
INSERT INTO `dataway-demo`.interface_release (pub_id, pub_api_id, pub_method, pub_path, pub_status, pub_type, pub_script, pub_script_ori, pub_schema, pub_sample, pub_option, pub_release_time) VALUES (3, 2, 'POST', '/api/interfaceInfo', 0, 'SQL', 'var tempCall = @@sql(`apiMethod`)<%select api_id, api_method, api_path, api_status, api_type from interface_info where api_method = #{apiMethod}%>;
return tempCall(${apiMethod});', 'select api_id, api_method, api_path, api_status, api_type from interface_info where api_method = #{apiMethod}', '{}', '{"requestBody":"{\\n  \\"apiMethod\\": \\"POST\\"\\n}","headerData":[]}', '{"resultStructure":true,"responseFormat":"{\\n  \\"success\\"      : \\"@resultStatus\\",\\n  \\"message\\"      : \\"@resultMessage\\",\\n  \\"code\\"         : \\"@resultCode\\",\\n  \\"lifeCycleTime\\": \\"@timeLifeCycle\\",\\n  \\"executionTime\\": \\"@timeExecution\\",\\n  \\"value\\"        : \\"@resultData\\"\\n}"}', '2025-07-25 12:22:30');
INSERT INTO `dataway-demo`.interface_release (pub_id, pub_api_id, pub_method, pub_path, pub_status, pub_type, pub_script, pub_script_ori, pub_schema, pub_sample, pub_option, pub_release_time) VALUES (4, 2, 'POST', '/api/interfaceInfo', 0, 'SQL', 'var tempCall = @@sql(`apiMethod`,`apiStatus`)<%select
    api_id,
    api_method,
    api_path,
    api_status,
    api_type
from
    interface_info
where
    api_method = #{apiMethod}
    and api_status = #{apiStatus}%>;
return tempCall(${apiMethod},${apiStatus});', 'select
    api_id,
    api_method,
    api_path,
    api_status,
    api_type
from
    interface_info
where
    api_method = #{apiMethod}
    and api_status = #{apiStatus}', '{}', '{"requestBody":"{\\n  \\"apiMethod\\": \\"POST\\",\\n  \\"apiStatus\\": 2\\n}","headerData":[]}', '{"resultStructure":true,"responseFormat":"{\\n  \\"success\\"      : \\"@resultStatus\\",\\n  \\"message\\"      : \\"@resultMessage\\",\\n  \\"code\\"         : \\"@resultCode\\",\\n  \\"lifeCycleTime\\": \\"@timeLifeCycle\\",\\n  \\"executionTime\\": \\"@timeExecution\\",\\n  \\"value\\"        : \\"@resultData\\"\\n}"}', '2025-07-25 12:23:57');
INSERT INTO `dataway-demo`.interface_release (pub_id, pub_api_id, pub_method, pub_path, pub_status, pub_type, pub_script, pub_script_ori, pub_schema, pub_sample, pub_option, pub_release_time) VALUES (5, 2, 'POST', '/api/interfaceInfo', 0, 'SQL', 'var tempCall = @@sql(`apiMethod`,`apiStatus`)<%select
    api_id,
    api_method,
    api_path,
    api_status,
    api_type
from
    interface_info
where
    api_method = #{apiMethod}
    and api_status = #{apiStatus}%>;
return tempCall(${apiMethod},${apiStatus});', 'select
    api_id,
    api_method,
    api_path,
    api_status,
    api_type
from
    interface_info
where
    api_method = #{apiMethod}
    and api_status = #{apiStatus}', '{}', '{"requestBody":"{\\n  \\"apiMethod\\": \\"POST\\",\\n  \\"apiStatus\\": 1\\n}","headerData":[]}', '{"resultStructure":true,"responseFormat":"{\\n  \\"success\\"      : \\"@resultStatus\\",\\n  \\"message\\"      : \\"@resultMessage\\",\\n  \\"code\\"         : \\"@resultCode\\",\\n  \\"lifeCycleTime\\": \\"@timeLifeCycle\\",\\n  \\"executionTime\\": \\"@timeExecution\\",\\n  \\"value\\"        : \\"@resultData\\"\\n}"}', '2025-07-25 12:24:46');
INSERT INTO `dataway-demo`.interface_release (pub_id, pub_api_id, pub_method, pub_path, pub_status, pub_type, pub_script, pub_script_ori, pub_schema, pub_sample, pub_option, pub_release_time) VALUES (6, 3, 'POST', '/api/interfaceRelease', 0, 'SQL', 'var tempCall = @@sql()<%select * from interface_release;%>;
return tempCall();', 'select * from interface_release;', '{}', '{"requestBody":"{}","headerData":[]}', '{"resultStructure":true,"responseFormat":"{\\n  \\"success\\"      : \\"@resultStatus\\",\\n  \\"message\\"      : \\"@resultMessage\\",\\n  \\"code\\"         : \\"@resultCode\\",\\n  \\"lifeCycleTime\\": \\"@timeLifeCycle\\",\\n  \\"executionTime\\": \\"@timeExecution\\",\\n  \\"value\\"        : \\"@resultData\\"\\n}"}', '2025-07-25 12:32:13');
INSERT INTO `dataway-demo`.interface_release (pub_id, pub_api_id, pub_method, pub_path, pub_status, pub_type, pub_script, pub_script_ori, pub_schema, pub_sample, pub_option, pub_release_time) VALUES (7, 4, 'POST', '/api/interfaceInfoRelease', 0, 'DataQL', 'select
    a.api_id,
    a.api_path,
    a.api_method,
    a.api_status,
    b.pub_status,
    b.pub_release_time
from
    interface_info a
    left join interface_release b on a.api_id = b.pub_api_id
where
    a.api_id = #{apiId}', 'select
    a.api_id,
    a.api_path,
    a.api_method,
    a.api_status,
    b.pub_status,
    b.pub_release_time
from
    interface_info a
    left join interface_release b on a.api_id = b.pub_api_id
where
    a.api_id = #{apiId}', '{}', '{"requestBody":"{\\n  \\"apiId\\": \\"2\\"\\n}","headerData":[]}', '{"resultStructure":true,"responseFormat":"{\\n  \\"success\\"      : \\"@resultStatus\\",\\n  \\"message\\"      : \\"@resultMessage\\",\\n  \\"code\\"         : \\"@resultCode\\",\\n  \\"lifeCycleTime\\": \\"@timeLifeCycle\\",\\n  \\"executionTime\\": \\"@timeExecution\\",\\n  \\"value\\"        : \\"@resultData\\"\\n}"}', '2025-07-25 15:34:32');
INSERT INTO `dataway-demo`.interface_release (pub_id, pub_api_id, pub_method, pub_path, pub_status, pub_type, pub_script, pub_script_ori, pub_schema, pub_sample, pub_option, pub_release_time) VALUES (8, 4, 'POST', '/api/interfaceInfoRelease', 0, 'SQL', 'var tempCall = @@sql(`apiId`)<%select
    a.api_id,
    a.api_path,
    a.api_method,
    a.api_status,
    b.pub_status,
    b.pub_release_time
from
    interface_info a
    left join interface_release b on a.api_id = b.pub_api_id
where
    a.api_id = #{apiId}%>;
return tempCall(${apiId});', 'select
    a.api_id,
    a.api_path,
    a.api_method,
    a.api_status,
    b.pub_status,
    b.pub_release_time
from
    interface_info a
    left join interface_release b on a.api_id = b.pub_api_id
where
    a.api_id = #{apiId}', '{}', '{"requestBody":"{\\n  \\"apiId\\": 2\\n}","headerData":[]}', '{"resultStructure":true,"responseFormat":"{\\n  \\"success\\"      : \\"@resultStatus\\",\\n  \\"message\\"      : \\"@resultMessage\\",\\n  \\"code\\"         : \\"@resultCode\\",\\n  \\"lifeCycleTime\\": \\"@timeLifeCycle\\",\\n  \\"executionTime\\": \\"@timeExecution\\",\\n  \\"value\\"        : \\"@resultData\\"\\n}"}', '2025-07-25 15:50:42');
INSERT INTO `dataway-demo`.interface_release (pub_id, pub_api_id, pub_method, pub_path, pub_status, pub_type, pub_script, pub_script_ori, pub_schema, pub_sample, pub_option, pub_release_time) VALUES (9, 4, 'POST', '/api/interfaceInfoRelease', 0, 'SQL', 'var tempCall = @@sql(`apiId`)<%select
    a.api_id,
    a.api_path,
    a.api_method,
    a.api_status,
    JSON_ARRAYAGG(
        JSON_OBJECT(
            b.pub_status,
            b.pub_release_time
        )
    ) as api_releases
from
    interface_info a
    left join interface_release b on a.api_id = b.pub_api_id
where
    a.api_id = #{apiId}%>;
return tempCall(${apiId});', 'select
    a.api_id,
    a.api_path,
    a.api_method,
    a.api_status,
    JSON_ARRAYAGG(
        JSON_OBJECT(
            b.pub_status,
            b.pub_release_time
        )
    ) as api_releases
from
    interface_info a
    left join interface_release b on a.api_id = b.pub_api_id
where
    a.api_id = #{apiId}', '{}', '{"requestBody":"{\\n  \\"apiId\\": 2\\n}","headerData":[]}', '{"resultStructure":true,"responseFormat":"{\\n  \\"success\\"      : \\"@resultStatus\\",\\n  \\"message\\"      : \\"@resultMessage\\",\\n  \\"code\\"         : \\"@resultCode\\",\\n  \\"lifeCycleTime\\": \\"@timeLifeCycle\\",\\n  \\"executionTime\\": \\"@timeExecution\\",\\n  \\"value\\"        : \\"@resultData\\"\\n}"}', '2025-07-25 16:01:43');
INSERT INTO `dataway-demo`.interface_release (pub_id, pub_api_id, pub_method, pub_path, pub_status, pub_type, pub_script, pub_script_ori, pub_schema, pub_sample, pub_option, pub_release_time) VALUES (10, 5, 'POST', '/api/', 1, 'DataQL', 'var result = @@sql(apiId)<%
    select
        a.api_id,
        a.api_path,
        a.api_method,
        a.api_status,
        JSON_ARRAYAGG(
            JSON_OBJECT(
                b.pub_status,
                b.pub_release_time
            )
        ) as api_releases
    from
        interface_info a
        left join interface_release b on a.api_id = b.pub_api_id
    where
        a.api_id = #{apiId}
%>;

return result(${apiId});', 'var result = @@sql(apiId)<%
    select
        a.api_id,
        a.api_path,
        a.api_method,
        a.api_status,
        JSON_ARRAYAGG(
            JSON_OBJECT(
                b.pub_status,
                b.pub_release_time
            )
        ) as api_releases
    from
        interface_info a
        left join interface_release b on a.api_id = b.pub_api_id
    where
        a.api_id = #{apiId}
%>;

return result(${apiId});', '{}', '{"requestBody":"{\\n  \\"apiId\\": 2\\n}","headerData":[]}', '{"resultStructure":true,"responseFormat":"{\\n  \\"success\\"      : \\"@resultStatus\\",\\n  \\"message\\"      : \\"@resultMessage\\",\\n  \\"code\\"         : \\"@resultCode\\",\\n  \\"lifeCycleTime\\": \\"@timeLifeCycle\\",\\n  \\"executionTime\\": \\"@timeExecution\\",\\n  \\"value\\"        : \\"@resultData\\"\\n}"}', '2025-07-25 16:07:17');
INSERT INTO `dataway-demo`.interface_release (pub_id, pub_api_id, pub_method, pub_path, pub_status, pub_type, pub_script, pub_script_ori, pub_schema, pub_sample, pub_option, pub_release_time) VALUES (11, 6, 'POST', '/api/interfaceInfoReleaseDataQL', 0, 'DataQL', 'var result = @@sql(apiId)<%
    select
        a.api_id,
        a.api_path,
        a.api_method,
        a.api_status,
        JSON_ARRAYAGG(
            JSON_OBJECT(
                b.pub_status,
                b.pub_release_time
            )
        ) as api_releases
    from
        interface_info a
        left join interface_release b on a.api_id = b.pub_api_id
    where
        a.api_id = #{apiId}
%>;

return result(${apiId});', 'var result = @@sql(apiId)<%
    select
        a.api_id,
        a.api_path,
        a.api_method,
        a.api_status,
        JSON_ARRAYAGG(
            JSON_OBJECT(
                b.pub_status,
                b.pub_release_time
            )
        ) as api_releases
    from
        interface_info a
        left join interface_release b on a.api_id = b.pub_api_id
    where
        a.api_id = #{apiId}
%>;

return result(${apiId});', '{}', '{"requestBody":"{\\n  \\"apiId\\": 2\\n}","headerData":[]}', '{"resultStructure":true,"responseFormat":"{\\n  \\"success\\"      : \\"@resultStatus\\",\\n  \\"message\\"      : \\"@resultMessage\\",\\n  \\"code\\"         : \\"@resultCode\\",\\n  \\"lifeCycleTime\\": \\"@timeLifeCycle\\",\\n  \\"executionTime\\": \\"@timeExecution\\",\\n  \\"value\\"        : \\"@resultData\\"\\n}"}', '2025-07-25 16:08:21');
