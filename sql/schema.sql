
-- DROP TABLES 

DROP TABLE IF EXISTS app_events CASCADE;
DROP TABLE IF EXISTS notification_logs CASCADE;
DROP TABLE IF EXISTS notification_subscriptions CASCADE;
DROP TABLE IF EXISTS notification_topics CASCADE;
DROP TABLE IF EXISTS audit_logs CASCADE;
DROP TABLE IF EXISTS device_tokens CASCADE;
DROP TABLE IF EXISTS feedback CASCADE;
DROP TABLE IF EXISTS redemptions CASCADE;
DROP TABLE IF EXISTS coupons CASCADE;
DROP TABLE IF EXISTS events CASCADE;
DROP TABLE IF EXISTS services CASCADE;
DROP TABLE IF EXISTS special_hours CASCADE;
DROP TABLE IF EXISTS hours CASCADE;
DROP TABLE IF EXISTS vendors CASCADE;
DROP TABLE IF EXISTS admin_roles CASCADE;
DROP TABLE IF EXISTS students_profiles CASCADE;
DROP TABLE IF EXISTS locations CASCADE;
DROP TABLE IF EXISTS semesters CASCADE;
DROP TABLE IF EXISTS users CASCADE;

-- USERS

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP,
    user_type VARCHAR(50),
    firebase_uid VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE
);

-- STUDENT PROFILES

CREATE TABLE students_profiles (
    student_profile_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    verified_email_domain BOOLEAN DEFAULT FALSE,
    allowed_domain_source VARCHAR(100),
    last_login TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ADMIN ROLES

CREATE TABLE admin_roles (
    role_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    role_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- SEMESTERS

CREATE TABLE semesters (
    semester_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    active_status BOOLEAN DEFAULT TRUE
);


-- LOCATIONS

CREATE TABLE locations (
    location_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    building VARCHAR(255),
    room VARCHAR(100),
    floor VARCHAR(50)
);

-- VENDORS

CREATE TABLE vendors (
    vendor_id SERIAL PRIMARY KEY,
    vendor_name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    description TEXT,
    logo_url TEXT,
    location_id INT REFERENCES locations(location_id),
    contact_email VARCHAR(255),
    website_url TEXT,
    dietary_tags TEXT,
    active_status BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

-- HOURS

CREATE TABLE hours (
    hours_id SERIAL PRIMARY KEY,
    entity_type VARCHAR(50),
    entity_id INT,
    day_of_week VARCHAR(20),
    open_time TIME,
    close_time TIME,
    closed BOOLEAN DEFAULT FALSE
);

-- SPECIAL HOURS

CREATE TABLE special_hours (
    special_hours_id SERIAL PRIMARY KEY,
    entity_type VARCHAR(50),
    entity_id INT,
    date DATE,
    open_time TIME,
    close_time TIME,
    closed BOOLEAN DEFAULT FALSE
);

-- SERVICES

CREATE TABLE services (
    service_id SERIAL PRIMARY KEY,
    service_name VARCHAR(255) NOT NULL,
    description TEXT,
    category VARCHAR(100),
    url TEXT,
    tags TEXT,
    image_url TEXT,
    published_status BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    created_by INT REFERENCES users(user_id),
    updated_by INT REFERENCES users(user_id),
    archived_at TIMESTAMP,
    location_id INT REFERENCES locations(location_id)
);

-- EVENTS

CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    event_date DATE,
    start_time TIME,
    end_time TIME,
    location_id INT REFERENCES locations(location_id),
    organizer VARCHAR(255),
    image_url TEXT,
    event_type VARCHAR(100),
    capacity INT,
    tags TEXT,
    published_status BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    created_by INT REFERENCES users(user_id),
    updated_by INT REFERENCES users(user_id),
    archived_at TIMESTAMP
);

-- COUPONS

CREATE TABLE coupons (
    coupon_id SERIAL PRIMARY KEY,
    vendor_id INT REFERENCES vendors(vendor_id),
    semester_id INT REFERENCES semesters(semester_id),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    terms TEXT,
    start_at TIMESTAMP,
    expires_at TIMESTAMP,
    status VARCHAR(50),
    image_url TEXT,
    redemption_limit_type VARCHAR(50),
    max_redemptions_total INT,
    max_redemptions_per_student INT,
    published_status BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    created_by INT REFERENCES users(user_id),
    updated_by INT REFERENCES users(user_id),
    archived_at TIMESTAMP
);

-- REDEMPTIONS

CREATE TABLE redemptions (
    redemption_id SERIAL PRIMARY KEY,
    coupon_id INT REFERENCES coupons(coupon_id),
    user_id INT REFERENCES users(user_id),
    semester_id INT REFERENCES semesters(semester_id),
    redeemed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    vendor_confirmed_at TIMESTAMP,
    confirmed_by_vendor_user_id INT REFERENCES users(user_id),
    vendor_confirmation_code VARCHAR(100),
    redemption_code VARCHAR(100),
    status VARCHAR(50)
);

-- DEVICE TOKENS

CREATE TABLE device_tokens (
    device_token_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    device_token TEXT,
    platform VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_seen_at TIMESTAMP,
    revoked_at TIMESTAMP
);

-- NOTIFICATION TOPICS

CREATE TABLE notification_topics (
    topic_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    time_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    active_status BOOLEAN DEFAULT TRUE,
    is_optional BOOLEAN DEFAULT FALSE
);

-- NOTIFICATION SUBSCRIPTIONS

CREATE TABLE notification_subscriptions (
    subscription_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    topic_id INT REFERENCES notification_topics(topic_id),
    status VARCHAR(50),
    consented_at TIMESTAMP,
    revoked_at TIMESTAMP
);

-- NOTIFICATION LOGS

CREATE TABLE notification_logs (
    notification_log_id SERIAL PRIMARY KEY,
    topic_id INT REFERENCES notification_topics(topic_id),
    title VARCHAR(255),
    message TEXT,
    notification_type VARCHAR(100),
    time_sent TIMESTAMP,
    delivery_status VARCHAR(50)
);

-- FEEDBACK

CREATE TABLE feedback (
    feedback_id SERIAL PRIMARY KEY,
    category VARCHAR(100),
    message TEXT,
    sender_email VARCHAR(255),
    allow_contact BOOLEAN DEFAULT FALSE,
    status VARCHAR(50),
    reviewed_at TIMESTAMP,
    response_notes TEXT,
    privacy_notice_acknowledged BOOLEAN DEFAULT FALSE,
    submission_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- AUDIT LOGS

CREATE TABLE audit_logs (
    audit_id SERIAL PRIMARY KEY,
    admin_user_id INT REFERENCES users(user_id),
    table_name VARCHAR(255),
    record_id INT,
    action VARCHAR(100),
    change_summary TEXT,
    old_value_summary TEXT,
    new_value_summary TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    retention_until TIMESTAMP
);

-- APP EVENTS

CREATE TABLE app_events (
    app_event_id SERIAL PRIMARY KEY,
    event_type VARCHAR(100),
    entity_type VARCHAR(100),
    entity_id INT,
    session_id VARCHAR(255),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
