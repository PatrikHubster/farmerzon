create table if not exists cars(
	id serial not null
		constraint cars_pkey
			primary key,
	capacity integer
);

INSERT INTO public.cars (id, capacity) VALUES (1, 100);
INSERT INTO public.cars (id, capacity) VALUES (2, 200);
INSERT INTO public.cars (id, capacity) VALUES (3, 300);
INSERT INTO public.cars (id, capacity) VALUES (4, 50);
