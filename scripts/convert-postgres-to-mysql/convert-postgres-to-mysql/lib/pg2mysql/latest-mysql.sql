# Converted with pg2mysql-1.9
# Converted on Fri, 13 Nov 2015 05:25:56 -0500
# Lightbox Technologies Inc. http://www.lightbox.ca

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone="+00:00";

CREATE TABLE core_schemaversion (
	version int(11) NOT NULL,
	name varchar(255) DEFAULT '',
	md5 varchar(255) DEFAULT ''
) TYPE=MyISAM;

CREATE TABLE sys_translation (
    id varchar(255) NOT NULL,
    locale varchar(255),
    key varchar(255),
    value varchar(255),
    description varchar(255),
    created_by varchar(255),
    created_date timestamp,
    last_updated_by varchar(255),
    last_updated_date timestamp
) TYPE=MyISAM;

CREATE TABLE sys_entity (
    base varchar(255),
    name varchar(255),
    zone varchar(255),
    fields json[],
    id varchar(255) NOT NULL,
    seneca json
) TYPE=MyISAM;

CREATE TABLE sys_account (
    id varchar(255) NOT NULL,
    orignick varchar(255),
    name varchar(255),
    origuser varchar(255),
    active bool,
    users varchar(255),
    projects varchar(255)
) TYPE=MyISAM;

CREATE TABLE sys_casesubstatus (
    id varchar(255) NOT NULL,
    case_id varchar(255),
    name varchar(255),
    start_date timestamp,
    end_date timestamp,
    created_by varchar(255),
    created_date timestamp,
    last_updated_by varchar(255),
    last_updated_date timestamp
) TYPE=MyISAM;

CREATE TABLE sys_document (
    id varchar(255) NOT NULL,
    file_id varchar(255),
    filename varchar(255),
    kind varchar(255),
    details varchar(255),
    file_type varchar(255),
    description varchar(255),
    created_by varchar(255),
    created_date timestamp,
    last_updated_by varchar(255),
    last_updated_date timestamp
) TYPE=MyISAM;

CREATE TABLE sys_comment (
    id varchar(255) NOT NULL,
    parent_id varchar(255),
    parent_type varchar(255),
    parent_number varchar(255),
    details varchar(255),
    case_id varchar(255),
    created_by varchar(255),
    created_date timestamp,
    last_updated_by varchar(255),
    last_updated_date timestamp
) TYPE=MyISAM;

CREATE TABLE sys_escalation (
    id varchar(255) NOT NULL,
    job_id varchar(255) NOT NULL,
    target_id varchar(255) NOT NULL,
    trigger_id varchar(255) NOT NULL,
    active bool NOT NULL,
    date_start timestamp,
    date_end timestamp,
    created_by varchar(255),
    created_date timestamp,
    last_updated_by varchar(255),
    last_updated_date timestamp
) TYPE=MyISAM;

CREATE TABLE sys_event (
    id varchar(255) NOT NULL,
    job_id varchar(255) NOT NULL,
    `type` varchar(255),
    `status` varchar(255),
    details json,
    date_occured timestamp
) TYPE=MyISAM;

CREATE TABLE sys_field (
    id varchar(255) NOT NULL,
    entity varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    `type` varchar(255) NOT NULL,
    list varchar(255),
    exclude json,
    created_by varchar(255),
    created_date timestamp,
    last_updated_by varchar(255),
    last_updated_date timestamp
) TYPE=MyISAM;

CREATE TABLE sys_filter (
    id varchar(255) NOT NULL,
    title varchar(255),
    name varchar(255),
    `type` varchar(255),
    created_by varchar(255),
    created_date timestamp,
    last_updated_by varchar(255),
    last_updated_date timestamp
) TYPE=MyISAM;

CREATE TABLE sys_listitem (
    id varchar(255) NOT NULL,
    name varchar(255),
    value varchar(255),
    parents varchar(255)[],
    alt_parents varchar(255)[],
    `group` varchar(255),
    rank int(11),
    related_data json,
    created_by varchar(255),
    created_date timestamp,
    last_updated_by varchar(255),
    last_updated_date timestamp,
    
     -- Integration/Migration
    source_type varchar(255),
    source_content varchar(255)
) TYPE=MyISAM;

CREATE TABLE sys_login (
    id varchar(255) NOT NULL,
    nick varchar(255),
    email varchar(255),
    `user` varchar(255),
    `when` timestamp,
    why varchar(255),
    token varchar(255),
    active bool,
    ended varchar(255)
) TYPE=MyISAM;

