\connect recipes-example;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

/*Create user table in public schema*/
CREATE TABLE public.user (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE public.user IS
'Users.';

/*Create recipes table in public schema*/
CREATE TABLE public.recipes (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    title TEXT NOT NULL,
    content JSONB NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    author_id uuid NOT NULL REFERENCES public.user(id)
);

COMMENT ON TABLE public.recipes IS
'Recipess written by a user.';

CREATE TABLE public.ingredient_types (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    description TEXT
);

COMMENT ON TABLE public.ingredient_types IS
'ingredient types like fruites vegetables.';


CREATE TABLE public.ingredients (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    type_id uuid REFERENCES public.ingredient_types(id)
);

COMMENT ON TABLE public.ingredients IS
'Ingredients used in recipes.';

CREATE TABLE public.units (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    description TEXT
);

COMMENT ON TABLE public.units IS
'Ingredients quantity units.';

CREATE TABLE public.recipes_ingredients (
    ingredient_id uuid NOT NULL,
    recipe_id uuid NOT NULL,
    quantity INT,
	unit_id uuid REFERENCES units (id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients (id) ON DELETE CASCADE,
    FOREIGN KEY (recipe_id) REFERENCES recipes (id) ON DELETE CASCADE,
    PRIMARY KEY (ingredient_id, recipe_id)
);

COMMENT ON TABLE public.recipes_ingredients IS
'Ingredients recipes connection.';

