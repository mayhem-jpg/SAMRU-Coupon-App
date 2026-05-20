-- USERS

INSERT INTO users (email, password_hash, user_type, firebase_uid, is_active)
VALUES
('alex.chen@mtroyal.ca', 'fake_hash_001', 'student', 'firebase_alex_001', TRUE),
('sara.ahmed@mtroyal.ca', 'fake_hash_002', 'student', 'firebase_sara_002', TRUE),
('jamie.patel@samru.ca', 'fake_hash_003', 'student', 'firebase_jamie_003', TRUE),
('admin@samru.ca', 'fake_hash_004', 'admin', 'firebase_admin_004', TRUE),
('vendor.coffee@mtroyal.ca', 'fake_hash_005', 'vendor', 'firebase_vendor_005', TRUE),
('vendor.burger@samru.ca', 'fake_hash_006', 'vendor', 'firebase_vendor_006', TRUE);


-- STUDENT PROFILES

INSERT INTO students_profiles (user_id, verified_email_domain, allowed_domain_source, last_login)
VALUES
(1, TRUE, '@mtroyal.ca', CURRENT_TIMESTAMP),
(2, TRUE, '@mtroyal.ca', CURRENT_TIMESTAMP),
(3, TRUE, '@samru.ca', CURRENT_TIMESTAMP);


-- ADMIN ROLES

INSERT INTO admin_roles (user_id, role_name)
VALUES
(4, 'super_admin'),
(4, 'content_manager');


-- SEMESTERS

INSERT INTO semesters (name, start_date, end_date, active_status)
VALUES
('Winter 2026', '2026-01-08', '2026-04-30', TRUE),
('Spring 2026', '2026-05-01', '2026-06-30', FALSE),
('Fall 2026', '2026-09-01', '2026-12-15', FALSE);


-- LOCATIONS

INSERT INTO locations (name, building, room, floor)
VALUES
('Wyckham Food Court', 'Wyckham House', '101', '1'),
('SAMRU Reception', 'Wyckham House', '200', '2'),
('Main Gym', 'Recreation Centre', 'G01', 'Ground'),
('Library Study Lounge', 'Riddell Library', '301', '3'),
('East Gate Entrance', 'Main Campus', NULL, 'Ground');


-- VENDORS

INSERT INTO vendors (vendor_name, category, description, logo_url, location_id, contact_email, website_url, dietary_tags, active_status, updated_at)
VALUES
('Campus Coffee', 'Food & Drink', 'Coffee, tea, and baked goods on campus.', 'https://example.com/logos/campus-coffee.png', 1, 'campuscoffee@samru.ca', 'https://example.com/campus-coffee', 'vegetarian,halal-options', TRUE, CURRENT_TIMESTAMP),
('Burger Spot', 'Food & Drink', 'Quick burgers, fries, and student meal deals.', 'https://example.com/logos/burger-spot.png', 1, 'burgerspot@samru.ca', 'https://example.com/burger-spot', 'halal-options', TRUE, CURRENT_TIMESTAMP),
('Student Cuts', 'Beauty', 'Affordable haircuts for students.', 'https://example.com/logos/student-cuts.png', 5, 'studentcuts@samru.ca', 'https://example.com/student-cuts', NULL, TRUE, CURRENT_TIMESTAMP),
('Book Haven', 'Retail', 'Textbooks, notebooks, and school supplies.', 'https://example.com/logos/book-haven.png', 4, 'bookhaven@samru.ca', 'https://example.com/book-haven', NULL, TRUE, CURRENT_TIMESTAMP);


-- HOURS

INSERT INTO hours (entity_type, entity_id, day_of_week, open_time, close_time, closed)
VALUES
('vendor', 1, 'Monday', '08:00', '18:00', FALSE),
('vendor', 1, 'Tuesday', '08:00', '18:00', FALSE),
('vendor', 1, 'Wednesday', '08:00', '18:00', FALSE),
('vendor', 2, 'Monday', '10:00', '20:00', FALSE),
('vendor', 2, 'Tuesday', '10:00', '20:00', FALSE),
('service', 1, 'Monday', '09:00', '16:00', FALSE),
('service', 1, 'Sunday', NULL, NULL, TRUE);


