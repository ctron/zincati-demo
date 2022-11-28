SELECT 'CREATE DATABASE {{ .Values.drogueCloudTwin.postgres.databaseName }}'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = '{{ .Values.drogueCloudTwin.postgres.databaseName }}')\gexec

DO
$do$
    BEGIN
        IF EXISTS (
                SELECT FROM pg_catalog.pg_roles
                WHERE  rolname = '{{ .Values.drogueCloudTwin.postgres.username}}') THEN
            RAISE NOTICE 'Role "{{ .Values.drogueCloudTwin.postgres.username}}" already exists. Skipping.';
        ELSE
            CREATE ROLE {{ .Values.drogueCloudTwin.postgres.username}} LOGIN PASSWORD '{{ .Values.drogueCloudTwin.postgres.password }}';
        END IF;
    END
$do$;


GRANT ALL PRIVILEGES ON DATABASE "{{ .Values.drogueCloudTwin.postgres.databaseName }}" TO "{{ .Values.drogueCloudTwin.postgres.username }}";
ALTER DATABASE "{{ .Values.drogueCloudTwin.postgres.database }}" OWNER TO "{{ .Values.drogueCloudTwin.postgres.username }}";
ALTER SCHEMA public OWNER TO "{{ .Values.drogueCloudTwin.postgres.username }}";
