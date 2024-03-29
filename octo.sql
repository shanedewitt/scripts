SQLI_SCHEMA,SQLI_SCHEMA_ID,numeric
SQLI_SCHEMA,S_NAME,varchar
SQLI_SCHEMA,S_SECURITY,varchar
SQLI_SCHEMA,S_DESCRIPTION,varchar
SQLI_KEY_WORD,SQLI_KEY_WORD_ID,numeric
SQLI_KEY_WORD,KEY_WORD,varchar
SQLI_DATA_TYPE,SQLI_DATA_TYPE_ID,numeric
SQLI_DATA_TYPE,D_NAME,varchar
SQLI_DATA_TYPE,D_COMMENT,varchar
SQLI_DATA_TYPE,D_OUTPUT_STRATEGY,varchar
SQLI_DATA_TYPE,D_OUTPUT_FORMAT,numeric
SQLI_DOMAIN,SQLI_DOMAIN_ID,numeric
SQLI_DOMAIN,DM_NAME,varchar
SQLI_DOMAIN,DM_DATA_TYPE,numeric
SQLI_DOMAIN,DM_COMMENT,varchar
SQLI_DOMAIN,DM_TABLE,numeric
SQLI_DOMAIN,DM_WIDTH,int4
SQLI_DOMAIN,DM_SCALE,int4
SQLI_DOMAIN,DM_OUTPUT_FORMAT,numeric
SQLI_DOMAIN,DM_INT_EXPR,varchar
SQLI_DOMAIN,DM_INT_EXEC,varchar
SQLI_DOMAIN,DM_BASE_EXPR,varchar
SQLI_DOMAIN,DM_BASE_EXEC,varchar
SQLI_DOMAIN,DM_FILEMAN_FIELD_TYPE,varchar
SQLI_KEY_FORMAT,SQLI_KEY_FORMAT_ID,numeric
SQLI_KEY_FORMAT,KF_NAME,varchar
SQLI_KEY_FORMAT,KF_DATA_TYPE,numeric
SQLI_KEY_FORMAT,KF_COMMENT,varchar
SQLI_KEY_FORMAT,KF_INT_EXPR,varchar
SQLI_KEY_FORMAT,KF_INT_EXEC,varchar
SQLI_OUTPUT_FORMAT,SQLI_OUTPUT_FORMAT_ID,numeric
SQLI_OUTPUT_FORMAT,OF_NAME,varchar
SQLI_OUTPUT_FORMAT,OF_DATA_TYPE,numeric
SQLI_OUTPUT_FORMAT,OF_COMMENT,varchar
SQLI_OUTPUT_FORMAT,OF_EXT_EXPR,varchar
SQLI_OUTPUT_FORMAT,OF_EXT_EXEC,varchar
SQLI_TABLE,SQLI_TABLE_ID,numeric
SQLI_TABLE,T_NAME,varchar
SQLI_TABLE,T_SCHEMA,numeric
SQLI_TABLE,T_COMMENT,varchar
SQLI_TABLE,T_MASTER_TABLE,numeric
SQLI_TABLE,T_VERSION_FM,int4
SQLI_TABLE,T_ROW_COUNT,int4
SQLI_TABLE,T_FILE,numeric
SQLI_TABLE,T_UPDATE,numeric
SQLI_TABLE,T_GLOBAL,varchar
SQLI_TABLE_ELEMENT,SQLI_TABLE_ELEMENT_ID,numeric
SQLI_TABLE_ELEMENT,E_NAME,varchar
SQLI_TABLE_ELEMENT,E_DOMAIN,numeric
SQLI_TABLE_ELEMENT,E_TABLE,numeric
SQLI_TABLE_ELEMENT,E_TYPE,varchar
SQLI_TABLE_ELEMENT,E_COMMENT,varchar
SQLI_COLUMN,SQLI_COLUMN_ID,numeric
SQLI_COLUMN,C_TABLE_ELEMENT,numeric
SQLI_COLUMN,C_FILE,numeric
SQLI_COLUMN,C_WIDTH,int4
SQLI_COLUMN,C_SCALE,int4
SQLI_COLUMN,C_FIELD,numeric
SQLI_COLUMN,C_NOT_NULL,varchar
SQLI_COLUMN,C_SECURE,varchar
SQLI_COLUMN,C_VIRTUAL,varchar
SQLI_COLUMN,C_PARENT,numeric
SQLI_COLUMN,C_GLOBAL,varchar
SQLI_COLUMN,C_PIECE,int4
SQLI_COLUMN,C_EXTRACT_FROM,int4
SQLI_COLUMN,C_EXTRACT_THRU,int4
SQLI_COLUMN,C_COMPUTE_EXEC,varchar
SQLI_COLUMN,C_FM_EXEC,varchar
SQLI_COLUMN,C_POINTER,varchar
SQLI_COLUMN,C_OUTPUT_FORMAT,numeric
SQLI_PRIMARY_KEY,SQLI_PRIMARY_KEY_ID,numeric
SQLI_PRIMARY_KEY,P_TBL_ELEMENT,numeric
SQLI_PRIMARY_KEY,P_COLUMN,numeric
SQLI_PRIMARY_KEY,P_SEQUENCE,int4
SQLI_PRIMARY_KEY,P_START_AT,varchar
SQLI_PRIMARY_KEY,P_END_IF,varchar
SQLI_PRIMARY_KEY,P_ROW_COUNT,numeric
SQLI_PRIMARY_KEY,P_PRESELECT,varchar
SQLI_PRIMARY_KEY,P_KEY_FORMAT,numeric
SQLI_FOREIGN_KEY,SQLI_FOREIGN_KEY_ID,numeric
SQLI_FOREIGN_KEY,F_TBL_ELEMENT,numeric
SQLI_FOREIGN_KEY,F_PK_ELEMENT,numeric
SQLI_FOREIGN_KEY,F_CLM_ELEMENT,numeric
SQLI_ERROR_TEXT,SQLI_ERROR_TEXT_ID,numeric
SQLI_ERROR_TEXT,ERROR_TEXT,varchar
SQLI_ERROR_LOG,SQLI_ERROR_LOG_ID,numeric
SQLI_ERROR_LOG,FILEMAN_FILE,numeric
SQLI_ERROR_LOG,FILEMAN_FIELD,numeric
SQLI_ERROR_LOG,ERROR,numeric
SQLI_ERROR_LOG,ERROR_DATE,numeric
SQLI_ERROR_LOG,FILEMAN_ERROR,numeric