-- SERVICES

INSERT INTO services (service_name, description, category, url, tags, image_url, published_status, updated_at, created_by, updated_by, location_id)
VALUES
('Health and Dental Plan', 'Information about student health and dental benefits.', 'Student Support', 'https://example.com/health-dental', 'health,dental,insurance', 'https://example.com/images/health.png', TRUE, CURRENT_TIMESTAMP, 4, 4, 2),
('Food Support Program', 'Support options for students facing food insecurity.', 'Wellness', 'https://example.com/food-support', 'food,wellness,support', 'https://example.com/images/food.png', TRUE, CURRENT_TIMESTAMP, 4, 4, 2),
('Academic Advocacy', 'Help with academic concerns, appeals, and student rights.', 'Academic', 'https://example.com/advocacy', 'academic,appeals,rights', 'https://example.com/images/advocacy.png', TRUE, CURRENT_TIMESTAMP, 4, 4, 2);


-- EVENTS

INSERT INTO events (title, description, event_date, start_time, end_time, location_id, organizer, image_url, event_type, capacity, tags, published_status, updated_at, created_by, updated_by)
VALUES
('Welcome Week Booth', 'Meet SAMRU and learn about student services.', '2026-01-12', '10:00', '14:00', 5, 'SAMRU', 'https://example.com/images/welcome-week.png', 'campus', 200, 'welcome,students', TRUE, CURRENT_TIMESTAMP, 4, 4),
('Free Breakfast Day', 'Free breakfast for students while supplies last.', '2026-02-05', '08:30', '10:30', 1, 'SAMRU', 'https://example.com/images/breakfast.png', 'food', 150, 'food,free,event', TRUE, CURRENT_TIMESTAMP, 4, 4),
('Resume Review Drop-In', 'Get feedback on your resume from student support staff.', '2026-03-18', '13:00', '16:00', 4, 'Career Services', 'https://example.com/images/resume.png', 'career', 40, 'career,resume,drop-in', TRUE, CURRENT_TIMESTAMP, 4, 4);


-- COUPONS

INSERT INTO coupons (vendor_id, semester_id, title, description, terms, start_at, expires_at, status, image_url, redemption_limit_type, max_redemptions_total, max_redemptions_per_student, published_status, updated_at, created_by, updated_by)
VALUES
(1, 1, '10% Off Coffee', 'Get 10% off any regular drink.', 'Valid once per student for Winter 2026.', '2026-01-08 00:00:00', '2026-04-30 23:59:59', 'active', 'https://example.com/images/coffee-coupon.png', 'semester', 1000, 1, TRUE, CURRENT_TIMESTAMP, 4, 4),
(2, 1, 'Free Fries', 'Free fries with any burger purchase.', 'Must show redemption code at checkout.', '2026-01-08 00:00:00', '2026-04-30 23:59:59', 'active', 'https://example.com/images/fries-coupon.png', 'semester', 500, 1, TRUE, CURRENT_TIMESTAMP, 4, 4),
(3, 1, 'Student Haircut Deal', 'Save $5 on a student haircut.', 'Appointment required.', '2026-01-15 00:00:00', '2026-04-30 23:59:59', 'active', 'https://example.com/images/haircut-coupon.png', 'semester', 300, 1, TRUE, CURRENT_TIMESTAMP, 4, 4),
(4, 1, '15% Off Used Textbooks', 'Save on used textbooks and study guides.', 'Used books only.', '2026-01-08 00:00:00', '2026-04-30 23:59:59', 'active', 'https://example.com/images/books-coupon.png', 'semester', 700, 1, TRUE, CURRENT_TIMESTAMP, 4, 4);


-- REDEMPTIONS

INSERT INTO redemptions (coupon_id, user_id, semester_id, redeemed_at, vendor_confirmed_at, confirmed_by_vendor_user_id, vendor_confirmation_code, redemption_code, status)
VALUES
(1, 1, 1, CURRENT_TIMESTAMP, NULL, NULL, 'COFFEE-VERIFY-001', 'COFFEE-ALEX-001', 'pending_vendor_confirmation'),
(2, 2, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 6, 'BURGER-VERIFY-002', 'FRIES-SARA-002', 'confirmed'),
(3, 3, 1, CURRENT_TIMESTAMP, NULL, NULL, 'CUTS-VERIFY-003', 'CUTS-JAMIE-003', 'pending_vendor_confirmation');


