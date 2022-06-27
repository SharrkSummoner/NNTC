create table cities
(
	city_number int not null auto_increment,
	title varchar(100),
	primary key (city_number)
);

create table details
(
	detail_number int not null auto_increment,
	title varchar(100) not null,
	material varchar(100) not null,
	weight int not null,
	primary key (detail_number)
);

create table providers
(
	provider_number int not null auto_increment,
	title varchar(100) not null,
	city_number int not null,
	primary key (provider_number),
	foreign key (city_number) references cities(city_number) on delete cascade on update cascade
);

create table projects
(
	project_number int not null auto_increment,
	title varchar(100) not null,
	city_number int not null,
	primary key (project_number),
	foreign key (city_number) references cities(city_number) on delete cascade on update cascade
);

create table deliveries
(
	project_number int not null,
	provider_number int not null,
	detail_number int not null,
	amount int not null,
	price int not null,
	foreign key (project_number) references projects(project_number) on delete cascade on update cascade,
	foreign key (provider_number) references providers(provider_number) on delete cascade on update cascade,
	foreign key (detail_number) references details(detail_number) on delete cascade on update cascade
);

insert into cities values(1, 'Владивосток'), (2, 'Краснодар'), (3, 'Москва'), (4, 'Мулино'), (5, 'Смолино');
insert into details values(1, 'Балка', 'Сталь', 50), (2, 'Арматура', 'Сталь', 2), (3, 'Труба', 'Полипропилен', 1), (4, 'Облицовочное покрытие', 'Пластик', 1), (5, 'Доски половые', 'Береза', 3);
insert into providers values(1, 'ГлавМеталСток', 3), (2, 'МДПЗ', 3), (3, 'ПластикСтрой', 1), (4, 'СуперСтройМатериал', 5), (5, 'ЗаводИмениИльина', 4);
insert into projects values(1, 'ТЦ Снегирь', 2), (2, 'Развлекательный комплекс Аврора', 5), (3, 'Мемориял дню памяти солдат', 4), (4, 'Развлекательная IT площадка', 3), (5, 'ЖК Северный', 3);

insert into deliveries values(1, 2, 1, 50, 10000), (1, 2, 4, 35, 200), (1, 4, 3, 100, 35000), (2, 2, 1, 50, 10000), (3, 4, 3, 100, 35000);

CREATE FUNCTION providers_city_count(project_name varchar(100))
RETURNS integer
BEGIN
	DECLARE cities_count integer;
	SELECT DISTINCT COUNT(providers.city_number) INTO cities_count from providers where
    providers.provider_number in 
    (
        SELECT deliveries.provider_number FROM projects, deliveries WHERE
        projects.title = project_name AND projects.project_number =
        deliveries.project_number GROUP BY deliveries.provider_number
    );
    RETURN cities_count;
END//

CREATE FUNCTION projects_city_count(provider_name varchar(100))
RETURNS integer
BEGIN
	DECLARE cities_count integer;
	SELECT DISTINCT COUNT(projects.city_number) INTO cities_count from projects where
    projects.project_number in 
    (
        SELECT deliveries.project_number FROM providers, deliveries WHERE
        providers.title = provider_name AND providers.provider_number =
        deliveries.provider_number GROUP BY deliveries.project_number
    );
    RETURN cities_count;
END//

CREATE FUNCTION detail_city_count(detail_name varchar(100))
RETURNS integer
BEGIN
	DECLARE cities_count integer;
	SELECT DISTINCT COUNT(providers.city_number) INTO cities_count from providers where
    providers.provider_number in 
    (
        SELECT deliveries.provider_number FROM details, deliveries WHERE
        details.title = detail_name AND details.detail_number =
        deliveries.detail_number GROUP BY deliveries.provider_number
    );
    RETURN cities_count;
END//

CREATE PROCEDURE providers_all_information()
BEGIN
SELECT providers.title, (SELECT COUNT(DISTINCT projects.city_number) 
                         FROM projects, deliveries
                         WHERE projects.project_number = deliveries.project_number 
                         AND deliveries.provider_number = providers.provider_number)
                         FROM providers;
END//

CREATE PROCEDURE projects_all_information()
BEGIN
SELECT projects.title, (SELECT COUNT(DISTINCT providers.city_number) 
                         FROM providers, deliveries
                         WHERE providers.provider_number = deliveries.project_number 
                         AND deliveries.provider_number = projects.project_number)
                         FROM projects;
END//
