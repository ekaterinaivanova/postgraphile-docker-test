\connect recipes-example;

-- USER
INSERT INTO public."user" (id, first_name, last_name, email, created_date) OVERRIDING SYSTEM VALUE VALUES (1, 'Ekaterina', 'Ivanova', 'test@test.te', '2021-01-19 20:10:13.555932');

INSERT INTO public."ingredient_types" (id, name) OVERRIDING SYSTEM VALUE VALUES (1, 'root vegetable');
INSERT INTO public."ingredient_types" (id, name) OVERRIDING SYSTEM VALUE VALUES (2, 'fruit');
INSERT INTO public."ingredient_types" (id, name) OVERRIDING SYSTEM VALUE VALUES (3, ' dairy ');

-- INGREDIENTS
INSERT INTO public.ingredients (id, name, type_id) OVERRIDING SYSTEM VALUE VALUES (1, 'potato', 1);
INSERT INTO public.ingredients (id, name, type_id) OVERRIDING SYSTEM VALUE VALUES (2, 'apple', 2);
INSERT INTO public.ingredients (id, name, type_id) OVERRIDING SYSTEM VALUE VALUES (3, 'milk', 3);

-- RECIPES
INSERT INTO public.recipes (id, title, content, created_date, author_id) OVERRIDING SYSTEM VALUE VALUES (2, 'Test', '"{\"Korak 1\":test,\"korak2\":test}"', '2021-01-19 20:10:47.356995', 1);

-- UNITS
INSERT INTO public.units (id, name, description) OVERRIDING SYSTEM VALUE VALUES (1, 'kg', NULL);
INSERT INTO public.units (id, name, description) OVERRIDING SYSTEM VALUE VALUES (2, 'g', 'gram');
INSERT INTO public.units (id, name, description) OVERRIDING SYSTEM VALUE VALUES (3, 'ml', 'Milliliter');

-- RECIPE INGREDIENTS
INSERT INTO public."recipes_ingredients" (ingredient_id, recipe_id, quantity, unit_id) VALUES (2, 2, 200, 2);
INSERT INTO public."recipes_ingredients" (ingredient_id, recipe_id, quantity, unit_id) VALUES (1, 2, 1, 1);
INSERT INTO public."recipes_ingredients" (ingredient_id, recipe_id, quantity, unit_id) VALUES (3, 2, 500, 3);