CREATE TABLE sys_log
(
  id varchar(255) NOT NULL,
  msg varchar(255) NOT NULL,
  details varchar(255),
  `type` varchar(255),
  subtype varchar(255),
  origin varchar(255),
  userid varchar(255),
  loginid varchar(255),

  -- Standard Fields
  created_date timestamp,

) TYPE=MyISAM;

CREATE TABLE sys_notification (
    id varchar(255) NOT NULL,
    entity_type varchar(255),
    trigger json,
    custom_criteria json,
    context_users varchar(255),
    system_users varchar(255),
    user_groups varchar(255),
    other_addresses varchar(255),
    subject varchar(255),
    message varchar(255),
    include_fields json,
    created_by varchar(255),
    created_date timestamp,
    last_updated_by varchar(255),
    last_updated_date timestamp
) TYPE=MyISAM;

CREATE TABLE sys_project (
    id varchar(255) NOT NULL,
    kind varchar(255),
    account varchar(255),
    name varchar(255),
    active bool
) TYPE=MyISAM;

CREATE TABLE sys_reset (
    id varchar(255) NOT NULL,
    nick varchar(255),
    `user` varchar(255),
    `when` timestamp,
    active bool
) TYPE=MyISAM;

CREATE TABLE sys_response (
    id varchar(255) NOT NULL,
    name varchar(255),
    body varchar(255),
    `type` varchar(255),
    locale varchar(255),
    rank int(11),
    created_by varchar(255),
    created_date timestamp,
    last_updated_by varchar(255),
    last_updated_date timestamp
) TYPE=MyISAM;

CREATE TABLE sys_template (
    id varchar(255) NOT NULL,
    name varchar(255),
    files json[],
    case_type varchar(255),
    locale varchar(255),
    file_type varchar(255),
    created_by varchar(255),
    created_by_name varchar(255),
    created_date timestamp,
    last_updated_by varchar(255),
    last_updated_date timestamp
) TYPE=MyISAM;

CREATE TABLE sys_searches (
    id varchar(255) NOT NULL,
    filter_query varchar(255),
    search_name varchar(255),
    saved bool,
    created_by varchar(255),
    created_date timestamp,
    last_updated_by varchar(255),
    last_updated_date timestamp
) TYPE=MyISAM;

CREATE TABLE sys_settings (
    id varchar(255) NOT NULL,
    kind varchar(255),
    spec varchar(255),
    data json,
    ref varchar(255),
    settings json
) TYPE=MyISAM;

ALTER TABLE sys_entity
    ADD CONSTRAINT pk_id PRIMARY KEY (id);
ALTER TABLE sys_account
    ADD CONSTRAINT pk_sys_account_id PRIMARY KEY (id);
ALTER TABLE sys_casesubstatus
    ADD CONSTRAINT pk_sys_casesubstatus_id PRIMARY KEY (id);
ALTER TABLE sys_comment
    ADD CONSTRAINT pk_sys_comment_id PRIMARY KEY (id);
ALTER TABLE sys_document
    ADD CONSTRAINT pk_sys_document_id PRIMARY KEY (id);
ALTER TABLE sys_escalation
    ADD CONSTRAINT pk_sys_escalation_id PRIMARY KEY (id);
ALTER TABLE sys_event
    ADD CONSTRAINT pk_sys_event_id PRIMARY KEY (id);
ALTER TABLE sys_field
    ADD CONSTRAINT pk_sys_field_id PRIMARY KEY (id);
ALTER TABLE sys_filter
    ADD CONSTRAINT pk_sys_filter_id PRIMARY KEY (id);
ALTER TABLE sys_listitem
    ADD CONSTRAINT pk_sys_listitem_id PRIMARY KEY (id);
ALTER TABLE sys_login
    ADD CONSTRAINT pk_sys_login_id PRIMARY KEY (id);
ALTER TABLE sys_notification
    ADD CONSTRAINT pk_sys_notification_id PRIMARY KEY (id);
ALTER TABLE sys_project
    ADD CONSTRAINT pk_sys_project_id PRIMARY KEY (id);
ALTER TABLE sys_reset
    ADD CONSTRAINT pk_sys_reset_id PRIMARY KEY (id);
ALTER TABLE sys_response
    ADD CONSTRAINT pk_sys_response_id PRIMARY KEY (id);
ALTER TABLE sys_searches
    ADD CONSTRAINT pk_sys_searches_id PRIMARY KEY (id);
ALTER TABLE sys_settings
    ADD CONSTRAINT pk_sys_settings_id PRIMARY KEY (id);
ALTER TABLE sys_template
    ADD CONSTRAINT pk_sys_template_id PRIMARY KEY (id);
ALTER TABLE sys_translation
    ADD CONSTRAINT pk_sys_translation_id PRIMARY KEY (id);