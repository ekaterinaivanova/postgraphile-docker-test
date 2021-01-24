\connect recipes-example;

-- USER
INSERT INTO public."user" (id, first_name, last_name, email, created_date) OVERRIDING SYSTEM VALUE VALUES ('68c41d48-e429-4071-95a5-b9026ab112b6', 'Ekaterina', 'Ivanova', 'test@test.te', '2021-01-19 20:10:13.555932');

INSERT INTO public."ingredient_types" (id, name) OVERRIDING SYSTEM VALUE VALUES ('71816671-fc94-47e2-9faf-6c07f0b01f78', 'root vegetable');
INSERT INTO public."ingredient_types" (id, name) OVERRIDING SYSTEM VALUE VALUES ('61ffb024-ada0-412b-b8df-1c0624053362', 'fruit');
INSERT INTO public."ingredient_types" (id, name) OVERRIDING SYSTEM VALUE VALUES ('cef5ae90-fa09-4d64-93f3-0b0bd05c65a2', ' dairy');

-- INGREDIENTS
INSERT INTO public.ingredients (id, name, type_id) OVERRIDING SYSTEM VALUE VALUES ('bc2de2f3-c84b-4d50-a1e0-bb0533a45710', 'potato', '71816671-fc94-47e2-9faf-6c07f0b01f78');
INSERT INTO public.ingredients (id, name, type_id) OVERRIDING SYSTEM VALUE VALUES ('7a6595bf-e825-4c46-94a4-af6f8409e9a5', 'apple', '61ffb024-ada0-412b-b8df-1c0624053362');
INSERT INTO public.ingredients (id, name, type_id) OVERRIDING SYSTEM VALUE VALUES ('5251cd31-5903-49c8-8983-80d4c5d23c6b', 'milk', 'cef5ae90-fa09-4d64-93f3-0b0bd05c65a2');

-- RECIPES
INSERT INTO public.recipes (id, title, content, created_date, author_id) OVERRIDING SYSTEM VALUE VALUES ('dc780e9c-d42e-4339-bfc8-3351caa7cf2e', 'Test', '"{\"Korak 1\":test,\"korak2\":test}"', '2021-01-19 20:10:47.356995', '68c41d48-e429-4071-95a5-b9026ab112b6');

-- UNITS
INSERT INTO public.units (id, name, description) OVERRIDING SYSTEM VALUE VALUES ('97907b91-8592-4b63-a876-58441074c50d', 'kg', NULL);
INSERT INTO public.units (id, name, description) OVERRIDING SYSTEM VALUE VALUES ('a2429ebc-5fa1-41d9-a3b4-92a7e5ae1277', 'g', 'gram');
INSERT INTO public.units (id, name, description) OVERRIDING SYSTEM VALUE VALUES ('800eed54-9557-4702-9fed-5c759dc3931b', 'ml', 'Milliliter');

-- RECIPE INGREDIENTS
INSERT INTO public."recipes_ingredients" (ingredient_id, recipe_id, quantity, unit_id) VALUES ('7a6595bf-e825-4c46-94a4-af6f8409e9a5', 'dc780e9c-d42e-4339-bfc8-3351caa7cf2e', 200, 'a2429ebc-5fa1-41d9-a3b4-92a7e5ae1277');
INSERT INTO public."recipes_ingredients" (ingredient_id, recipe_id, quantity, unit_id) VALUES ('bc2de2f3-c84b-4d50-a1e0-bb0533a45710', 'dc780e9c-d42e-4339-bfc8-3351caa7cf2e', 1, '97907b91-8592-4b63-a876-58441074c50d');
INSERT INTO public."recipes_ingredients" (ingredient_id, recipe_id, quantity, unit_id) VALUES ('5251cd31-5903-49c8-8983-80d4c5d23c6b', 'dc780e9c-d42e-4339-bfc8-3351caa7cf2e', 500, '800eed54-9557-4702-9fed-5c759dc3931b');