-- DEVICE TOKENS

INSERT INTO device_tokens (user_id, device_token, platform, last_seen_at)
VALUES
(1, 'fake_device_token_alex_ios', 'ios', CURRENT_TIMESTAMP),
(2, 'fake_device_token_sara_android', 'android', CURRENT_TIMESTAMP),
(3, 'fake_device_token_jamie_ios', 'ios', CURRENT_TIMESTAMP);


-- NOTIFICATION TOPICS

INSERT INTO notification_topics (name, description, active_status, is_optional)
VALUES
('System Announcements', 'Important app updates and system messages.', TRUE, FALSE),
('New Coupons', 'Notifications when new coupons are published.', TRUE, FALSE),
('Event Updates', 'Optional updates about SAMRU events.', TRUE, TRUE),
('Food Support Updates', 'Optional updates about food support resources.', TRUE, TRUE);


-- NOTIFICATION SUBSCRIPTIONS

INSERT INTO notification_subscriptions (user_id, topic_id, status, consented_at, revoked_at)
VALUES
(1, 1, 'subscribed', CURRENT_TIMESTAMP, NULL),
(1, 2, 'subscribed', CURRENT_TIMESTAMP, NULL),
(1, 3, 'subscribed', CURRENT_TIMESTAMP, NULL),
(2, 1, 'subscribed', CURRENT_TIMESTAMP, NULL),
(2, 2, 'subscribed', CURRENT_TIMESTAMP, NULL),
(2, 3, 'revoked', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 1, 'subscribed', CURRENT_TIMESTAMP, NULL),
(3, 2, 'subscribed', CURRENT_TIMESTAMP, NULL);


-- NOTIFICATION LOGS

INSERT INTO notification_logs (topic_id, title, message, notification_type, time_sent, delivery_status)
VALUES
(1, 'App Update', 'A new SAMRU app update is available.', 'system', CURRENT_TIMESTAMP, 'sent'),
(2, 'New Coupon Available', 'Campus Coffee has a new student discount.', 'coupon', CURRENT_TIMESTAMP, 'sent'),
(3, 'Event Reminder', 'Free Breakfast Day is happening tomorrow.', 'event', CURRENT_TIMESTAMP, 'sent');


-- FEEDBACK

INSERT INTO feedback (category, message, sender_email, allow_contact, status, reviewed_at, response_notes, privacy_notice_acknowledged)
VALUES
('Bug Report', 'The coupon page loaded slowly on my phone.', 'alex.chen@mtroyal.ca', TRUE, 'reviewed', CURRENT_TIMESTAMP, 'Marked for performance review.', TRUE),
('Suggestion', 'It would be helpful to filter coupons by food type.', 'sara.ahmed@mtroyal.ca', TRUE, 'new', NULL, NULL, TRUE),
('General', 'The app is easy to navigate so far.', NULL, FALSE, 'new', NULL, NULL, TRUE);


-- AUDIT LOGS

INSERT INTO audit_logs (admin_user_id, table_name, record_id, action, change_summary, old_value_summary, new_value_summary, retention_until)
VALUES
(4, 'coupons', 1, 'CREATE', 'Created Campus Coffee coupon.', NULL, '10% Off Coffee coupon active.', '2027-01-01'),
(4, 'events', 2, 'UPDATE', 'Updated Free Breakfast Day event capacity.', 'Capacity 100', 'Capacity 150', '2027-01-01'),
(4, 'services', 1, 'CREATE', 'Created Health and Dental Plan service.', NULL, 'Published service record.', '2027-01-01');


-- APP EVENTS

INSERT INTO app_events (event_type, entity_type, entity_id, session_id)
VALUES
('page_view', 'coupon', 1, 'session_alex_001'),
('coupon_redeemed', 'coupon', 1, 'session_alex_001'),
('page_view', 'event', 2, 'session_sara_002'),
('notification_opened', 'notification', 2, 'session_jamie_003');
